local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition




table.insert(water_tile_type_names, "royal-jelly-lake")
table.insert(water_tile_type_names, "royal-jelly-lake2")

local royal_jelly_lake = table.deepcopy(data.raw.tile["water"])
royal_jelly_lake.name = "royal-jelly-lake"
royal_jelly_lake.order = "a[apia][royal-jelly-lake]"
royal_jelly_lake.subgroup = "apia-tiles"
royal_jelly_lake.fluid = "royal-jelly"
royal_jelly_lake.collision_mask = tile_collision_masks.oil_ocean_shallow()
royal_jelly_lake.effect_color = { 204, 169, 129 } --{ 202, 150, 93 }
royal_jelly_lake.map_color={194, 159, 119 }
royal_jelly_lake.default_cover_tile = "wax-platform"
royal_jelly_lake.autoplace = {probability_expression = "apia_ocean"}
royal_jelly_lake.walking_speed_modifier = 0.8
royal_jelly_lake.vehicle_friction_modifier = 4
royal_jelly_lake.walking_sound = tile_sounds.walking.oil_deep
royal_jelly_lake.landing_steps_sound = tile_sounds.landing.oil
royal_jelly_lake.driving_sound = base_tile_sounds.driving.oil
royal_jelly_lake.lowland_fog = true


local royal_jelly_lake2 = table.deepcopy(data.raw.tile["water"])
royal_jelly_lake2.name = "royal-jelly-lake2"
royal_jelly_lake2.order = "a[apia][royal-jelly-lake2]"
royal_jelly_lake2.subgroup = "apia-tiles"
royal_jelly_lake2.fluid = "royal-jelly"
royal_jelly_lake2.collision_mask = tile_collision_masks.oil_ocean_deep()
royal_jelly_lake2.effect_color = { 192, 151, 104 }--{ 180, 130, 70 }
royal_jelly_lake2.map_color={182, 141, 94 }
royal_jelly_lake2.default_cover_tile = "wax-platform"
royal_jelly_lake2.autoplace = {probability_expression = "apia_deep_ocean"}
royal_jelly_lake2.walking_speed_modifier = 0.5
royal_jelly_lake2.vehicle_friction_modifier = 10
royal_jelly_lake2.walking_sound = tile_sounds.walking.oil_deep
royal_jelly_lake2.landing_steps_sound = tile_sounds.landing.oil
royal_jelly_lake2.driving_sound = base_tile_sounds.driving.oil
royal_jelly_lake2.lowland_fog = true


local apia_biome1 = table.deepcopy(data.raw.tile["volcanic-smooth-stone"])
apia_biome1.name = "apia-biome1"
apia_biome1.order = "a[apia][apia-biome1]"
apia_biome1.subgroup = "apia-tiles"
apia_biome1.autoplace = {probability_expression = "apia_biome1"}
apia_biome1.map_color={76, 59, 42 }
apia_biome1.factoriopedia_alternative = nil

local apia_biome2 = table.deepcopy(data.raw.tile["midland-cracked-lichen"])
apia_biome2.name = "apia-biome2"
apia_biome2.order = "a[apia][apia-biome2]"
apia_biome2.subgroup = "apia-tiles"
apia_biome2.autoplace = {probability_expression = "apia_biome2"}
apia_biome2.map_color={101, 84, 51 }
apia_biome2.factoriopedia_alternative = nil

local apia_biome3 = table.deepcopy(data.raw.tile["midland-yellow-crust-3"])
apia_biome3.name = "apia-biome3"
apia_biome3.order = "a[apia][apia-biome3]"
apia_biome3.subgroup = "apia-tiles"
apia_biome3.autoplace = {probability_expression = "apia_biome3"}
apia_biome3.layer = apia_biome3.layer - 1
apia_biome3.map_color={154, 109, 56 }
apia_biome3.factoriopedia_alternative = nil

local apia_biome4 = table.deepcopy(data.raw.tile["midland-yellow-crust-4"])
apia_biome4.name = "apia-biome4"
apia_biome4.order = "a[apia][apia-biome4]"
apia_biome4.subgroup = "apia-tiles"
apia_biome4.autoplace = {probability_expression = "apia_biome4"}
--apia_biome4.map_color={172, 112, 46 }
apia_biome4.map_color={211, 176, 54 }
apia_biome4.collision_mask.layers.apia_hive_ground = true
apia_biome4.factoriopedia_alternative = nil

local artificial_honey_soil = table.deepcopy(data.raw.tile["midland-yellow-crust-4"])
artificial_honey_soil.name = "artificial-honey-soil"
artificial_honey_soil.order = "a[apia]-[artificial-soil]-a"
artificial_honey_soil.subgroup = "apia-tiles"
artificial_honey_soil.autoplace = nil
artificial_honey_soil.layer = artificial_honey_soil.layer - 1
artificial_honey_soil.collision_mask.layers.apia_hive_ground = true
artificial_honey_soil.map_color= {199, 169, 66 }
artificial_honey_soil.minable = {mining_time = 0.5, result = "artificial-honey-soil"}
artificial_honey_soil.mined_sound = base_sounds.deconstruct_bricks(0.8)
artificial_honey_soil.is_foundation = true
artificial_honey_soil.searchable = true
artificial_honey_soil.factoriopedia_alternative = nil
artificial_honey_soil.trigger_effect = tile_trigger_effects.landfill_trigger_effect()
artificial_honey_soil.variants = tile_variations_template_with_transitions_and_effect_map
(
    "__apia__/graphics/terrain/artificial-honey-soil.png",
    "__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
    {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
    }
)

local apia_biome5 = table.deepcopy(data.raw.tile["midland-yellow-crust"])
apia_biome5.name = "apia-biome5"
apia_biome5.order = "a[apia][apia-biome5]"
apia_biome5.subgroup = "apia-tiles"
apia_biome5.autoplace = {probability_expression = "apia_biome5"}
apia_biome5.map_color={190, 116, 39 }
apia_biome5.collision_mask.layers.apia_hive_ground = true
apia_biome5.factoriopedia_alternative = nil

local artificial_copper_soil = table.deepcopy(data.raw.tile["midland-yellow-crust"])
artificial_copper_soil.name = "artificial-copper-soil"
artificial_copper_soil.order = "a[apia]-[artificial-soil]-b"
artificial_copper_soil.subgroup = "apia-tiles"
artificial_copper_soil.autoplace = nil
artificial_copper_soil.layer = artificial_copper_soil.layer - 1
artificial_copper_soil.collision_mask.layers.apia_hive_ground = true
artificial_copper_soil.map_color= {179, 116, 50 }
artificial_copper_soil.minable = {mining_time = 0.5, result = "artificial-copper-soil"}
artificial_copper_soil.mined_sound = base_sounds.deconstruct_bricks(0.8)
artificial_copper_soil.is_foundation = true
artificial_copper_soil.searchable = true
artificial_copper_soil.factoriopedia_alternative = nil
artificial_copper_soil.trigger_effect = tile_trigger_effects.landfill_trigger_effect()
artificial_copper_soil.variants = tile_variations_template_with_transitions_and_effect_map
(
	"__apia__/graphics/terrain/artificial-copper-soil.png",
	"__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
    {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
    }
)

local apia_biome6 = table.deepcopy(data.raw.tile["midland-yellow-crust-2"])
apia_biome6.name = "apia-biome6"
apia_biome6.order = "a[apia][apia-biome6]"
apia_biome6.subgroup = "apia-tiles"
apia_biome6.autoplace = {probability_expression = "apia_biome6"}
apia_biome6.map_color= {167, 84, 43 }
apia_biome6.collision_mask.layers.apia_hive_ground = true
apia_biome6.factoriopedia_alternative = nil

local artificial_iron_soil = table.deepcopy(data.raw.tile["midland-yellow-crust-2"])
artificial_iron_soil.name = "artificial-iron-soil"
artificial_iron_soil.order = "a[apia]-[artificial-soil]-c"
artificial_iron_soil.subgroup = "apia-tiles"
artificial_iron_soil.autoplace = nil
artificial_iron_soil.layer = artificial_iron_soil.layer - 1
artificial_iron_soil.collision_mask.layers.apia_hive_ground = true
artificial_iron_soil.map_color = {158, 87, 52 }
artificial_iron_soil.minable = {mining_time = 0.5, result = "artificial-iron-soil"}
artificial_iron_soil.mined_sound = base_sounds.deconstruct_bricks(0.8)
artificial_iron_soil.is_foundation = true
artificial_iron_soil.searchable = true
artificial_iron_soil.factoriopedia_alternative = nil
artificial_iron_soil.trigger_effect = tile_trigger_effects.landfill_trigger_effect()
artificial_iron_soil.variants = tile_variations_template_with_transitions_and_effect_map
(
	"__apia__/graphics/terrain/artificial-iron-soil.png",
	"__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
    {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
    }
)

local wax_platform = table.deepcopy(data.raw.tile["midland-cracked-lichen-dull"])
wax_platform.name = "wax-platform"
wax_platform.order = "a[apia][wax-platform]"
wax_platform.subgroup = "apia-tiles"
wax_platform.layer = apia_biome6.layer + 10
wax_platform.is_foundation = true
wax_platform.collision_mask = tile_collision_masks.ground()
wax_platform.searchable = true
wax_platform.mined_sound = base_sounds.deconstruct_bricks(0.8)
wax_platform.minable = {mining_time = 0.5, result = "wax-platform"}
wax_platform.map_color={200, 139, 59 }
wax_platform.factoriopedia_alternative = nil


data:extend
({
	{
		type = "collision-layer",
		name = "apia_hive_ground",
	},
	royal_jelly_lake,
	royal_jelly_lake2,
	apia_biome1,
	apia_biome2,
	apia_biome3,
	apia_biome4,
	apia_biome5,
	apia_biome6,
	artificial_honey_soil,
	artificial_copper_soil,
	artificial_iron_soil,
	wax_platform,
})