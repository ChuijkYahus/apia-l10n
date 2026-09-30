local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local biosynthesizer_pictures = require("__apia__.prototypes.entity.biosynthesizer-pictures")
local base_sounds = require ("__base__.prototypes.entity.sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")
require ("__base__.prototypes.entity.pipecovers")
local apia_utils = require("lib")


data:extend(
{
  {
    type = "fish",
    name = "larvae",
    icon = "__apia__/graphics/icons/raw-larvae-0.png",
    flags = {"placeable-neutral", "not-on-map"},
    minable = {mining_time = 0.4, result = "raw-larvae", count = 5},
    mined_sound = sounds.mine_fish,
    max_health = 20,
    subgroup = "creatures",
    order = "b-a",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    pictures =
    {
      {
        filename = "__base__/graphics/entity/fish/fish-1.png",
        priority = "extra-high",
        width = 22,
        height = 36
      },
      {
        filename = "__base__/graphics/entity/fish/fish-2.png",
        priority = "extra-high",
        width = 32,
        height = 32
      }
    },
    autoplace = { probability_expression = 0.1 },
    protected_from_tile_building = false
  },
  {
    type = "assembling-machine",
    name = "artificial-hive",
    icon = "__apia__/graphics/icons/artificial-hive.png",
    subgroup = "agriculture",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-repairable", "not-deconstructable", "no-logistic-connection"},
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    create_ghost_on_death = false,
	corpse = "artificial-hive-remnants",
    max_health = 250,
    show_recipe_icon = true,
    impact_category = "organic",
	allowed_effects = {"speed", "consumption", "pollution"},
    production_health_effect =
    {
      not_producing = -1 / 120, -- 2.5 hp per second
      producing = 1 / 120 -- 2.5 hp per second
    },
    ignore_output_full = true,
    alert_icon_shift = util.by_pixel(0, -12),
    --icon_draw_specification = {shift = {0, -0.3}},
	icon_draw_specification = {scale = 1.5, shift = {0, -0.3}},
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    surface_conditions = apia_utils.surface_conditions("apia"),
    fast_replaceable_group = "artificial-hive",
    graphics_set =
	{
	  animation =
	  {
		layers =
		{
		  {
			filename = "__apia__/graphics/entity/artificial-hive/artificial-hive-anim.png",
			width = 600,
			height = 600,
			shift = util.by_pixel(0, -10),
			frame_count = 1,
			scale = 0.5,
			animation_speed = 1,
		  },
		}
	  },
	},
	stateless_visualisation =
	{
	  {
		  count = 1,
		  render_layer = "smoke",
		  offset_x = 0,
		  offset_y = -1.8,
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
			tint = util.multiply_color({r=169, g=150, b=95}, 0.3)
		  }
      },
    },
    open_sound = sounds.mech_small_open,
    close_sound = sounds.mech_small_close,
    working_sound =
    {
      sound = {category = "enemy", filename = "__base__/sound/creatures/spawner.ogg", volume = 0.6 },
      sound_accents =
      {
        {sound = {variations = sound_variations("__space-age__/sound/entity/spawner/spawner-respirator-push", 3, 0.3), audible_distance_modifier = 0.6}, frame = 1},
        {sound = {variations = sound_variations("__space-age__/sound/entity/spawner/spawner-respirator-pull", 3, 0.3), audible_distance_modifier = 0.6}, frame = 17},
      },
    },
	tile_buildability_rules =
	{
		{
			area = {{-1.7, -1.7}, {1.7, 1.7}},
			required_tiles =
			{
				layers =
				{
					apia_hive_ground = true,
				}
			},
			remove_on_collision = true,
		},
	},
    crafting_categories = {"artificial-hive-process"},
    --fixed_recipe = "honeycombs",
    crafting_speed = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"nutrients"},
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = -1 },
      burner_usage = "nutrients",
    },
    energy_usage = "500kW",
    module_slots = 0,
    allowed_effects = {},
  },
  {
    type = "solar-panel",
    name = "bio-solar-panel",
    icon = "__apia__/graphics/icons/bio-solar-panel.png",
    flags = {"placeable-neutral", "player-creation"},
	allowed_effects = {"pollution"},
    minable = {mining_time = 0.1, result = "bio-solar-panel"},
    fast_replaceable_group = "bio-solar-panel",
    max_health = 150,
    corpse = "bio-solar-panel-remnants",
    dying_explosion = "solar-panel-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
	emissions_per_second = { pollution = -2 },
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      layers =
      {
        {
          filename = "__apia__/graphics/entity/bio-solar-panel/bio-solar-panel.png",
          priority = "high",
          width = 230,
          height = 224,
          shift = util.by_pixel(-3, 3.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow.png",
          priority = "high",
          width = 220,
          height = 180,
          shift = util.by_pixel(9.5, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
	overlay =
    {
      layers =
      {
        {
          filename = "__apia__/graphics/entity/bio-solar-panel/bio-solar-panel-shadow-overlay.png",
          priority = "high",
          width = 214,
          height = 180,
          shift = util.by_pixel(10.5, 6),
		  draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    impact_category = "organic",
    production = "100kW"
  },
  {
    type = "assembling-machine",
    name = "biosynthesizer",
    icon = "__apia__/graphics/entity/biosynthesizer/biosynthesizer-icon.png",
	icon_size = 256,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "biosynthesizer"},
    fast_replaceable_group = "biosynthesizer",
    max_health = 350,
    corpse = "biosynthesizer-remnants",
    dying_explosion = "biochamber-explosion",
    --icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["foundry"],
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    module_slots = 6,
	use_mirroring = true,
	drawing_box_vertical_extension = 0.4,
    icons_positioning =
    {
		{inventory_index = defines.inventory.crafter_modules, shift = {0, 0.95}, max_icons_per_row = 3}
    },
    icon_draw_specification = {scale = 2, shift = {0, -0.35}},
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    effect_receiver = { base_effect = { productivity = 0.5 }},
    graphics_set = require("__apia__.prototypes.entity.biosynthesizer-pictures").graphics_set,
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/biochamber/biochamber-loop.ogg", volume = 0.4},
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    crafting_speed = 2,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"nutrients"},
      effectivity = 1,
      burner_usage = "nutrients",
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = -1 },
	  light_flicker = {color = {0,0,0}},
    },
    energy_usage = "1.2MW",
    heating_energy = "100kW",
	crafting_categories = {"apicultural", "organic", "refresh"},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__apia__.prototypes.entity.biosynthesizer-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-1, 2} }}
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {1, 2} }}
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "input-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {-1, -2} }}
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__apia__.prototypes.entity.biosynthesizer-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "input-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {1, -2} }}
      },
	  {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__apia__.prototypes.entity.biosynthesizer-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "output-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.west, position = {-2, 1} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "output-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.east, position = {2, 1} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "output-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.west, position = {-2, -1} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__apia__.prototypes.entity.biosynthesizer-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "output-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.east, position = {2, -1} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
  },
  {
	  name = "bioreactor",
	  type = "burner-generator",
	  icon = "__apia__/graphics/entity/bioreactor/bioreactor-icon.png",
	  flags = {"placeable-neutral","player-creation"},
	  max_health = 200,
	  dying_explosion = "medium-explosion",
	  corpse = "bioreactor-remnants",
	  collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
	  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	  max_power_output = "30MW",
	  minable = {mining_time = 1, result = "bioreactor"},
	  collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true}},
	  damaged_trigger_effect = hit_effects.entity(),
	  burner =
	  {
	    type = "burner",
		fuel_categories = {"nutrients"},
		effectivity = 1,
		fuel_inventory_size = 1,
		emissions_per_minute = { pollution = -1 },
		burner_usage = "nutrients",
		smoke =
		{
		  {
			name = "smoke",
			north_position = util.by_pixel(20, -90),
			south_position = util.by_pixel(20, -90),
			east_position = util.by_pixel(20, -90),
			west_position = util.by_pixel(20, -90),
			deviation = {0.1, 0.1},
			frequency = 20
		  }
		}
	  },
	  energy_source =
	  {
		type = "electric",
		usage_priority = "secondary-output"
	  },
	  animation =
		  {
			layers =
			{
			  util.sprite_load("__apia__/graphics/entity/bioreactor/bioreactor-base",
			  {
				priority = "high",
				animation_speed = 0.25,
				frame_count = 64,
				scale = 0.5
			  }),
			  util.sprite_load("__apia__/graphics/entity/bioreactor/bioreactor-shadow",
			  {
				priority = "high",
				frame_count = 1,
				repeat_count = 64,
				draw_as_shadow = true,
				scale = 0.5
			  })
			}
		  },
		  working_visualisations =
		  {
			{
			  always_draw = true,
			  fog_mask = { rect = {{-30, -30}, {30, -2.75}}, falloff = 1 },
			  animation = util.sprite_load("__apia__/graphics/entity/bioreactor/bioreactor-base",
			  {
				frame_count = 1,
				scale = 0.5
			  }),
			},
			{
			  --constant_speed = true,
			  always_draw = true,
			  apply_recipe_tint = "primary",
			  animation = util.sprite_load("__apia__/graphics/entity/bioreactor/bioreactor-mask",
			  {
				priority = "high",
				frame_count = 64,
				animation_speed = 0.25,
				tint_as_overlay = true,
				scale = 0.5
			  }),
			},
			{
			  --constant_speed = true,
			  apply_recipe_tint = "secondary",
			  effect = "flicker",
			  fadeout = true,
			  animation = util.sprite_load("__apia__/graphics/entity/bioreactor/bioreactor-light",
			  {
				priority = "high",
				frame_count = 64,
				animation_speed = 0.25,
				blend_mode = "additive",
				scale = 0.5
			  }),
			},
			{
			  effect = "flicker",
			  fadeout = true,
			  light = {intensity = 1.0, size = 6, shift = {-0.45, -0.25}, color = {r = 1, g = 1, b = 1}}
			},
			{
			  apply_recipe_tint = "secondary",
			  effect = "flicker",
			  fadeout = true,
			  light = {intensity = 1.0, size = 16, shift = {-1.2, -0.5}, color = {r = 1, g = 1, b = 1}}
			}
		  },
		  water_reflection =
		  {
			pictures =
			{
			  filename = "__apia__/graphics/entity/bioreactor/bioreactor-reflection.png",
			  priority = "extra-high",
			  width = 24,
			  height = 36,
			  shift = util.by_pixel(0, 20),
			  variation_count = 1,
			  scale = 5
			},
			rotate = false,
			orientation_to_variation = false
		  },
	},
	{
		type = "trivial-smoke",
		name = "carnova-raindrops",
		duration = 30,
		fade_in_duration = 10,
		fade_away_duration = 10,
		spread_duration = 30,
		start_scale = 1,
		end_scale = 0.8,
		cyclic = true,
		affected_by_wind = false,
		animation =
		{
		  width = 256,
		  height = 256,
		  line_length = 2,
		  frame_count = 4,
		  priority = "high",
		  animation_speed = 0.0001,
		  scale = 0.5,
		  filename = "__apia__/graphics/entity/red-rain/red-rain.png",
		  flags = { "smoke" }
		}
	},
	{
		type = "container",
		name = "rotting-spidertron-remains",
		icon = "__base__/graphics/icons/spidertron.png",
		flags = {"placeable-neutral", "placeable-off-grid"},
		minable = { mining_time = 2 },
		open_sound = sounds.metallic_chest_open,
		close_sound = sounds.metallic_chest_close,
		fast_replaceable_group = "container",
		circuit_connector = circuit_connector_definitions["chest"],
		circuit_wire_max_distance = default_circuit_wire_max_distance,
		hidden = true,
		inventory_size = 48,
		render_layer = "object",
		resistances =
		{
		  {
			type = "impact",
			percent = 60
		  }
		},
		max_health = 150,
		selection_box = {{-1, -1}, {1, 1}},
		collision_box = {{-1, -1}, {1, 1}},
		picture =
		{
		  layers =
		  {
			{
			  filename = "__base__/graphics/entity/spidertron/remnants/spidertron-remnants.png",
			  priority = "high",
			  width = 448,
			  height = 448,
			  shift = util.by_pixel(0, 0),
			  scale = 0.5,
			},
		  }
		},
		created_effect = {
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			source_effects =
			{
			  {
				type = "create-decorative",
				decorative = "pale-lettuce-lichen-cups-6x6",
				spawn_min = 1,
				spawn_max = 10,
				spawn_min_radius = 1,
				spawn_max_radius = 4
			  },
			  {
				type = "create-decorative",
				decorative = "flesh-fingers",
				spawn_min = 2,
				spawn_max = 4,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			  },
			  {
				type = "create-decorative",
				decorative = "urchin-cactus",
				spawn_min = 1,
				spawn_max = 4,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			  },
			}
		  }
		}
	},
})
