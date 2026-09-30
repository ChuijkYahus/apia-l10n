data:extend({
  {
    type = "noise-expression",
    name = "apia_segmentation_multiplier",
    expression = "1"
  },
  {
    type = "noise-expression",
    name = "apia_spot_size",
    expression = "50"
  },

  -- Почва: прямой множитель площади, отведённой под биомы 4-6.
  -- control:apia_soil:size управляет порогом появления внутренних биомов:
  --   0.0 -> биомы 4-6 отключены
  --   1.0 -> стандарт (порог land_height ≈ 0.75)
  --   2.0 -> удвоенная площадь (порог ≈ 0.50)
  --   4.0 -> почти весь остров
  -- Внутри отведённой площади соотношение 4/5/6 остаётся 50%/25%/25%
  -- (см. apia_inner_biome_selector и apia_biomeX_mask).
  {
    type = "noise-expression",
    name = "apia_soil",
    expression = "control:apia_soil:size"
  },

  {
    type = "noise-function",
    name = "apia_simple_billows",
    parameters = {"seed1", "octaves", "input_scale"},
    expression = "abs(quick_multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = seed1, input_scale = input_scale, output_scale = 1, offset_x = 10000, octaves = octaves, octave_input_scale_multiplier = 0.5, octave_output_scale_multiplier = 0.75})"
  },

  -- Гарантированный спаун-остров с естественной формой
  {
    type = "noise-expression",
    name = "apia_spawn_island_boost",
    expression = "apia_spawn_island_shape * apia_spawn_island_falloff * 20",
    local_expressions = {
      base_dist = "sqrt(x*x + y*y)",
      shape_noise_x = "0.8 + multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 12345, octaves = 2, persistence = 0.7, input_scale = 1/100} * 0.4",
      shape_noise_y = "0.7 + multioctave_noise{x = y, y = x, seed0 = map_seed, seed1 = 23456, octaves = 2, persistence = 0.7, input_scale = 1/120} * 0.6",
      distorted_dist = "sqrt((x*shape_noise_x)*(x*shape_noise_x) + (y*shape_noise_y)*(y*shape_noise_y))",
      apia_spawn_island_core = "clamp(1.2 - distorted_dist / 45, 0, 1.5)",
      edge_detail = "multioctave_noise{x = x*1.5, y = y*1.5, seed0 = map_seed, seed1 = 34567, octaves = 3, persistence = 0.6, input_scale = 1/25} * 0.3",
      apia_spawn_island_shape = "clamp(apia_spawn_island_core + edge_detail, 0, 1)",
      apia_spawn_island_falloff = "clamp(1.5 - base_dist / 35, 0, 1)"
    }
  },

  {
    type = "noise-expression",
    name = "apia_elevation",
    expression = "lerp(scattered_islands, clustered_archipelago, 0.7) + apia_spawn_island_boost",
    local_expressions = {
      scattered_islands = "-18 + 35 * clamp(scattered_peaks * 2.5 - 1.8, 0, 1) + 12 * island_detail",
      clustered_archipelago = "-16 + 40 * clamp(archipelago_density * 2.0 - 1.3, 0, 1) + 18 * (pow(voronoi_large * max(0, voronoi_cell * 1.5 - 0.3) + 0.8 * voronoi_small * max(0, aux + 0.4), 0.65))",
      scattered_peaks = "abs(amplitude_corrected_multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 1000, input_scale = segmentation_mult / 2.2, offset_x = -15000, octaves = 5, persistence = 0.75, amplitude = 1.2})",
      archipelago_density = "abs(amplitude_corrected_multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 2000, input_scale = segmentation_mult / 1.5, offset_x = 8000, octaves = 4, persistence = 0.7, amplitude = 1.2})",
      island_detail = "min(apia_simple_billows{seed1 = 2100, octaves = 4, input_scale = segmentation_mult / 1.8}, apia_simple_billows{seed1 = 3100, octaves = 4, input_scale = segmentation_mult / 1.3}, apia_simple_billows{seed1 = 4100, octaves = 4, input_scale = segmentation_mult})",
      voronoi_large = "voronoi_facet_noise{x = x + apia_wobble_x * 3.5, y = y + apia_wobble_y * 3.5, seed0 = map_seed, seed1 = 'apia-archipelagos', grid_size = 90, distance_type = 'euclidean', jitter = 0.85}",
      voronoi_cell = "voronoi_cell_id{x = x + apia_wobble_x * 3.5, y = y + apia_wobble_y * 3.5, seed0 = map_seed, seed1 = 'apia-archipelagos', grid_size = 90, distance_type = 'euclidean', jitter = 0.85}",
      voronoi_small = "voronoi_facet_noise{x = x + apia_wobble_x * 3.5, y = y + apia_wobble_y * 3.5, seed0 = map_seed, seed1 = 'apia-islands', grid_size = 35, distance_type = 'euclidean', jitter = 0.9}",
      segmentation_mult = "apia_segmentation_multiplier / 12"
    }
  },

  -- Маска спаун-острова с естественной формой
  {
    type = "noise-expression",
    name = "apia_spawn_island_mask",
    expression = "clamp(apia_spawn_shape_noise - 0.3, 0, 1) * apia_spawn_falloff",
    local_expressions = {
      base_dist = "sqrt(x*x + y*y)",
      apia_spawn_shape_noise = "0.7 + multioctave_noise{x = x*0.8, y = y*0.8, seed0 = map_seed, seed1 = 45678, octaves = 3, persistence = 0.65, input_scale = 1/40} * 0.6",
      apia_spawn_falloff = "clamp(1.8 - base_dist / 30, 0, 1)"
    }
  },

  {
    type = "noise-expression",
    name = "apia_aux_scale",
    expression = "apia_segmentation_multiplier * 2.0"
  },
  {
    type = "noise-expression",
    name = "apia_wobble_x",
    expression = "multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 12243, octaves = 4, persistence = 0.7, input_scale = apia_aux_scale / 60, output_scale = 0.7}"
  },
  {
    type = "noise-expression",
    name = "apia_wobble_y",
    expression = "multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 13243, octaves = 4, persistence = 0.7, input_scale = apia_aux_scale / 60, output_scale = 0.7}"
  },
  {
    type = "noise-expression",
    name = "apia_aux",
    expression = "0.5 + multioctave_noise{x = x + apia_wobble_x * 140 / apia_aux_scale, y = y + apia_wobble_y * 140 / apia_aux_scale, seed0 = map_seed, seed1 = 14243, octaves = 4, persistence = 0.8, input_scale = apia_aux_scale / 12, output_scale = 1}"
  },
  {
    type = "noise-expression",
    name = "apia_temperature",
    expression = "temperature_basic - 30"
  },
  {
    type = "noise-expression",
    name = "apia_high_frequency_peaks",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.9, seed0 = map_seed, seed1 = 1, octaves = 4, input_scale = 1/15})"
  },
  {
    type = "noise-expression",
    name = "apia_land_mask",
    expression = "clamp((elevation + 8) / 16, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "apia_land_height",
    expression = "clamp((elevation + 4) / 20, 0, 1)"
  },

  -- Площадь, отведённая под внутренние биомы 4-6.
{
  type = "noise-expression",
  name = "apia_inner_area",
  expression = "clamp((elevation - apia_inner_floor_elev) / 5, 0, 1)",
  local_expressions = {
    -- floor(0) ≈ 20.0  (~ то, что раньше было ~80%)
    -- floor(1) = 12.5  (ровно старое 200%) ✓
    -- floor(6) ≈ 10.2  (старое 600%, вас устраивает) ✓
    apia_inner_floor_elev = "20 - 10.5 * apia_soil / (apia_soil + 0.4)"
  }
},

  {
    type = "noise-expression",
    name = "apia_archipelago_mask",
    expression = "clamp(apia_land_mask * 1.5 - 0.1, 0, 1) + apia_spawn_island_mask * 0.6"
  },
  {
    type = "noise-expression",
    name = "apia_ocean_depth",
    expression = "clamp(-elevation / 25, 0, 1)"
  },

  -- Глубокий океан пятнами
  {
    type = "noise-expression",
    name = "apia_deep_ocean_noise",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 3000, octaves = 3, input_scale = 1/200}"
  },
  {
    type = "noise-expression",
    name = "apia_deep_ocean_mask",
    expression = "apia_ocean_depth > 0.5 + apia_deep_ocean_noise * 0.15"
  },

  -- Обычный океан
  {
    type = "noise-expression",
    name = "apia_ocean_mask",
    expression = "apia_ocean_depth > 0.1"
  },

  -- Береговая линия (побережье)
  {
    type = "noise-expression",
    name = "apia_coastal_zone",
    expression = "clamp((1 - apia_land_height) * 2.0 - 1.2, 0, 1)"
  },

  {
    type = "noise-expression",
    name = "apia_biome_noise",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.85, seed0 = map_seed, seed1 = 500, octaves = 4, input_scale = 1/40}"
  },
  {
    type = "noise-expression",
    name = "apia_biome_detail",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 600, octaves = 3, input_scale = 1/15}"
  },

  -- Шум для распределения внутренних биомов
  {
    type = "noise-expression",
    name = "apia_inland_distribution",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.75, seed0 = map_seed, seed1 = 700, octaves = 3, input_scale = 1/35}"
  },

  -- Глубокий океан
  {
    type = "noise-expression",
    name = "apia_deep_ocean",
    expression = "apia_deep_ocean_mask * 1000"
  },

  -- Обычный океан
  {
    type = "noise-expression",
    name = "apia_ocean",
    expression = "(apia_ocean_mask * (1 - apia_deep_ocean_mask)) * 500"
  },

  -- 6 БИОМОВ с умеренным бустом на спаун-острове

  -- Биом 1: Побережье
  {
    type = "noise-expression",
    name = "apia_biome1",
    expression = "apia_archipelago_mask * apia_coastal_zone * 400 - abs(apia_biome_detail - 0.2) * 0.3 + elevation * 0.2 + apia_spawn_island_mask * 350"
  },

  -- Биом 2: Внутренний биом 1
  {
    type = "noise-expression",
    name = "apia_biome2",
    expression = "apia_archipelago_mask * clamp(apia_land_height * 1.5 - 0.05, 0, 1) * 450 - abs(apia_biome_detail - 0.35) * 0.25 + elevation * 0.5 + apia_inland_distribution * 0.5 + apia_spawn_island_mask * 400"
  },

  -- Биом 3: Внутренний биом 2
  {
    type = "noise-expression",
    name = "apia_biome3",
    expression = "apia_archipelago_mask * clamp(apia_land_height * 2.0 - 0.5, 0, 1) * 500 - abs(apia_biome_detail - 0.5) * 0.2 + elevation * 0.8 + apia_inland_distribution * 0.7 + apia_spawn_island_mask * 380"
  },

  -- === ВЫБОР ВНУТРЕННЕГО БИОМА ===
  -- Медленный шум, нормализованный в диапазон [0, 1] через (noise + 1) * 0.5.
  -- input_scale = 1/200: "пятно" ~200 тайлов, остров (~60 тайлов) целиком попадает в одну зону,
  -- но соседние острова уже могут попадать в разные зоны.
  {
    type = "noise-expression",
    name = "apia_inner_biome_selector",
    expression = "(multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 8888, octaves = 2, persistence = 0.7, input_scale = 1/200} + 1) * 0.5"
  },

  -- Пороги: 0.0–0.5 -> biome4 (50%), 0.5–0.75 -> biome5 (25%), 0.75+ -> biome6 (25%).
  -- Соотношение сохраняется независимо от apia_soil — меняется только общая
  -- площадь, отведённая под все три биома (через apia_inner_area).
  {
    type = "noise-expression",
    name = "apia_biome4_mask",
    expression = "(apia_inner_biome_selector < 0.5)"
  },
  {
    type = "noise-expression",
    name = "apia_biome5_mask",
    expression = "(apia_inner_biome_selector >= 0.5) * (apia_inner_biome_selector < 0.75)"
  },
  {
    type = "noise-expression",
    name = "apia_biome6_mask",
    expression = "(apia_inner_biome_selector >= 0.75)"
  },

  -- Биом 4: Внутренний биом 3 (частый вариант, ~50% отведённой площади)
  {
    type = "noise-expression",
    name = "apia_biome4",
    expression = "(apia_archipelago_mask * apia_inner_area * 550 - abs(apia_biome_detail - 0.65) * 0.15 + elevation * 1.2 + apia_inland_distribution * 0.9 + apia_spawn_island_mask * 250) * apia_biome4_mask"
  },

  -- Биом 5: Внутренний биом 3 (редкий вариант A, ~25% отведённой площади)
  {
    type = "noise-expression",
    name = "apia_biome5",
    expression = "(apia_archipelago_mask * apia_inner_area * 550 - abs(apia_biome_detail - 0.65) * 0.15 + elevation * 1.2 + apia_inland_distribution * 0.9 + apia_spawn_island_mask * 250) * apia_biome5_mask"
  },

  -- Биом 6: Внутренний биом 3 (редкий вариант B, ~25% отведённой площади)
  {
    type = "noise-expression",
    name = "apia_biome6",
    expression = "(apia_archipelago_mask * apia_inner_area * 550 - abs(apia_biome_detail - 0.65) * 0.15 + elevation * 1.2 + apia_inland_distribution * 0.9 + apia_spawn_island_mask * 250) * apia_biome6_mask"
  },

  -- Буст для внутренних биомов
  {
    type = "noise-expression",
    name = "apia_inland_boost",
    expression = "clamp(apia_land_height - 0.1, 0, 1) * 60 - clamp(apia_land_height - 0.7, 0, 1) * 40 + apia_spawn_island_mask * 30"
  },

  -- Плавные переходы между биомами
  {
    type = "noise-expression",
    name = "apia_biome_blend",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 750, octaves = 2, input_scale = 1/60}"
  },

  {
    type = "noise-expression",
    name = "apia_final_land",
    expression = "apia_archipelago_mask"
  },
  {
    type = "noise-expression",
    name = "apia_moisture",
    expression = "0.8 + multioctave_noise{x = x, y = y, persistence = 0.82, seed0 = map_seed, seed1 = 800, octaves = 3, input_scale = 1/80} * 0.2"
  },
  {
    type = "noise-expression",
    name = "apia_island_variety",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.78, seed0 = map_seed, seed1 = 900, octaves = 3, input_scale = 1/30}"
  },
})