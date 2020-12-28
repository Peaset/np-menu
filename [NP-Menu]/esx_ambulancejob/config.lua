Config                            = {}

Config.DrawDistance               = 20.0

Config.Marker                     = { type = 27, x = 1.5, y = 1.5, z = 0.5, r = 0, g = 255, b = 0, a = 100, rotate = false }

Config.ReviveReward               = 200  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 5 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 15 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 500

Config.RespawnPoint = { coords = vector3(355.69, -596.26, 28.28), heading = 249.56 }

Config.RespawnPoint = { coords = vector3(306.68, -590.3, 43.29), heading = 71.03 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(310.6, -591.96, 43.29),
			sprite = 61,
			scale  = 0.8,
			color  = 1
		},

		AmbulanceActions = {
			vector3(1823.4, 3689.46, 39.83)
		},

		Vehicles = {
			{
				Spawner = vector3(293.06, -600.72, 43.3),
				InsideShop = vector3(295.05, -609.76, 43.34),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(295.05, -609.76, 43.34), heading = 70.48, radius = 4.0 },
					{ coords = vector3(292.65, -612.9, 43.4), heading = 70.48, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(338.82, -587.04, 74.17),
				InsideShop = vector3(352.2, -588.54, 74.17),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(351.84, -587.01, 74.17), heading = 269.75, radius = 10.0 }
				}
			}
		},

		FastTravels = {
		    
		},

		FastTravelsPrompt = {
		}

	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 10},
		{ model = 'dodgeems', label = 'Dodge', price = 10}
	},

	doctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 10},
		{ model = 'dodgeems', label = 'Dodge', price = 10}
	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 10},
		{ model = 'dodgeems', label = 'Dodge', price = 10}
	},

	boss = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 10},
		{ model = 'dodgeems', label = 'Dodge', price = 10}
	}
}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {},

	chief_doctor = {
		{ model = 'polmav', label = 'PolMav', price = 20 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 10 }
	},

	boss = {
		{ model = 'polmav', label = 'PolMav', price = 20 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 10 }
	}

}