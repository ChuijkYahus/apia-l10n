local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local spoilage_sound = sound_variations("__space-age__/sound/mining/spoilage", 3, 0) --at zero vol until the correct particle fx are in place
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")



data:extend(
{
	{
		type = "simple-entity",
		name = "wild-hive",
		icon = "__apia__/graphics/entity/wild-hive/wild-hive_icon.png",
		icon_size = 256,
		flags = {"placeable-neutral", "placeable-off-grid"},
		map_color = {171, 132, 87},
		autoplace =
		{
		  probability_expression = "apia_biome2 * 0.000005",
		  richness_expression = "random_penalty_at(1, 0.85)",
		  tile_restriction = {"apia-biome2"}
		},
		minable =
		{
		  mining_particle = "boompuff-mining-particle",
		  mining_time = 1,
		  results =
		  {
			{type = "item", name = "honeycombs", amount = 50, shared_probability = { min = 0, max = 0.5 }},
			{type = "item", name = "honeycombs-iron", amount = 50, shared_probability = { min = 0.5, max = 0.75 }},
			{type = "item", name = "honeycombs-copper", amount = 50, shared_probability = { min = 0.75, max = 1 }},
			{type = "item", name = "spoilage", amount = 30},
		  },
		  mining_trigger =
		  {
			{
			  type = "direct",
			  action_delivery =
			  {
				{
				  type = "instant",
				  target_effects = 
				  {
					type = "play-sound",
					sound = spoilage_sound,
					damage_type_filters = "fire"
				  }
				}
			  }
			}
		  }
		},
		mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-boompuff", 5, 0.6),
		emissions_per_second = { pollution = -0.001 },
		max_health = 100,
		collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
		selection_box = {{-2, -2}, {2, 2}},
		--drawing_box_vertical_extension = 0.8,
		subgroup = "trees",
		order = "a[tree]-c[apia]-b[normal]-g[wild-hive]",
		impact_category = "tree",
		render_layer = "object",
		pictures =
		{
		  {
			filename = "__apia__/graphics/entity/wild-hive/wild-hive.png",
			width = 600,
			height = 600,
			shift = util.by_pixel( 0.0, -10.0 ),
			--animation_speed = 0.4,
			--frame_count = 44,
			--line_length = 11,
			scale = 0.5
		  }
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
		ambient_sounds =
		{
		  sound =
		  {
			variations = sound_variations("__space-age__/sound/world/plants/boompuff", 5, 0.8),
			advanced_volume_control =
			{
			  fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
			}
		  },
		  radius = 7.5,
		  min_entity_count = 2,
		  max_entity_count = 10,
		  entity_to_sound_ratio = 0.3,
		  average_pause_seconds = 8
		},
		created_effect =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			source_effects =
			{
			  {
				type = "create-decorative",
				decorative = "light-mud-decal",
				spawn_min = 2,
				spawn_max = 5,
				spawn_min_radius = 0,
				spawn_max_radius = 3
			  },
			  {
				type = "create-decorative",
				decorative = "yellow-lettuce-lichen-6x6",
				spawn_min = 2,
				spawn_max = 4,
				spawn_min_radius = 0,
				spawn_max_radius = 3
			  },
			  {
				type = "create-decorative",
				decorative = "mycelium",
				spawn_min = 1,
				spawn_max = 2,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			  },
			  {
				type = "create-decorative",
				decorative = "polycephalum-balloon",
				spawn_min = 4,
				spawn_max = 8,
				spawn_min_radius = 2,
				spawn_max_radius = 3
			  },
			}
		  }
		}
	},
	{
		type = "tree",
		name = "honey-mushroom",
		icon = "__apia__/graphics/icons/honey-mushroom.png",
		flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
		map_color = {213, 169, 101},
		autoplace =
		{
		  probability_expression = "(apia_biome4 + apia_biome5 + apia_biome6) * apia_biome_detail * 0.0005",
		  richness_expression = "random_penalty_at(3, 1.4)",
		  tile_restriction = {"apia-biome4", "apia-biome5", "apia-biome6"}
		},
		minable =
		{
		  mining_particle = "yumako-mining-particle",
		  mining_time = 1,
		  results =
		  {
			{type = "item", name = "honey", amount = 20},
			{type = "item", name = "wood", amount = 4}
		  },
		  mining_trigger =
		  {
			{
			  type = "direct",
			  action_delivery =
			  {
				{
				  type = "instant",
				  target_effects =
				  {
					type = "play-sound",
					sound = spoilage_sound,
					damage_type_filters = "fire"
				  }
				}
			  }
			}
		  }
		},
		mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
		mined_sound = sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
		emissions_per_second = { pollution = -0.001 },
		max_health = 50,
		collision_box = {{-1, -1}, {1, 1}},
		selection_box = {{-1, -1}, {1, 1}},
		--drawing_box_vertical_extension = 0.8,
		subgroup = "trees",
		order = "a[tree]-c[apia]-b[normal]-g[honey-mushroom]",
		impact_category = "tree",
		pictures =
		{
		  {
			filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_00.png",
			width = 160,
			height = 160,
			scale = 0.7,
		  },
		  {
			filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_01.png",
			width = 256,
			height = 256,
			scale = 0.7,
		  },
		  {
			filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_02.png",
			width = 256,
			height = 256,
		  },
		  {
			filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_03.png",
			width = 256,
			height = 256,
			scale = 1.1,
		  },
		  {
			filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_04.png",
			width = 256,
			height = 256,
			scale = 1.7,
		  },
		  {
			filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_05.png",
			width = 256,
			height = 256,
			scale = 1.7,
		  },
		  {
			filename = "__apia__/graphics/entity/honey-mushroom/honey-mushroom_06.png",
			width = 256,
			height = 256,
			scale = 1.7,
		  },
		},
		ambient_sounds =
		{
		  sound =
		  {
			variations = sound_variations("__space-age__/sound/world/plants/yumako-tree", 6, 0.5),
			advanced_volume_control =
			{
			  fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
			}
		  },
		  radius = 7.5,
		  min_entity_count = 2,
		  max_entity_count = 10,
		  entity_to_sound_ratio = 0.2,
		  average_pause_seconds = 8
		},
		created_effect =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			source_effects =
			{
			  {
				type = "create-decorative",
				decorative = "dark-mud-decal",
				spawn_min = 1,
				spawn_max = 1,
				spawn_min_radius = 0,
				spawn_max_radius = 2
			  },
			  {
				type = "create-decorative",
				decorative = "curly-roots-orange",
				spawn_min = 1,
				spawn_max = 1,
				spawn_min_radius = 0,
				spawn_max_radius = 1
			  },
			  {
				type = "create-decorative",
				decorative = "yellow-lettuce-lichen-cups-3x3",
				spawn_min = 1,
				spawn_max = 5,
				spawn_min_radius = 1,
				spawn_max_radius = 2
			  },
			}
		  }
		}
	},
	{
		type = "simple-entity",
		name = "flesh-antenna",
		icon = "__apia__/graphics/entity/flesh-antenna/flesh-antenna-icon.png",
		flags = plant_flags,
		count_as_rock_for_filtered_deconstruction = true,
		minable =
		{
		  mining_particle = "lickmaw-mining-particle",
		  mining_time = 4,
		  results =
		  {
			{type = "item", name = "flesh", amount = 100},
			{type = "item", name = "stone", amount = 20},
			{type = "item", name = "spoilage", amount = 10},
		  },
		  mining_trigger =
		  {
			{
			  type = "direct",
			  action_delivery =
			  {
				{
				  type = "instant",
				  target_effects = spoilage_sound_trigger
				}
			  }
			}
		  }
		},
		mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-lickmaw", 5, 0.45),
		mined_sound = sound_variations("__space-age__/sound/mining/mined-lickmaw", 5, 0.4),
		emissions_per_second = plant_emissions,
		max_health = 200,
		collision_box = {{-1.3, -0.6}, {1.3, 0.6}},
		selection_box = {{-1.5, -4}, {1.5, 0.6}},
		drawing_box_vertical_extension = 0.8,
		subgroup = "trees",
		order = "a[tree]-c[gleba]-b[normal]-e[lickmaw]",
		impact_category = "tree",
		factoriopedia_simulation = nil,
		autoplace =
		{
			probability_expression = "0.001",
			richness_expression = "random_penalty_at(3, 1)",
			tile_restriction = {"carnova-biome2", "carnova-biome3"}
		},
		pictures =
		{
			{
				filename = "__apia__/graphics/entity/flesh-antenna/flesh-antenna.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(100, -140),
				scale = 0.7,
			},
			{
				filename = "__apia__/graphics/entity/flesh-antenna/flesh-antenna.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(100, -140),
				scale = 0.7,
				x = 640,
			},
			{
				filename = "__apia__/graphics/entity/flesh-antenna/flesh-antenna.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(100, -140),
				scale = 0.7,
				x = 1280,
			},
			{
				filename = "__apia__/graphics/entity/flesh-antenna/flesh-antenna.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(100, -140),
				scale = 0.7,
				x = 1920,
			},
			{
				filename = "__apia__/graphics/entity/flesh-antenna/flesh-antenna.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(100, -140),
				scale = 0.7,
				x = 2560,
			},
		},
		colors =
		{
			{r = 255, g = 255, b =  255},
			{r = 220, g = 255, b =  255},
			{r = 255, g = 220, b =  255},
			{r = 255, g = 255, b =  220},
			{r = 220, g = 220, b =  255},
			{r = 255, g = 220, b =  220},
			{r = 220, g = 255, b =  220},
		},
		ambient_sounds =
		{
		  sound =
		  {
			variations = sound_variations("__space-age__/sound/world/plants/lickmaw", 8, 0.5),
			advanced_volume_control =
			{
			  fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
			}
		  },
		  radius = 7.5,
		  min_entity_count = 1,
		  max_entity_count = 10,
		  entity_to_sound_ratio = 0.3,
		  average_pause_seconds = 7
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
				decorative = "red-nerve-roots-veins-sparse",
				spawn_min = 1,
				spawn_max = 1,
				spawn_min_radius = 1,
				spawn_max_radius = 1
			  },
			  {
				type = "create-decorative",
				decorative = "split-gill-red-2x2",
				spawn_min = 1,
				spawn_max = 4,
				spawn_min_radius = 1,
				spawn_max_radius = 4
			  },
			  {
				type = "create-decorative",
				decorative = "split-gill-red-1x1",
				spawn_min = 1,
				spawn_max = 6,
				spawn_min_radius = 1,
				spawn_max_radius = 4
			  },
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
				spawn_min = 4,
				spawn_max = 10,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			  },
			  {
				type = "create-decorative",
				decorative = "coral-land",
				spawn_min = 2,
				spawn_max = 6,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			  },
			}
		  }
		}
	},
	{
		type = "simple-entity",
		name = "flesh-tree",
		icon = "__apia__/graphics/entity/flesh-tree/flesh-tree-icon.png",
		flags = {"placeable-neutral", "placeable-off-grid"},
		count_as_rock_for_filtered_deconstruction = true,
		autoplace =
		{
		  probability_expression = "carnova_flesh_tree_probability * 0.003",
		  richness_expression = "random_penalty_at(1, 0.85)",
		  tile_restriction = {"carnova-biome2", "carnova-biome3", "carnova-biome4"}
		},
		minable =
		{
		  mining_particle = "sunnycomb-mining-particle",
		  mining_time = 0.5,
		  results =
		  {
			{type = "item", name = "spoilage", amount = 6},
			{type = "item", name = "flesh", amount = 4},
			{type = "item", name = "wood", amount = 2},
		  },
		  mining_trigger =
		  {
			{
			  type = "direct",
			  action_delivery =
			  {
				{
				  type = "instant",
				  target_effects = spoilage_sound_trigger
				}
			  }
			}
		  }
		},
		mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-teflilly", 5, 0.5),
		mined_sound = sound_variations("__space-age__/sound/mining/mined-teflilly", 5, 0.5),
		emissions_per_second = { pollution = -0.001 },
		max_health = 75,
		collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
		selection_box = {{-1, -3}, {1, 0.5}},
		drawing_box_vertical_extension = 0.8,
		subgroup = "trees",
		order = "[carnova][flesh-tree]",
		impact_category = "tree",
		render_layer = "object",
		pictures =
		{
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 640,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 1280,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 1920,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 2560,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				y = 560,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 640,
				y = 560,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 1280,
				y = 560,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 1920,
				y = 560,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 2560,
				y = 560,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 0,
				y = 1120,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 640,
				y = 1120,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 1280,
				y = 1120,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 1920,
				y = 1120,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 2560,
				y = 1120,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 0,
				y = 1680,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 640,
				y = 1680,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 1280,
				y = 1680,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 1920,
				y = 1680,
			},
			{
				filename = "__apia__/graphics/entity/flesh-tree/flesh-tree.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(52, -70),
				scale = 0.4,
				x = 2560,
				y = 1680,
			},
		},
		ambient_sounds =
		{
		  sound =
		  {
			variations = sound_variations("__space-age__/sound/world/plants/teflilly", 8, 0.7),
			advanced_volume_control =
			{
			  fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
			}
		  },
		  radius = 7.5,
		  min_entity_count = 2,
		  max_entity_count = 10,
		  entity_to_sound_ratio = 0.3,
		  average_pause_seconds = 8
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
				decorative = "fuchsia-pita",
				spawn_min = 3,
				spawn_max = 6,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			  },
			}
		  }
		}
	},
	{
		type = "simple-entity",
		name = "bone-nodes",
		icon = "__apia__/graphics/entity/bone-nodes/bone-nodes-icon.png",
		flags = plant_flags,
		count_as_rock_for_filtered_deconstruction = true,
		minable =
		{
		  mining_particle = "cuttlepop-mining-particle",
		  mining_time = 0.5,
		  results =
		  {
			{type = "item", name = "bones", amount = 20},
		  }
		},
		mining_sound = sound_variations("__space-age__/sound/mining/mining-cuttlepop", 6, 0.8),
		mined_sound = sound_variations("__space-age__/sound/mining/mined-cuttlepop", 5, 0.7),
		emissions_per_second = plant_emissions,
		max_health = 50,
		collision_box = {{-0.6, -0.8}, {0.6, 0.8}},
		selection_box = {{-0.8, -2.5}, {0.8, 1}},
		drawing_box_vertical_extension = 0.8,
		subgroup = "trees",
		order = "[carnova][bone-nodes]",
		impact_category = "tree",
		autoplace =
		{
			probability_expression = "carnova_bones_probability * 0.0005",
			richness_expression = "random_penalty_at(1, 0.85)",
			tile_restriction = {"carnova-biome3", "carnova-biome4"}
		},
		pictures =
		{
			{
				filename = "__apia__/graphics/entity/bone-nodes/bone-nodes.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(60, -50),
				scale = 0.4,
			},
			{
				filename = "__apia__/graphics/entity/bone-nodes/bone-nodes.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(60, -50),
				scale = 0.4,
				x = 640,
			},
			{
				filename = "__apia__/graphics/entity/bone-nodes/bone-nodes.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(60, -50),
				scale = 0.4,
				x = 1280,
			},
			{
				filename = "__apia__/graphics/entity/bone-nodes/bone-nodes.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(60, -50),
				scale = 0.4,
				x = 1920,
			},
			{
				filename = "__apia__/graphics/entity/bone-nodes/bone-nodes.png",
				width = 640,
				height = 560,
				shift = util.by_pixel(60, -50),
				scale = 0.4,
				y = 560,
			},
		},
		colors =
		{
			{r = 255, g = 255, b =  255},
			{r = 220, g = 255, b =  255},
			{r = 255, g = 220, b =  255},
			{r = 255, g = 255, b =  220},
			{r = 220, g = 220, b =  255},
			{r = 255, g = 220, b =  220},
			{r = 220, g = 255, b =  220},
		},
		ambient_sounds =
		{
		  sound =
		  {
			variations = sound_variations("__space-age__/sound/world/plants/cuttlepop", 7, 0.5),
			advanced_volume_control =
			{
			  fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
			}
		  },
		  radius = 7.5,
		  min_entity_count = 3,
		  max_entity_count = 10,
		  entity_to_sound_ratio = 0.5,
		  average_pause_seconds = 13
		},
		created_effect =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			source_effects =
			{
			  {
				type = "create-decorative",
				decorative = "curly-roots-grey",
				spawn_min = 1,
				spawn_max = 1,
				spawn_min_radius = 0,
				spawn_max_radius = 0.5
			  },
			  {
				type = "create-decorative",
				decorative = "pale-lettuce-lichen-cups-3x3",
				spawn_min = 1,
				spawn_max = 3,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			  }
			}
		  }
		}
	},
})
