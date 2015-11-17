---------------------------------------------------------------------
-- Invisible Inc. official DLC.
--
-- The function is responsible for initializing the mod and doing whatever
-- the mod needs to do up front.
--

local util = include( "modules/util" )

local function loadLevelSelect( dataPath, scriptPath )
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

    stateLoading:loadLevelSelect( dataPath, true )

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
    modApi:addStrings( dataPath, "XMPL", DLC_STRINGS )

    -- Achievement checks happen on the map screen.
    -- The perfect time to select a level.
    local achievementHijack = {}
    achievementHijack.achievementID = 1
    achievementHijack.time_check = nil

    setmetatable( achievementHijack, {__index =
        function( t, k )
            if k == "time_check" then
                return loadLevelSelect( dataPath, scriptPath )
            end
        end
    } )

    modApi:addAchievement( achievementHijack )

end

-- load may be called multiple times with different options enabled
local function load( modApi, options )
    
end

return {
    init = init,
    load = load,
}
