local HIVE_NAME = "artificial-hive"

local TILE_DATA =
{
	["apia-biome4"]          = { recipe = "honeycombs" },
	["artificial-honey-soil"] = { recipe = "honeycombs" },

	["apia-biome5"]           = { recipe = "honeycombs-copper" },
	["artificial-copper-soil"] = { recipe = "honeycombs-copper" },

	["apia-biome6"]         = { recipe = "honeycombs-iron" },
	["artificial-iron-soil"] = { recipe = "honeycombs-iron" },
}

local function on_carnova_chunk_generated(event)
	if storage.carnova_spawned_spidertron then
		return
	end

	local surface = event.surface
	if surface.name ~= "carnova" then
		return
	end

	local area = event.area
	if not (
		area.left_top.x <= 0 and area.right_bottom.x > 0 and
		area.left_top.y <= 0 and area.right_bottom.y > 0
	) then
		return
	end

	local rng = game.create_random_generator(surface.map_gen_settings.seed + 777)

	local position
	local min_radius = 20
	local max_radius = 50

	for i = 1, 30 do
		local angle = rng() * math.pi * 2
		local radius = min_radius + rng() * (max_radius - min_radius)

		local candidate = {
			x = math.cos(angle) * radius,
			y = math.sin(angle) * radius
		}

		if surface.can_place_entity{
			name = "rotting-spidertron-remains",
			position = candidate
		} then
			position = candidate
			break
		end
	end

	position = position or {0, 0}

	local entity = surface.create_entity{
		name = "rotting-spidertron-remains",
		position = position,
		force = "neutral"
	}

	if entity and entity.valid and entity.get_inventory then
		local inv = entity.get_inventory(defines.inventory.chest)

		if inv then
			local function safe_insert(name, count)
				if prototypes.item[name] then
					inv.insert{name = name, count = count}
				end
			end

			safe_insert("pistol", 1)
			safe_insert("firearm-magazine", math.random(1, 50))
			safe_insert("iron-plate", math.random(5, 100))
			safe_insert("copper-plate", math.random(5, 100))
			safe_insert("steel-plate", math.random(5, 100))
			safe_insert("electronic-circuit", math.random(5, 100))
			safe_insert("repair-pack", math.random(2, 25))
		end
	end

	storage.carnova_spawned_spidertron = true
end

local function get_hive_recipe(hive)
	local box = hive.bounding_box

	local min_x = math.floor(box.left_top.x)
	local max_x = math.ceil(box.right_bottom.x) - 1
	local min_y = math.floor(box.left_top.y)
	local max_y = math.ceil(box.right_bottom.y) - 1

	local counts = {}
	local order = {}

	for x = min_x, max_x do
		for y = min_y, max_y do
			local tile = hive.surface.get_tile(x, y)
			if not tile then
				return nil
			end

			local data = TILE_DATA[tile.name]
			if not data then
				return nil
			end

			local recipe = data.recipe

			if counts[recipe] == nil then
				counts[recipe] = 0
				order[#order + 1] = recipe
			end

			counts[recipe] = counts[recipe] + 1
		end
	end

	local best_recipe
	local best_count = 0

	for _, recipe in ipairs(order) do
		local count = counts[recipe]

		if count > best_count then
			best_count = count
			best_recipe = recipe
		elseif count == best_count then
			-- при равенстве выбираем рецепт с большим игровым именем
			if recipe > best_recipe then
				best_recipe = recipe
			end
		end
	end

	return best_recipe
end

local function update_hive_recipe(hive)
	if not hive.valid then
		return
	end

	local recipe = get_hive_recipe(hive)

	if not recipe then
		hive.destroy()
		return
	end

	local current_recipe = hive.get_recipe()

	if not current_recipe or current_recipe.name ~= recipe then
		hive.set_recipe(recipe)
	end

	hive.recipe_locked = true
end

local function update_hives_on_tiles(surface, tiles)
	local hives = {}

	for _, tile in pairs(tiles) do
		local nearby_hives = surface.find_entities_filtered
		{
			name = HIVE_NAME,
			position = tile.position,
			radius = 3
		}

		for _, hive in pairs(nearby_hives) do
			if hive.valid and hive.unit_number then
				hives[hive.unit_number] = hive
			end
		end
	end

	for _, hive in pairs(hives) do
		update_hive_recipe(hive)
	end
end

local function on_hive_built(event)
	if event.entity.valid and event.entity.name == HIVE_NAME then
		update_hive_recipe(event.entity)
	end
end

local function on_tiles_changed(event)
	update_hives_on_tiles(
		game.get_surface(event.surface_index),
		event.tiles
	)
end

script.on_event(defines.events.on_built_entity, on_hive_built)
script.on_event(defines.events.on_robot_built_entity, on_hive_built)

script.on_event(defines.events.on_player_built_tile, on_tiles_changed)
script.on_event(defines.events.on_robot_built_tile, on_tiles_changed)
script.on_event(defines.events.script_raised_set_tiles, on_tiles_changed)

script.on_event(defines.events.on_chunk_generated, on_carnova_chunk_generated)