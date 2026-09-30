local resource_autoplace = require("resource-autoplace")
local tile_sounds = require("__base__.prototypes.tile.tile-sounds")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local movement_triggers = require("__base__/prototypes/entity/movement-triggers")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local decorative_trigger_effects = require("__base__/prototypes/decorative/decorative-trigger-effects")
local base_tile_sounds = require("__base__.prototypes.tile.tile-sounds")

-- Initialize the core patch sets in a predictable order
resource_autoplace.initialize_patch_set("lymph-brine", false, "carnova")



data:extend({
	{
		type = "autoplace-control",
		name = "apia_soil",
		order = "z-[apia]-a",
		category = "terrain",
		richness = false,
		can_be_disabled = false,
	},
	{
		type = "autoplace-control",
		name = "carnova_enemy_base",
		richness = false,
		order = "z-[carnova]-a",
		category = "enemy",
		can_be_disabled = false,
		related_to_fight_achievements = true
	},
	{
		type = "autoplace-control",
		name = "bones",
		localised_name = {"", "[entity=bones] ", {"entity-name.bones"}},
		richness = true,
		order = "z-[carnova]-b",
		category = "resource"
	},
	{
		type = "resource",
		name = "bones",
		icon = "__apia__/graphics/icons/bones.png",
		flags = {"placeable-neutral"},
		order = "[carnova]",
		walking_sound = tile_sounds.walking.ore,
		driving_sound = tile_sounds.driving.stone,
		category = "basic-solid",
		minable =
		{
			mining_particle = "stone-particle",
			mining_time = 0.5,
			result = "bones",
			fluid_amount = 5,
			required_fluid = "lymph",
		},
		collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		autoplace = {
		  order="[carnova][bones]",
		  probability_expression = "carnova_bones_probability",
		  richness_expression = "carnova_bones_richness"
		},
		autoplace = resource_autoplace.resource_autoplace_settings
		{
		  name = "bones",
		  order = "[carnova]",
		  base_density = 1,
		  base_spots_per_km2 = 1.5,
		  has_starting_area_placement = true,
		  random_spot_size_minimum = 3,
		  random_spot_size_maximum = 6,
		  regular_rq_factor_multiplier = 1,
		  planet = "carnova",
		},
		stage_counts = {1500, 1300, 1150, 1000, 700, 500, 200, 50},
		stages =
		{
		  sheet =
		  {
			filename = "__apia__/graphics/entity/bones/bones.png",
			priority = "extra-high",
			size = 128,
			frame_count = 8,
			variation_count = 8,
			scale = 0.5
		  },
		},
		mining_visualisation_tint = {r = 0.99, g = 1.0, b = 0.92, a = 1.000},
		map_color = {131, 86, 61},
	},
	{
		type = "autoplace-control",
		name = "lymph",
		localised_name = {"", "[entity=lymph-brine] ", {"entity-name.lymph-brine"}},
		richness = true,
		order = "z-[carnova]-c",
		category = "resource"
	},
	{
		type = "resource",
		name = "lymph-brine",
		icon = "__apia__/graphics/entity/lymph-brine/lymph-brine-icon.png",
		flags = {"placeable-neutral"},
		category = "basic-fluid",
		subgroup = "mineable-fluids",
		order="c",
		highlight = true,
		minimum = 10000,
		normal = 200000,
		infinite_depletion_amount = 1,
		resource_patch_search_radius = 50,
		minable =
		{
		  mining_time = 1,
		  results =
		  {
			{
			  type = "fluid",
			  name = "lymph",
			  amount_min = 10,
			  amount_max = 10,
			  independent_probability = 1
			}
		  }
		},
		walking_sound = base_tile_sounds.walking.oil({}),
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		autoplace = {
		  order="[carnova][lymph-brine]",
		  probability_expression = "carnova_lymph_brine_probability",
		  richness_expression = "carnova_lymph_brine_richness"
		},
		stage_counts = {0},
		stages =
		{
		  layers =
		  {
			util.sprite_load("__apia__/graphics/entity/lymph-brine/lymph-brine",
			{
			  priority = "high",
			  frame_count = 4,
			  scale = 0.5,
			})
		  }
		},
		stateless_visualisation =
		{
		  {
			count = 1,
			render_layer = "smoke",
			animation =
			{
			  filename = "__space-age__/graphics/entity/sulfuric-acid-geyser/sulfuric-acid-geyser-gas-outer.png",
			  frame_count = 47,
			  line_length = 16,
			  width = 90,
			  height = 188,
			  animation_speed = 0.3,
			  shift = util.by_pixel(-6, -89),
			  scale = 1,
			  tint = util.multiply_color({r=0.9, g=0.9, b=0.9}, 0.1)
			}
		  },
		  {
			count = 1,
			render_layer = "smoke",
			animation =
			{
			   filename = "__space-age__/graphics/entity/sulfuric-acid-geyser/sulfuric-acid-geyser-gas-inner.png",
			   frame_count = 47,
			   line_length = 16,
			   width = 40,
			   height = 84,
			   animation_speed = 0.4,
			   shift = util.by_pixel(-4, -30),
			   scale = 1,
			   tint = util.multiply_color({r=0.9, g=0.9, b=0.9}, 0.1)
			}
		  }
		},
		map_color = {140, 140, 140},
		map_grid = false,
		created_effect = {
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			source_effects =
			{
			  {
				type = "create-decorative",
				decorative = "veins",
				spawn_min = 1,
				spawn_max = 2,
				spawn_min_radius = 1,
				spawn_max_radius = 2
			  },
			  {
				type = "create-decorative",
				decorative = "flesh-fingers",
				spawn_min = 2,
				spawn_max = 6,
				spawn_min_radius = 1,
				spawn_max_radius = 2
			  },
			}
		  }
		}
	},
})