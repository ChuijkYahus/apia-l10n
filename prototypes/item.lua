local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local simulations = require("__base__.prototypes.factoriopedia-simulations")


data:extend
{
	{
		type = "item",
		name = "raw-larvae",
		icon = "__apia__/graphics/icons/raw-larvae-0.png",
		pictures =
		{
		  { size = 64, filename = "__apia__/graphics/icons/raw-larvae-0.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__apia__/graphics/icons/raw-larvae-1.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__apia__/graphics/icons/raw-larvae-2.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__apia__/graphics/icons/raw-larvae-3.png", scale = 0.5, mipmap_count = 4 },
		},
		subgroup = "apiculture-processes",
		order = "a-a-a[larvae]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		fuel_categories =
		{
			"chemical",
		},
		fuel_value = "2MJ",
		stack_size = 100,
		spoil_ticks = 5 * minute,
		spoil_result = "fossil-larvae",
		default_import_location = "apia",
		weight = 0.5 * kg,
	},
	{
		type = "item",
		name = "fossil-larvae",
		icon = "__apia__/graphics/icons/fossil-larvae.png",
		subgroup = "apiculture-processes",
		order = "a-b-a[fossil]",
		inventory_move_sound = item_sounds.resource_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.resource_inventory_move,
		stack_size = 100,
		default_import_location = "apia",
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "phosphorus",
		icon = "__apia__/graphics/icons/phosphorus.png",
		subgroup = "apia-carnova-products",
		order = "a-a-a[phosphorus]",
		inventory_move_sound = item_sounds.resource_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.resource_inventory_move,
		stack_size = 100,
		default_import_location = "apia",
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "honeycombs",
		icon = "__apia__/graphics/icons/honeycombs.png",
		subgroup = "apiculture-processes",
		order = "a-c-a[honeycombs]-a",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 50,
		default_import_location = "apia",
		spoil_ticks = 60 * minute,
		spoil_result = "spoilage",
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "honeycombs-iron",
		icon = "__apia__/graphics/icons/honeycombs-iron.png",
		subgroup = "apiculture-processes",
		order = "a-c-b[honeycombs]-a",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 50,
		default_import_location = "apia",
		spoil_ticks = 60 * minute,
		spoil_result = "spoilage",
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "honeycombs-copper",
		icon = "__apia__/graphics/icons/honeycombs-copper.png",
		subgroup = "apiculture-processes",
		order = "a-c-c[honeycombs]-a",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 50,
		default_import_location = "apia",
		spoil_ticks = 60 * minute,
		spoil_result = "spoilage",
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "honey",
		icon = "__apia__/graphics/icons/honey.png",
		subgroup = "apiculture-products",
		order = "a-a-a[honey]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 100,
		default_import_location = "apia",
		spoil_ticks = 30 * minute,
		spoil_result = "spoilage",
		weight = 0.5 * kg,
	},
	{
		type = "item",
		name = "wax",
		icon = "__apia__/graphics/icons/wax.png",
		subgroup = "apiculture-products",
		order = "a-b-a[wax]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 100,
		default_import_location = "apia",
		fuel_categories =
		{
			"chemical",
		},
		fuel_value = "2MJ",
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "polysaccharides",
		icon = "__apia__/graphics/icons/polysaccharides.png",
		subgroup = "apiculture-products",
		order = "a-c-a[polysaccharides]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 100,
		default_import_location = "apia",
		weight = 0.5 * kg,
	},
	{
		type = "item",
		name = "artificial-hive",
		icon = "__apia__/graphics/icons/artificial-hive.png",
		subgroup = "apiculture",
		order = "a-a[artificial-hive]",
		inventory_move_sound = item_sounds.fluid_inventory_move,
		pick_sound = item_sounds.fluid_inventory_pickup,
		drop_sound = item_sounds.fluid_inventory_move,
		place_result = "artificial-hive",
		stack_size = 1,
		spoil_ticks = 30 * minute,
		spoil_result = "spoilage",
		default_import_location = "apia",
	},
	{
		type = "item",
		name = "bio-solar-panel",
		icon = "__apia__/graphics/icons/bio-solar-panel.png",
		subgroup = "apiculture",
		order = "a-c[bio-solar-panel]",
		inventory_move_sound = item_sounds.fluid_inventory_move,
		pick_sound = item_sounds.fluid_inventory_pickup,
		drop_sound = item_sounds.fluid_inventory_move,
		place_result = "bio-solar-panel",
		stack_size = 10,
		weight = 20*kg,
		spoil_ticks = 60 * minute,
		spoil_result = "spoilage",
		default_import_location = "apia",
	},
	{
		type = "tool",
		name = "apicultural-science-pack",
		localised_description = {"item-description.science-pack"},
		icon = "__apia__/graphics/icons/apicultural-science-pack.png",
		subgroup = "science-pack",
		color_hint = { text = "AP" },
		order = "i[apia]",
		inventory_move_sound = item_sounds.science_inventory_move,
		pick_sound = item_sounds.science_inventory_pickup,
		drop_sound = item_sounds.science_inventory_move,
		stack_size = 200,
		default_import_location = "carnova",
		weight = 1*kg,
		durability = 1,
		durability_description_key = "description.science-pack-remaining-amount-key",
		factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
		durability_description_value = "description.science-pack-remaining-amount-value",
		spoil_ticks = 1 * hour,
		spoil_result = "spoilage",
		random_tint_color = item_tints.bluish_science
	},
	{
		type = "item",
		name = "artificial-honey-soil",
		icon = "__apia__/graphics/icons/artificial-honey-soil.png",
		subgroup = "terrain",
		order = "c[landfill]-h-a-[artificial-honey-soil]",
		inventory_move_sound = item_sounds.landfill_inventory_move,
		pick_sound = item_sounds.landfill_inventory_pickup,
		drop_sound = item_sounds.landfill_inventory_move,
		stack_size = 100,
		default_import_location = "apia",
		weight = 10*kg,
		place_as_tile =
		{
		  result = "artificial-honey-soil",
		  condition_size = 1,
		  condition = {layers={}},
		  tile_condition = {"apia-biome3"}
		}
	},
	{
		type = "item",
		name = "artificial-copper-soil",
		icon = "__apia__/graphics/icons/artificial-copper-soil.png",
		subgroup = "terrain",
		order = "c[landfill]-h-b-[artificial-copper-soil]",
		inventory_move_sound = item_sounds.landfill_inventory_move,
		pick_sound = item_sounds.landfill_inventory_pickup,
		drop_sound = item_sounds.landfill_inventory_move,
		stack_size = 100,
		default_import_location = "apia",
		weight = 10*kg,
		place_as_tile =
		{
		  result = "artificial-copper-soil",
		  condition_size = 1,
		  condition = {layers={}},
		  tile_condition = {"apia-biome3"}
		}
	},
	{
		type = "item",
		name = "artificial-iron-soil",
		icon = "__apia__/graphics/icons/artificial-iron-soil.png",
		subgroup = "terrain",
		order = "c[landfill]-h-c-[artificial-iron-soil]",
		inventory_move_sound = item_sounds.landfill_inventory_move,
		pick_sound = item_sounds.landfill_inventory_pickup,
		drop_sound = item_sounds.landfill_inventory_move,
		stack_size = 100,
		default_import_location = "apia",
		weight = 10*kg,
		place_as_tile =
		{
		  result = "artificial-iron-soil",
		  condition_size = 1,
		  condition = {layers={}},
		  tile_condition = {"apia-biome3"}
		}
	},
	{
		type = "item",
		name = "wax-platform",
		icon = "__apia__/graphics/icons/wax-platform.png",
		subgroup = "terrain",
		order = "c[landfill]-g[wax-platform]",
		inventory_move_sound = item_sounds.landfill_inventory_move,
		pick_sound = item_sounds.landfill_inventory_pickup,
		drop_sound = item_sounds.landfill_inventory_move,
		stack_size = 100,
		default_import_location = "apia",
		weight = 10*kg,
		place_as_tile =
		{
		  result = "wax-platform",
		  condition_size = 1,
		  condition = {layers={ground_tile=true}},
		  tile_condition = {"royal-jelly-lake", "royal-jelly-lake2"}
		}
	},
	{
		type = "capsule",
		name = "flamethrower-capsule",
		icon = "__apia__/graphics/icons/flamethrower-capsule.png",
		capsule_action =
		{
		  type = "throw",
		  attack_parameters =
		  {
			type = "projectile",
			activation_type = "throw",
			ammo_category = "capsule",
			cooldown = 15,
			projectile_creation_distance = 0.6,
			range = 20,
			ammo_type =
			{
			  target_type = "position",
			  action =
			  {
				{
				  type = "direct",
				  action_delivery =
				  {
					type = "projectile",
					projectile = "flamethrower-capsule",
					starting_speed = 0.3
				  }
				},
				{
				  type = "direct",
				  action_delivery =
				  {
					type = "instant",
					target_effects =
					{
					  {
						type = "play-sound",
						sound = sounds.throw_projectile
					  }
					}
				  }
				}
			  }
			}
		  }
		},
		subgroup = "capsule",
		order = "d[flamethrower]-b[capsule]",
		inventory_move_sound = item_sounds.robotic_inventory_move,
		pick_sound = item_sounds.robotic_inventory_pickup,
		drop_sound = item_sounds.robotic_inventory_move,
		stack_size = 100,
		weight = 10*kg
	},
	{
		type = "ammo",
		name = "artillery-shell-with-phosphorus",
		icon = "__apia__/graphics/icons/artillery-shell-with-phosphorus.png",
		ammo_category = "artillery-shell",
		ammo_type =
		{
		  target_type = "position",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "artillery",
			  projectile = "artillery-projectile-with-phosphorus",
			  starting_speed = 1,
			  direction_deviation = 0,
			  range_deviation = 0,
			  source_effects =
			  {
				type = "create-explosion",
				entity_name = "artillery-cannon-muzzle-flash"
			  }
			}
		  }
		},
		subgroup = "ammo",
		order = "d[explosive-cannon-shell]-d[artillery][with-phosphorus]",
		inventory_move_sound = item_sounds.artillery_large_inventory_move,
		pick_sound = item_sounds.artillery_large_inventory_pickup,
		drop_sound = item_sounds.artillery_large_inventory_move,
		stack_size = 1,
		weight = 100*kg,
		default_import_location = "apia",
	},
	{
		type = "item",
		name = "biosynthesizer",
		icon = "__apia__/graphics/entity/biosynthesizer/biosynthesizer-icon.png",
		icon_size = 256,
		subgroup = "apiculture",
		order = "a-b[biosynthesizer]",
		inventory_move_sound = item_sounds.fluid_inventory_move,
		pick_sound = item_sounds.fluid_inventory_pickup,
		drop_sound = item_sounds.fluid_inventory_move,
		place_result = "biosynthesizer",
		stack_size = 5,
		default_import_location = "apia",
		weight = 100*kg,
	},
	{
		type = "item",
		name = "bioreactor",
		icon = "__apia__/graphics/entity/bioreactor/bioreactor-icon.png",
		icon_size = 64,
		subgroup = "apiculture",
		order = "a-c[bioreactor]",
		inventory_move_sound = item_sounds.fluid_inventory_move,
		pick_sound = item_sounds.fluid_inventory_pickup,
		drop_sound = item_sounds.fluid_inventory_move,
		place_result = "bioreactor",
		stack_size = 10,
		default_import_location = "apia",
		weight = 100*kg,
	},
	{
		type = "item",
		name = "bones",
		subgroup = "sarciculture-processes",
		order = "a-a-a[bones]",
		icon = "__apia__/graphics/icons/bones.png",
		inventory_move_sound = item_sounds.resource_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.resource_inventory_move,
		icon_size = 64,
		stack_size = 50,
		default_import_location = "carnova",
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "bone-meal",
		subgroup = "sarciculture-products",
		order = "a-c-a[bone-meal]",
		icon = "__apia__/graphics/icons/bone-meal.png",
		inventory_move_sound = item_sounds.resource_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.resource_inventory_move,
		stack_size = 100,
		default_import_location = "carnova",
		weight = 0.5 * kg,
	},
	{
		type = "item",
		name = "flesh",
		icon = "__apia__/graphics/icons/flesh.png",
		subgroup = "sarciculture-processes",
		order = "a-b-a[flesh]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 50,
		default_import_location = "carnova",
		spoil_ticks = 10 * minute,
		spoil_result = "spoilage",
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "lipids",
		icon = "__apia__/graphics/icons/lipids.png",
		subgroup = "sarciculture-products",
		order = "a-d-a[lipids]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 100,
		default_import_location = "carnova",
		spoil_ticks = 8 * minute,
		spoil_result = "spoilage",
		weight = 0.5 * kg,
		fuel_categories =
		{
			"chemical",
		},
		fuel_value = "2MJ",
	},
	{
		type = "item",
		name = "proteins",
		icon = "__apia__/graphics/icons/proteins.png",
		subgroup = "sarciculture-products",
		order = "a-e-a[proteins]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 100,
		default_import_location = "carnova",
		spoil_ticks = 4 * minute,
		spoil_result = "spoilage",
		weight = 0.5 * kg,
	},
	{
		type = "item",
		name = "piranha-roe",
		icon = "__apia__/graphics/icons/piranha-roe.png",
		subgroup = "sarciculture-processes",
		order = "a-c-a[roe]",
		inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
		pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
		drop_sound = space_age_item_sounds.agriculture_inventory_move,
		stack_size = 100,
		default_import_location = "carnova",
		weight = 1 * kg,
		spoil_ticks = 5 * minute,
		spoil_to_trigger_result =
		{
		  items_per_trigger = 25,
		  trigger =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				{
					type = "create-entity",
					entity_name = "explosion"
				},
				{
					type = "damage",
					damage = { amount = 100, type = "explosion"}
				}
			  }
			}
		  }
		}
	},
}
