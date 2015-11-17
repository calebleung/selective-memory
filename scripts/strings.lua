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
		LOCATION = "Location",
		SITUATION = "Situation",
		MISSION_COUNT = "Mission count",
	},

	OPTIONS =
	{
		ENABLE_LEVEL_SELECT = "Enable level select",
		ENABLE_LEVEL_SELECT_TIP = "Level select allows you to play any mission at any time.",
	}

	AGENTS =
	{
		BRYANT = {
			NAME = "BRYANT",
			FILE = "REF PLAS-D EE 02891",
			YEARS_OF_SERVICE = "??",
			AGE = "40",
			HOMETOWN = "Los Angeles",
			RESCUED = "I was quit when I came in here..",
			BIO_SPOKEN = "",

			ALT_1 = {
				FULLNAME = 'BRYANT DECKER',
				BIO = "Funded by the Plastech corporation to head up a task force that finds and 'retires' rogue Modded personel, Bryant's carrer choice may have something to do with his brother's declining disposition .",
				TOOLTIP = "Modded Detector Captain",
			},

			BANTER = {
				START ={
					"Let's spot 'em and air 'em out.",
				},
				FINAL_WORDS =
				{
					"If you're not cop, you're little people!",		
					"I'm twice as quit now.",	
				},
			},				
		},	

	},

	ITEMS =
	{
			DECKERS = "Voight Scanner",
			DECKERS_TIP = "Observes a unit and TAGs them for 2 PWR",
			DECKERS_FLAVOR = "An eye overlay atachment that helped Decker detect when clients were lying.",

			BRYANTS = "Bryant's Subdermal PDA",
			BRYANTS_FLAVOR = "Bryant chose his PDA's data carrier because it came pre installed.",

			SUBDERMAL_PDA = "Subdermal PDA",
			SUBDERMAL_PDA_TIP = "Door peeks have full vision.\nThis agent can find corporate Intel in large safes.",    
			SUBDERMAL_PDA_FLAVOR = "Allows for a higher attention to detail as well as custom data filters for isolating important info faster.",    	
 	},

 	ABILITIES = 
 	{
 		VOIGHT_SCAN = "Voight scan",
 		VOIGHT_SCAN_DESC = "Observe and Tag a unit for 2 PWR",
	},

	LANCE =
	{
		NAME = "LANCE",
		DESC = "Breaks {1} firewalls for 2 PWR.\n-1 firewall per use.",
		HUD_DESC = "BREAKS FIREWALLS\nSTARTS AT 5 FIREWALLS\n-1 FIREEWALL PER USE",
		SHORT_DESC = "BREAKS FIREWALLS THEN WEAKENS.",
		TIP_DESC = "",
	},

	INFECT= 
	{
		NAME = "INFECT",
		DESC = "Slows an agent by 4 AP each turn",
		SHORT_DESC = "Slows an agent",
		ACTIVE_DESC = "Slows a random agent by 4 AP each turn",
		WARNING = "INFECTED\n-4AP"
	},

	UI = 
	{
		ALREADY_TAGGED ="Target is already TAGGED",
	},


}

return DLC_STRINGS
























