----------------------------------------------------------------
-- Selective Memory
-- Based on state-signup.lua
-- SPY SOCIETY.
----------------------------------------------------------------

local modalDialog = include( "states/state-modal-dialog" )
local mui = include("mui/mui")
local array = include( "modules/array" )
local util = include("client_util")
local serverdefs = include( "modules/serverdefs" )
local guiex = include( "guiex" )
local cdefs = include("client_defs")

local stateLevelSelect = {}
local SITUATIONS = serverdefs.SITUATIONS
local MAP_LOCATIONS = serverdefs.MAP_LOCATIONS

----------------------------------------------------------------
--

local function validateSeed( levelSeed )
    -- Seed has to be a number
    local pattern = "^%d+$"
    if levelSeed:match( pattern ) == nil or #levelSeed ~= 10 then
        return false, STRINGS.SELECTIVE_MEMORY.ERRORS.SEED
    end

    return true
end

----------------------------------------------------------------

stateLevelSelect.onClickCancel = function( self )
    statemgr.deactivate( self )

    local user = savefiles.getCurrentGame()
    local campaign = user.data.saveSlots[ user.data.currentSaveSlot ]

    local stateMapScreen = include( "states/state-map-screen" )
    statemgr.activate( stateMapScreen(), campaign, self.suppress_map_intro )
end


stateLevelSelect.onClickOk = function( self )

    local levelSeed = self.levelSeedBox:getText()
    local valid, err = validateSeed( levelSeed )

    local mapLocation = self.screen.binder.locationCmb:getIndex()
    local situationName = self.screen.binder.situationCmb:getText()
    local missionCount = tonumber( self.screen.binder.missionCountCmb:getText() )


    if not valid then
        modalDialog.show( err )
        return
    end

    if not mapLocation then
        modalDialog.show( STRINGS.SELECTIVE_MEMORY.ERRORS.LOCATION )
        return
    end

    if not situationName or #situationName == 0 then
        modalDialog.show( STRINGS.SELECTIVE_MEMORY.ERRORS.SITUATION )
        return
    end

    if not missionCount then
        modalDialog.show( STRINGS.SELECTIVE_MEMORY.ERRORS.MISSION_COUNT )
        return
    end

    log:write( "Using new level seed..." )
    statemgr.deactivate( self )
    local user = savefiles.getCurrentGame()
    local campaign = user.data.saveSlots[ user.data.currentSaveSlot ]
    if campaign then
        local version = include( "modules/version" )
        campaign.seed = levelSeed
        campaign.situation = {}
        campaign.situation.name = situationName
        campaign.situation.difficulty = 1
        campaign.situation.mapLocation = mapLocation     -- location matters to seed up to corporation, not location-location
        campaign.missionCount = missionCount -- Mission count affects guard and prop placement (but only if it's the first mission?)
        campaign.uiMemento = nil
        campaign.sim_history = nil
        campaign.missionVersion = version.VERSION
        user:save()
    end
    local stateLoading = include( "states/state-loading" )
    stateLoading:loadCampaign( campaign )
end

----------------------------------------------------------------
stateLevelSelect.onLoad = function ( self, dataPath, suppress_map_intro )
    self.suppress_map_intro = suppress_map_intro

    MOAIFmodDesigner.playSound(  cdefs.SOUND_HUD_MENU_POPUP )
    local user = savefiles.getCurrentGame()

    self.screen = mui.createScreen( "modal-level-select.lua" )
    mui.activateScreen( self.screen )

    self.levelSeedBox = self.screen:findWidget("levelSeedBox")

    for situationName, situationValue in pairs( SITUATIONS ) do
        self.screen.binder.situationCmb:addItem( situationValue.tags[1] )
    end

    for i = 1, #MAP_LOCATIONS do
        self.screen.binder.locationCmb:addItem( MAP_LOCATIONS[i].name .. " (" .. MAP_LOCATIONS[i].corpName .. ")" )
    end

    for i = 0, 30 do
        self.screen.binder.missionCountCmb:addItem( tostring(i) )
    end

    self.screen.binder.cancelBtn.binder.btn.onClick = util.makeDelegate(self, "onClickCancel")
    self.screen.binder.cancelBtn.binder.btn:setClickSound(cdefs.SOUND_HUD_MENU_CANCEL)
    self.screen.binder.cancelBtn.binder.btn:setText(STRINGS.UI.BUTTON_CANCEL)

    self.screen.binder.okBtn.binder.btn.onClick = util.makeDelegate(self, "onClickOk")
    self.screen.binder.okBtn.binder.btn:setClickSound(cdefs.SOUND_HUD_MENU_CONFIRM)
    self.screen.binder.okBtn.binder.btn:setText(STRINGS.UI.BUTTON_ACCEPT)

end

----------------------------------------------------------------
stateLevelSelect.onUnload = function ( self )
    MOAIFmodDesigner.playSound(  cdefs.SOUND_HUD_MENU_POPDOWN )
    mui.deactivateScreen( self.screen )
    self.screen = nil
end

return stateLevelSelect
