local util = require("util")
local apia_utils = {}



local function generate_freshness_recipe_icon(item)
	
	local refresh_overlay_icon = "__apia__/graphics/icons/refresh.png"
	local icons = {}

	if item.icons then
		for i = 1, #item.icons do
			icons[#icons+1] = table.deepcopy(item.icons[i])
		end
	else
		icons[#icons+1] = {
		  icon = item.icon,
		  icon_size = item.icon_size
		}
	end

	icons[#icons+1] =
	{
		icon = refresh_overlay_icon,
		icon_size = 64
	}

	return icons
end

function apia_utils.generate_refresh_recipe(item)
	
	if item.apia_disable_refresh_recipe then
		return
	end
	
	if item.hidden then
		return
	end
	
	local forced = item.apia_force_refresh_recipe

	if not forced and (item.spoil_result ~= "spoilage" and item.spoil_to_trigger_result == nil) then
		return
	end
	
	if not item.spoil_ticks or item.spoil_ticks <= 1 then
		return
	end

	if item.fuel_category == "nutrients" then
		return
	end

	local recipe_name = item.name .. "-refresh-freshness"

	local lymph_percent = settings.startup["apia-lymph-consumption-percent"].value / 100
	local lymph_output = 10 * (1 - lymph_percent)
  
	local recipe =
	{
		type = "recipe",
		name = recipe_name,
		categories =
		{
			"refresh",
		},
		subgroup = "refresh",
		order = item.order,
		hidden = false,
		enabled = false,

		allow_productivity = false,
		allow_as_intermediate = false,
		allow_decomposition = false,
		allow_quality = false,

		energy_required = 2,

		localised_name = {"recipe-name.refresh-freshness", {"item-name." .. item.name}},
		icons = generate_freshness_recipe_icon(item),

		ingredients =
		{
		  {type = "item", name = item.name, amount = 1, ignored_by_productivity = 1},
		  {type = "fluid", name = "lymph", amount = 10, ignored_by_stats = 10, ignored_by_productivity = 10},
		},

		results =
		{
		  {type = "item", name = item.name, amount = 1, reset_freshness_on_craft = true, ignored_by_productivity = 1},
		  {type = "fluid", name = "dirty-lymph", amount = lymph_output, ignored_by_stats = lymph_output, ignored_by_productivity = lymph_output},
		}
	}

	data:extend({recipe})

	apia_utils.add_tech_effect(
		"refreshment",
		{ type = "unlock-recipe", recipe = recipe_name }
	)
end

function apia_utils.surface_conditions(planet)
	local surface_conditions
	if planet == "apia" then
		surface_conditions = 
		{
			{
				property = "pressure",
				min = 2525,
				max = 2525
			},
			{
				property = "gravity",
				min = 31.5625,
				max = 31.5625
			}
		}
	elseif planet == "carnova" then
		surface_conditions = 
		{
			{
				property = "pressure",
				min = 2525,
				max = 2525
			},
			{
				property = "gravity",
				min = 25.25,
				max = 25.25
			}
		}
	elseif planet == "apia-carnova" then
		surface_conditions = 
		{
			{
				property = "pressure",
				min = 2525,
				max = 2525
			},
		}
	end
	return surface_conditions
end
	

function apia_utils.add_tech_prerequisites(tech_name, prerequisites)
  local tech = data.raw.technology[tech_name]
  tech.prerequisites = tech.prerequisites or {}
  for _, prereq in ipairs(tech.prerequisites) do
    if prereq == prerequisites then
      return
    end
  end
  table.insert(tech.prerequisites, prerequisites)
end


function apia_utils.add_science_pack(tech_name, science_pack)
  local tech = data.raw.technology[tech_name]
  -- If `tech.unit` doesn't exist then it is a trigger tech rather than a science tech, cannot modify it in this way
  if tech.unit then
    tech.unit.ingredients = tech.unit.ingredients or {}
    table.insert(tech.unit.ingredients, science_pack)
  else
    log("Apia-Carnova: Unable to add science to tech `" .. tech_name .. "` due to it being a trigger technology, skipped.")
  end
end

function apia_utils.add_tech_effect(tech_name, effect)
  local tech = data.raw.technology[tech_name]
  tech.effects = tech.effects or {}
  table.insert(tech.effects, effect)
end

function apia_utils.add_ingredient_to_recipe(recipe_name, ingredient)
  local recipe = data.raw.recipe[recipe_name]
  if not recipe or not recipe.ingredients then
    return
  end

  local new_name = ingredient.name or ingredient[1]

  for _, ing in pairs(recipe.ingredients) do
    local name = ing.name or ing[1]
    if name == new_name then
      return
    end
  end

  table.insert(recipe.ingredients, ingredient)
end


function apia_utils.add_crafting_categories(proto, categories)
    if not proto or not proto.crafting_categories then return end
    for _, cat in pairs(categories) do
        local exists = false
        for _, existing in pairs(proto.crafting_categories) do
            if existing == cat then
                exists = true
                break
            end
        end
        if not exists then
            table.insert(proto.crafting_categories, cat)
        end
    end
end


function apia_utils.add_recycling_result(recipe_name, item, amount)
  local r = data.raw.recipe[recipe_name.."-recycling"]
  if r then
    r.results = r.results or {}
    table.insert(r.results,{type="item",name=item,amount=amount})
  end
end


return apia_utils