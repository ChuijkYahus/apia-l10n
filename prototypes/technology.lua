local apia_utils = require("lib")


data:extend(
{
  {
    type = "technology",
    name = "planet-discovery-apia-carnova",
    icons = util.technology_icon_constant_planet("__apia__/graphics/technology/apia.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "apia-carnova-orbit",
        use_icon_overlay_constant = true
      },
	  {
        type = "unlock-space-location",
        space_location = "apia",
        use_icon_overlay_constant = true
      },
	  {
        type = "unlock-space-location",
        space_location = "carnova",
        use_icon_overlay_constant = true
      },
    },
    prerequisites = {"agricultural-science-pack"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
		{"agricultural-science-pack", 1},
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "parasites",
    icon = "__apia__/graphics/technology/parasites.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "larvae-cultivation"
      },
	  {
        type = "unlock-recipe",
        recipe = "fossil-larvae-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "biosynthesizer-apia"
      }
    },
    prerequisites = {"planet-discovery-apia-carnova"},
    research_trigger =
    {
      type = "mine-entity",
	  entities =
	  {
		"larvae"
	  }
    }
  },
  {
    type = "technology",
    name = "phosphorus",
    icon = "__apia__/graphics/technology/phosphorus.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "phosphoric-acid"
      },
	  {
        type = "unlock-recipe",
        recipe = "rocket-fuel-from-phosphoric-acid"
      },
	  {
        type = "unlock-recipe",
        recipe = "processing-unit-from-phosphoric-acid"
      },
	  {
        type = "unlock-recipe",
        recipe = "flamethrower-ammo-from-phosphorus"
      },
	  {
        type = "unlock-recipe",
        recipe = "battery-from-phosphoric-acid"
      },
    },
    prerequisites = {"planet-discovery-apia-carnova"},
    research_trigger =
    {
      type = "craft-item",
      item = "phosphorus",
    }
  },
  {
    type = "technology",
    name = "apiculture",
    icon = "__apia__/graphics/technology/apiculture.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "honeycombs-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "honeycombs-copper-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "honeycombs-iron-processing"
      },
    },
    prerequisites = {"planet-discovery-apia-carnova"},
    research_trigger =
    {
      type = "mine-entity",
	  entities =
	  {
		"wild-hive"
	  }
    }
  },
  {
    type = "technology",
    name = "honey-processing",
    icon = "__apia__/graphics/technology/honey-processing.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "nutrients-from-honey"
      },
	  {
        type = "unlock-recipe",
        recipe = "honey-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "honey-dehydration"
      },
	  {
        type = "unlock-recipe",
        recipe = "nutrients-from-polysaccharides"
      },
	  {
        type = "unlock-recipe",
        recipe = "biolubricant-from-royal-jelly"
      },
	  {
        type = "unlock-recipe",
        recipe = "explosives-from-polysaccharides"
      },
    },
    prerequisites = {"apiculture", "parasites"},
    research_trigger =
    {
      type = "craft-item",
      item = "honey",
      count = 10
    }
  },
  {
    type = "technology",
    name = "wax-processing",
    icon = "__apia__/graphics/technology/wax-processing.png",
    icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "bioplastic-from-wax"
      },
	  {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-polysaccharides"
      },
	  {
        type = "unlock-recipe",
        recipe = "wax-platform"
      },
    },
    prerequisites = {"apiculture", "phosphorus"},
    research_trigger =
    {
      type = "craft-item",
      item = "wax",
      count = 10
    }
  },
  {
    type = "technology",
    name = "artificial-hive",
    icon = "__apia__/graphics/technology/artificial-hive.png",
    icon_size = 256,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "artificial-hive"
      },
    },
    prerequisites = {"wax-processing", "honey-processing"},
	research_trigger =
	{
      type = "craft-item",
      item = "polysaccharides",
      count = 10
    }
  },
  {
    type = "technology",
    name = "apicultural-science-pack",
    icon = "__apia__/graphics/technology/apicultural-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "apicultural-science-pack"
      },
    },
    prerequisites = {"artificial-hive", "roe-breeding", "nitroglycerine"},
    research_trigger =
    {
      type = "craft-item",
      item = "artificial-hive",
    }
  },
  {
    type = "technology",
    name = "flamethrower-robot",
    icon = "__apia__/graphics/technology/flamethrower-robot.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "flamethrower-capsule",
      },
    },
    prerequisites = {"apicultural-science-pack", "defender", "flamethrower"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"military-science-pack", 1},
        {"apicultural-science-pack", 1}
      },
      time = 60
    },
  },
  {
    type = "technology",
    name = "bio-solar-panel",
    icon = "__apia__/graphics/technology/bio-solar-panel.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bio-solar-panel",
      },
    },
    prerequisites = {"apicultural-science-pack", "solar-energy"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"production-science-pack", 1},
		{"utility-science-pack", 1},
        {"apicultural-science-pack", 1},
      },
      time = 60
    },
  },
  {
    type = "technology",
    name = "bioreactor",
    icon = "__apia__/graphics/technology/bioreactor.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bioreactor",
      },
    },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"production-science-pack", 1},
		{"utility-science-pack", 1},
        {"apicultural-science-pack", 1},
      },
      time = 60
    },
  },
  {
    type = "technology",
    name = "phosphorus-shell",
    icon = "__apia__/graphics/technology/phosphorus-shell.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "artillery-shell-with-phosphorus",
      },
    },
    prerequisites = {"apicultural-science-pack", "artillery"},
    unit =
    {
      count = 300,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"production-science-pack", 1},
		{"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"apicultural-science-pack", 1},
      },
      time = 60
    },
  },
  {
    type = "technology",
    name = "artificial-apia-soil",
    icon = "__apia__/graphics/technology/artificial-apia-soil.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "artificial-honey-soil",
      },
	  {
        type = "unlock-recipe",
        recipe = "artificial-copper-soil",
      },
	  {
        type = "unlock-recipe",
        recipe = "artificial-iron-soil",
      },
    },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"apicultural-science-pack", 1},
      },
      time = 60
    },
  },
  {
    type = "technology",
    name = "bones-processing",
    icon = "__apia__/graphics/technology/bones-processing.png",
    icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "simple-bone-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "advanced-bone-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "bone-meal-smelting"
      },
	  {
        type = "unlock-recipe",
        recipe = "bone-meal-sieving"
      },
    },
    prerequisites = {"planet-discovery-apia-carnova"},
    research_trigger =
    {
      type = "mine-entity",
	  entities =
	  {
		"bone-nodes"
	  }
    }
  },
  {
    type = "technology",
    name = "lymph-processing",
    icon = "__apia__/graphics/technology/lymph-processing.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "lymph-refining"
      },
	  {
        type = "unlock-recipe",
        recipe = "blood-separation"
      },
    },
    prerequisites = {"flesh-reproduction", "bones-processing"},
    research_trigger =
    {
      type = "mine-entity",
	  entities =
	  {
		"lymph-brine"
	  }
    }
  },
  {
    type = "technology",
    name = "flesh-reproduction",
    icon = "__apia__/graphics/technology/flesh-reproduction.png",
    icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "biosynthesizer-carnova"
      },
      {
        type = "unlock-recipe",
        recipe = "flesh-reproduction"
      },
    },
    prerequisites = {"planet-discovery-apia-carnova"},
    research_trigger =
    {
      type = "mine-entity",
	  entities =
	  {
		"flesh-antenna"
	  }
    }
  },
  {
    type = "technology",
    name = "roe-breeding",
    icon = "__apia__/graphics/technology/roe-breeding.png",
    icon_size = 256,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "roe-reproduction"
      },
    },
    prerequisites = {"flesh-separation"},
    research_trigger =
    {
      type = "craft-item",
      item = "proteins",
	  count = 50,
    }
  },
  {
    type = "technology",
    name = "flesh-separation",
    icon = "__apia__/graphics/technology/flesh-separation.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "flesh-separation"
      },
	  {
        type = "unlock-recipe",
        recipe = "nutrients-from-lipids"
      },
	  {
        type = "unlock-recipe",
        recipe = "nutrients-from-proteins"
      },
    },
    prerequisites = {"lymph-processing"},
    research_trigger =
    {
      type = "craft-item",
      item = "flesh",
    }
  },
  {
    type = "technology",
    name = "nitroglycerine",
    icon = "__apia__/graphics/technology/nitroglycerine.png",
    icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "glycerine"
      },
	  {
        type = "unlock-recipe",
        recipe = "biolubricant-from-glycerine"
      },
      {
        type = "unlock-recipe",
        recipe = "explosives-from-nitroglycerine"
      },
	  {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-glycerine"
      },
	  {
        type = "unlock-recipe",
        recipe = "bioplastic-from-proteins"
      },
    },
    prerequisites = {"flesh-separation", "phosphorus"},
    research_trigger =
    {
      type = "craft-item",
      item = "lipids",
    }
  },
  {
    type = "technology",
    name = "refreshment",
    icon = "__apia__/graphics/technology/refreshment.png",
    icon_size = 128,
    effects = { },
    prerequisites = {"lymph-processing"},
	research_trigger =
    {
      type = "craft-fluid",
      fluid = "lymph",
	  amount = 300,
    }
  },
  {
    type = "technology",
    name = "carbon-fiber-productivity",
    icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/carbon-fiber-productivity.png"),
    PlanetsLib_recipe_productivity_effects = 
	{
        purge_other_effects = true,
        effects = 
		{
            {
                type = "item",
                name = "carbon-fiber",
                change = 0.1
            },
        }
    },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"production-science-pack", 1},
        {"space-science-pack", 1},
		{"agricultural-science-pack", 1},
        {"apicultural-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "agriculture-productivity",
    icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/agriculture-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "yumako-processing",
        change = 0.1
      },
      {
        type = "change-recipe-productivity",
        recipe = "jellynut-processing",
        change = 0.1
      },
    },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"apicultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "honeycomb-processing-productivity",
    icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/honeycomb-processing-productivity.png"),
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "honeycombs-processing",
        change = 0.1
      },
	  {
        type = "change-recipe-productivity",
        recipe = "honeycombs-iron-processing",
        change = 0.1
      },
	  {
        type = "change-recipe-productivity",
        recipe = "honeycombs-copper-processing",
        change = 0.1
      },
    },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count_formula = "1.2^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"apicultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "biter-egg-productivity",
    icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/biter-egg-productivity.png"),
	effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "biter-egg",
        change = 0.1
      },
    },
    prerequisites = {"apicultural-science-pack", "captivity"},
    unit =
    {
      count_formula = "2^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
		{"production-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1},
		{"apicultural-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "lubricant-productivity",
    icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/lubricant-productivity.png"),
    PlanetsLib_recipe_productivity_effects = 
	{
        purge_other_effects = true,
        effects = 
		{
            {
                type = "fluid",
                name = "lubricant",
                change = 0.1
            },
        }
    },
	effects = { },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"production-science-pack", 1},
        {"space-science-pack", 1},
        {"apicultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "flesh-productivity",
	icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/flesh-productivity.png"),
	effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "flesh-separation",
		change = 0.1
      },
    },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count_formula = "1.2^L*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"apicultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "bone-productivity",
	icons = util.technology_icon_constant_productivity("__apia__/graphics/technology/bone-productivity.png"),
    effects =
    {
	  {
        type = "change-recipe-productivity",
        recipe = "simple-bone-processing",
		change = 0.1
      },
	  {
        type = "change-recipe-productivity",
        recipe = "advanced-bone-processing",
		change = 0.1
      },
    },
    prerequisites = {"apicultural-science-pack"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
      {
		{"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"production-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"apicultural-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
})






if settings.startup["apia-vanila-science"].value then
	apia_utils.add_tech_prerequisites("refined-flammables-7", "apicultural-science-pack")
	apia_utils.add_science_pack("refined-flammables-7", { "apicultural-science-pack", 1 })
	apia_utils.add_tech_prerequisites("overgrowth-soil", "apicultural-science-pack")
	apia_utils.add_science_pack("overgrowth-soil", { "apicultural-science-pack", 1 })
	apia_utils.add_tech_prerequisites("stronger-explosives-7", "apicultural-science-pack")
	apia_utils.add_science_pack("stronger-explosives-7", { "apicultural-science-pack", 1 })
end

if settings.startup["apia-science-promethium"].value then
	apia_utils.add_tech_prerequisites("promethium-science-pack", "apicultural-science-pack")
	apia_utils.add_science_pack("promethium-science-pack", { "apicultural-science-pack", 1 })
end

if settings.startup["apia-science-research-productivity"].value then
	apia_utils.add_science_pack("research-productivity", { "apicultural-science-pack", 1 })
end

apia_utils.add_tech_effect("plastic-bar-productivity",
	{ type = "change-recipe-productivity", recipe = "bioplastic-from-wax", change = 0.1 })
  
apia_utils.add_tech_effect("rocket-fuel-productivity",
	{ type = "change-recipe-productivity", recipe = "rocket-fuel-from-phosphoric-acid", change = 0.1 })
	
apia_utils.add_tech_effect("processing-unit-productivity",
	{ type = "change-recipe-productivity", recipe = "processing-unit-from-phosphoric-acid", change = 0.1 })
  