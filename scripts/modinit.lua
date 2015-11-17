---------------------------------------------------------------------
-- Selective Memory
--
-- A level selection mod by Zetty
--

local util = include( "modules/util" )

local enableLevelSelect = false
local isHijacked = false

local function loadLevelSelect( dataPath, scriptPath )

    log:write( 'level select is ' .. tostring(enableLevelSelect) )

    local simstore = include( "sim/units/store" )

    for i = #simstore.STORE_ITEM.itemList, 1, -1 do
        if simstore.STORE_ITEM.itemList[i].augment_achievement_hijack then
            enableLevelSelect = true
        end
    end

    if enableLevelSelect then
        local stateLoading = include( "states/state-loading" )

        local allStates = statemgr.getStates()

        for i = 1, #allStates do
            if allStates[i].jet then
                statemgr.deactivate( allStates[i] )
            end
        end

        stateLoading.loadLevelSelectScreen = function( dataPath, suppress_map_intro )
            local stateLevelSelect = include( scriptPath .. "/client/states/state-level-select" )
            statemgr.activate( stateLevelSelect, dataPath, suppress_map_intro )
        end

        isHijacked = false
        stateLoading:loadLevelSelectScreen( dataPath, true )
    end

    return 1
end

-- init will be called once
local function init( modApi )

    log:write("init: level-select")
    local dataPath = modApi:getDataPath()
    local scriptPath = modApi:getScriptPath()
    
    -- Mount data.
    KLEIResourceMgr.MountPackage( dataPath .. "/gui.kwad", "data" )

    -- Load DLC strings.  Must occur before anything else, to avoid non-localized string references.
    -- We always localize to the current locale.
    local DLC_STRINGS = include( scriptPath .. "/strings" )
    modApi:addStrings( dataPath, "SELECTIVE_MEMORY", DLC_STRINGS )

    -- Achievement checks happen on the map screen.
    -- The perfect time to select a level.
    local achievementHijack = {}
    achievementHijack.achievementID = 1
    achievementHijack.time_check = nil

    setmetatable( achievementHijack, {__index =
        function( t, k )
            if k == "time_check" then
                log:write( 'cheevo check!' )
                if not isHijacked then
                    isHijacked = true
                    return loadLevelSelect( dataPath, scriptPath )
                end

                return 1
            end
        end
    } )

    modApi:addAchievement( achievementHijack )

    modApi:addGenerationOption("levelSelect", STRINGS.SELECTIVE_MEMORY.OPTIONS.ENABLE_LEVEL_SELECT , STRINGS.SELECTIVE_MEMORY.OPTIONS.ENABLE_LEVEL_SELECT_TIP)

    local itemdefs = include( scriptPath .. "/itemdefs" )
    for name, itemDef in pairs(itemdefs) do
        modApi:addItemDef( name, itemDef )
    end  

end

-- load may be called multiple times with different options enabled
local function load( modApi, options )

    if options["levelSelect"].enabled then
        --enableLevelSelect = true
    end
    
end

return {
    init = init,
    load = load,
}
