local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")
local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")



planet_map_gen.apia = function()
  return
  {
    property_expression_names =
    {
      elevation = "apia_elevation",
      temperature = "apia_temperature",
      moisture = "apia_moisture",
      aux = "apia_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
    },
    cliff_settings = {},
    autoplace_controls =
	{
		["apia_soil"] = { },
	},
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
			["apia-biome1"] = {},
			["apia-biome2"] = {},
			["apia-biome3"] = {},
			["apia-biome4"] = {},
			["apia-biome5"] = {},
			["apia-biome6"] = {},
			["royal-jelly-lake"] = {},
			["royal-jelly-lake2"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
		
        }
      },
      ["entity"] =
      {
        settings =
        {
			["larvae"] = {},
			["wild-hive"] = {},
			["honey-mushroom"] = {},
        }
      }
    }
  }
end

planet_map_gen.carnova = function()
  return
  {
    property_expression_names =
    {
      elevation = "carnova_elevation",
      temperature = "carnova_temperature",
      moisture = "carnova_moisture",
      aux = "carnova_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
	  ["entity:bones:probability"] = "carnova_bones_probability",
      ["entity:bones:richness"] = "carnova_bones_richness",
	  ["entity:lymph:probability"] = "carnova_lymph_brine_probability",
      ["entity:lymph:richness"] = "carnova_lymph_brine_richness",
	  enemy_base_radius = "carnova_enemy_base_radius",
      enemy_base_frequency = "carnova_enemy_base_frequency",
    },
    cliff_settings = {},
    autoplace_controls =
    {
		["bones"] = {},
		["lymph"] = {},
		["carnova_enemy_base"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
			["carnova-biome1"] = {},
			["carnova-biome2"] = {},
			["carnova-biome3"] = {},
			["carnova-biome4"] = {},
			["blood-lake1"] = {},
			["blood-lake2"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
			
        }
      },
      ["entity"] =
      {
        settings =
        {
			["lymph-brine"] = {},
			["bones"] = {},
			["flesh-antenna"] = {},
			["bone-nodes"] = {},
			["flesh-tree"] = {},
			["piranha-spawner"] = {},
        }
      }
    }
  }
end