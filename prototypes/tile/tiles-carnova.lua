local tile_trigger_effects = require("__base__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition


local function material_background(picture, count)
  return
  {
    transition = tile_graphics.generic_masked_tile_transitions1,
    material_background =
    {
      picture = picture,
      count = count,
      scale = 0.5
    }
  }
end

local aspic_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__apia__/graphics/terrain/aspic-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = {
      filename = "__apia__/graphics/terrain/aspic-patch.png",
      scale = 0.5,
      width = 64,
      height = 64
    }
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/dirt-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  },
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/dry-dirt-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0
    }
  }
}

local aspic_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__apia__/graphics/terrain/aspic-2.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = lava_tile_type_names,
    transition_group = lava_transition_group_id,
    spritesheet = "__space-age__/graphics/terrain/lava-transitions/lava-stone.png",
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/lava-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
     -- this added the lightmap spritesheet
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = {"out-of-map","empty-space","oil-ocean-shallow"},
    transition_group = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_4_4_8_1_1,
    overlay_enabled = false
  }
}


local carnova_lake1 = table.deepcopy(data.raw.tile["wetland-red-tentacle"])
carnova_lake1.name = "blood-lake1"
carnova_lake1.order = "[carnova][blood-lake1]"
carnova_lake1.subgroup = "carnova-tiles"
carnova_lake1.fluid = "blood"
carnova_lake1.effect_color = { 100, 42, 62 }
carnova_lake1.map_color= { 71, 30, 30 }
carnova_lake1.default_cover_tile = "landfill"
carnova_lake1.autoplace = {probability_expression = "carnova_ocean"}
carnova_lake1.lowland_fog = true
carnova_lake1.walking_speed_modifier = 0.8
carnova_lake1.vehicle_friction_modifier = 4
carnova_lake1.walking_sound = tile_sounds.walking.oil_deep
carnova_lake1.landing_steps_sound = tile_sounds.landing.oil
carnova_lake1.driving_sound = base_tile_sounds.driving.oil
carnova_lake1.factoriopedia_alternative = nil


local carnova_lake2 = table.deepcopy(data.raw.tile["wetland-jellynut"])
carnova_lake2.name = "blood-lake2"
carnova_lake2.order = "[carnova][blood-lake2]"
carnova_lake2.subgroup = "carnova-tiles"
carnova_lake2.fluid = "blood"
--carnova_lake2.effect_color = { 83, 42, 56 },
carnova_lake2.map_color= { 58, 25, 30 }
carnova_lake2.default_cover_tile = "landfill"
carnova_lake2.autoplace = {probability_expression = "carnova_deep_ocean"}
carnova_lake2.lowland_fog = true
carnova_lake2.walking_speed_modifier = 0.5
carnova_lake2.vehicle_friction_modifier = 10
carnova_lake2.walking_sound = tile_sounds.walking.oil_deep
carnova_lake2.landing_steps_sound = tile_sounds.landing.oil
carnova_lake2.driving_sound = base_tile_sounds.driving.oil
carnova_lake2.factoriopedia_alternative = nil


table.insert(water_tile_type_names, "blood-lake1")
table.insert(water_tile_type_names, "blood-lake2")


local carnova_biome2 = table.deepcopy(data.raw.tile["lowland-red-vein"])
carnova_biome2.name = "carnova-biome2"
carnova_biome2.order = "a[carnova][carnova-biome2]"
carnova_biome2.subgroup = "carnova-tiles"
carnova_biome2.autoplace = {probability_expression = "carnova_biome2"}
carnova_biome2.map_color={ 110, 51, 42 }
carnova_biome2.factoriopedia_alternative = nil

local carnova_biome3 = table.deepcopy(data.raw.tile["lowland-red-vein-4"])
carnova_biome3.name = "carnova-biome3"
carnova_biome3.order = "a[carnova][carnova-biome3]"
carnova_biome3.subgroup = "carnova-tiles"
carnova_biome3.autoplace = {probability_expression = "carnova_biome3"}
carnova_biome3.map_color={ 104, 48, 36 }
carnova_biome3.factoriopedia_alternative = nil

local carnova_biome4 = table.deepcopy(data.raw.tile["lowland-red-vein-3"])
carnova_biome4.name = "carnova-biome4"
carnova_biome4.order = "a[carnova][carnova-biome4]"
carnova_biome4.subgroup = "carnova-tiles"
carnova_biome4.autoplace = {probability_expression = "carnova_biome4"}
carnova_biome4.map_color={ 104, 54, 48 }
carnova_biome4.factoriopedia_alternative = nil



data:extend({
	{
		type = "tile",
		name = "carnova-biome1",
		subgroup = "carnova-tiles",
		order = "a[carnova][carnova-biome1]",
		collision_mask = tile_collision_masks.meltable_tile(),
		autoplace = {probability_expression = "carnova_biome1"},
		layer = 20,
		sprite_usage_surface = "gleba",
		variants = material_background("__apia__/graphics/terrain/aspic-smooth.png", 4),

		transitions = aspic_transitions,
		transitions_between_transitions = aspic_transitions_between_transitions,

		walking_sound = base_tile_sounds.walking.shallow_water,
		landing_steps_sound = tile_sounds.landing.wet,
		driving_sound = tile_sounds.driving.wetland,
	
		map_color = {118, 62, 48},
		scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
		absorptions_per_second = tile_pollution.ice,
		walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect(),
		factoriopedia_alternative = nil
	},
	
	carnova_lake1,
	carnova_lake2,
	carnova_biome2,
	carnova_biome3,
	carnova_biome4,
})


local function add_landfillable_stuff(landfill_name, new_surface)
  local item = data.raw.item[landfill_name]
  item.place_as_tile.tile_condition = item.place_as_tile.tile_condition or {}
  table.insert(item.place_as_tile.tile_condition, new_surface)
end
add_landfillable_stuff("landfill", "blood-lake1")
add_landfillable_stuff("landfill", "blood-lake2")
add_landfillable_stuff("foundation", "blood-lake1")
add_landfillable_stuff("foundation", "blood-lake2")