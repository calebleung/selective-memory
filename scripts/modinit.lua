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
        if allStates[i].name == "maproot" then
            statemgr.deactivate( allStates[i] ) -- not working?
        end
    end

    stateLoading.loadLevelSelectScreen = function( self, suppress_map_intro )
        local stateLevelSelect = include( scriptPath .. "/client/states/state-level-select" )
        statemgr.activate( stateLoading, stateLoading:runUnloadThread, stateLevelSelect, dataPath, suppress_map_intro )
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
    achievementHijack.time_check = npc_abilities

    setmetatable( achievementHijack, {__index =
        function( t, k )
            if k == "time_check" then
                return loadLevelSelect( dataPath, scriptPath )
            end
        end
    } )

    modApi:addAchievement( achievementHijack )
      
    local scriptPath = modApi:getScriptPath()  
    modApi:addAbilityDef( "voight_scan", scriptPath .."/voight_scan" )
    
    modApi:addGenerationOption("agentsAndItems", STRINGS.XMPL.OPTIONS.ENABLE_AGENTS , STRINGS.XMPL.OPTIONS.ENABLE_AGENTS_TIP)
    modApi:addGenerationOption("programs", STRINGS.XMPL.OPTIONS.PROGRAMS , STRINGS.XMPL.OPTIONS.PROGRAMS_TIP)
    modApi:addGenerationOption("daemons", STRINGS.XMPL.OPTIONS.DAEMONS , STRINGS.XMPL.OPTIONS.DAEMONS_TIP)
    --[[

    local logs = include( scriptPath .. "/logs" )
    for i,log in ipairs(logs) do      
        modApi:addLog(log)
    end

    ]]
end

-- load may be called multiple times with different options enabled
local function load( modApi, options )

    local scriptPath = modApi:getScriptPath()

  
    if options["agentsAndItems"].enabled then
        local agentdefs = include( scriptPath .. "/agentdefs" )
        for name, agentDef in pairs(agentdefs) do
            modApi:addAgentDef( name, agentDef, { name } )
        end
        
        local itemdefs = include( scriptPath .. "/itemdefs" )
        for name, itemDef in pairs(itemdefs) do
            modApi:addItemDef( name, itemDef )
        end        
    end
   

    if options["programs"].enabled then
        local mainframe_abilities = include( scriptPath .. "/mainframe_abilities" )
        for name, ability in pairs(mainframe_abilities) do
            modApi:addMainframeAbility( name, ability )
        end
    end  

    if options["daemons"].enabled then
        local npc_abilities = include( scriptPath .. "/npc_abilities" )
        for name, ability in pairs(npc_abilities) do
            modApi:addDaemonAbility( name, ability )
        end    
    end
    
end

return {
    init = init,
    load = load,
}
