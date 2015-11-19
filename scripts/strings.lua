---------------------------------------------------------------------
-- Selective Memory
--

local DLC_STRINGS =
{	           
	
	MODAL =
	{
		TITLE = "Selective Memory",
		DESC = "Input seed, location, and situation data to relive memories of an event.",
		SEED = "Seed",
		SEED_TOOLTIP = "10 digit integer",
		LOCATION = "Location",
		LOCATION_TOOLTIP = "Exact location doesn't matter as much as the corporation located there.",
		SITUATION = "Situation",
		SITUATION_TOOLTIP = "What's your mission?",
		MISSION_COUNT = "Mission Count",
		MISSION_COUNT_TOOLTIP = "First mission triggers intro dialog. Other missions can spawn side missions and have different prop/guard/camera positions.",
		DIFFICULTY = "Difficulty",
		DIFFICULTY_TOOLTIP = "Adds extra obstacles to avoid.",
	},

	OPTIONS =
	{
		ENABLE_LEVEL_SELECT = "Enable level select",
		ENABLE_LEVEL_SELECT_TIP = "Allows you to play any mission at any time.",
	},

	ERRORS =
	{
		SEED = "Seed must be a 10-digit integer.",
		LOCATION = "A location must be chosen.",
		SITUATION = "A situation must be selected.",
		DIFFICULTY = "A difficulty value must be selected.",
		MISSION_COUNT = "A mission count must be selected.",
	},

}

return DLC_STRINGS