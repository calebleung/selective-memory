---------------------------------------------------------------------
-- Invisible Inc. official DLC.
--
local util = include( "modules/util" )
local commondefs = include( "sim/unitdefs/commondefs" )
local simdefs = include( "sim/simdefs" )

local tool_templates =
{
    -- Since achievements currently aren't being reset, 
    -- we need a different way to disable the achievement hijack.
    augment_achievement_hijack = util.extend( commondefs.augment_template )
    {
        name = "Selective Memory Mod",
        desc = "You should never see this.",
        flavor = "",   

        soldAfter = math.maxinteger,
        ITEM_LIST = true,
        WEAPON_LIST = false,
        AUGMENT_LIST = false,
        --profile_icon = "gui/icons/item_icons/items_icon_small/icon-item_generic_arm_small.png",
        --profile_icon_100 = "gui/icons/item_icons/icon-item_generic_arm.png",                
    },  


}

-- Reassign key name to value table.
for id, template in pairs(tool_templates) do
    template.id = id
end

return tool_templates


















