local apia_utils = require("lib")


data:extend
({
  {
    type = "recipe",
    name = "larvae-cultivation",
    icon = "__apia__/graphics/icons/larvae-cultivation.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "apiculture-processes",
    order = "a-a-b[larvae]",
    surface_conditions = apia_utils.surface_conditions("apia"),
    enabled = false,
    allow_productivity = true,
	auto_recycle = false,
	show_amount_in_title = false,
    energy_required = 4,
    ingredients =
    {
      {type = "item", name = "raw-larvae", amount = 1},
	  --{type = "item", name = "honey", amount = 1},
	  {type = "item", name = "nutrients", amount = 5},
      {type="fluid", name="royal-jelly", amount=50}
    },
    results =
    {
      {type = "item", name = "raw-larvae", amount = 4, reset_freshness_on_craft = true, quality_change = -1}
    },
  },
  {
    type = "recipe",
    name = "fossil-larvae-processing",
    icon = "__apia__/graphics/icons/fossil-larvae-processing.png",
	categories =
	{
		"apicultural",
		"crafting",
	},
    subgroup = "apiculture-processes",
    order = "a-b-b[fossil]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients = {{type = "item", name = "fossil-larvae", amount = 1}},
    results =
    {
		{type = "item", name = "stone", amount = 1, independent_probability = 0.5},
		--{type = "item", name = "iron-ore", amount = 1, independent_probability = 0.15},
		--{type = "item", name = "copper-ore", amount = 1, independent_probability = 0.10},
		{type = "item", name = "phosphorus", amount = 1, independent_probability = 0.1},
    },
  },
  {
    type = "recipe",
    name = "phosphoric-acid",
	categories =
	{
		"apicultural",
		"chemistry",
	},
    subgroup = "apia-carnova-products",
	order = "a-a-a",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 4,
	ingredients =
	{
		{type = "item", name = "phosphorus", amount = 10},
		{type="fluid", name="water", amount = 100}
    },
    results = {{type="fluid", name="phosphoric-acid", amount=100}},
  },
  {
    type = "recipe",
    name = "battery-from-phosphoric-acid",
	icon = "__apia__/graphics/icons/battery-from-phosphoric-acid.png",
	categories =
	{
		"apicultural",
		"chemistry",
	},
	subgroup = "apia-carnova-products",
	order = "a-a-b",
    energy_required = 4,
    enabled = false,
	allow_productivity = true,
    ingredients =
    {
      {type = "fluid", name = "phosphoric-acid", amount = 20},
      {type = "item", name = "iron-plate", amount = 1},
      {type = "item", name = "copper-plate", amount = 1}
    },
    results = {{type="item", name="battery", amount=1}},
  },
  {
    type = "recipe",
    name = "processing-unit-from-phosphoric-acid",
	icon = "__apia__/graphics/icons/processing-unit-from-phosphoric-acid.png",
    categories =
	{
		"apicultural",
		"crafting-with-fluid",
		"electromagnetics",
	},
	subgroup = "apia-carnova-products",
	order = "a-a-c",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
		{type = "item", name = "electronic-circuit", amount = 20},
		{type = "item", name = "advanced-circuit", amount = 2},
		{type = "fluid", name = "phosphoric-acid", amount = 10}
    },
    results = {{type="item", name="processing-unit", amount=1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "explosives-from-polysaccharides",
	icon = "__apia__/graphics/icons/explosives-from-polysaccharides.png",
    categories =
	{
		"apicultural",
		"chemistry",
	},
	subgroup = "apiculture-products",
	order = "b-c-a[explosives]",
    energy_required = 4,
    enabled = false,
    ingredients =
    {
		{type = "item", name = "phosphorus", amount = 1},
		{type = "item", name = "polysaccharides", amount = 3},
		{type = "fluid", name = "water", amount = 10}
    },
    results = {{type="item", name="explosives", amount=2}},
	auto_recycle = false,
	enabled = false,
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "artillery-shell-with-phosphorus",
    energy_required = 15,
    enabled = false,
    ingredients =
    {
		{type = "item", name = "radar", amount = 1},
		{type = "item", name = "phosphorus", amount = 2},
		{type = "item", name = "tungsten-plate", amount = 4},
		{type = "item", name = "explosives", amount = 8}
    },
    results = {{type="item", name="artillery-shell-with-phosphorus", amount=1}},
  },
  {
    type = "recipe",
    name = "flamethrower-ammo-from-phosphorus",
	icon = "__apia__/graphics/icons/flamethrower-ammo-from-phosphorus.png",
	categories =
	{
		"chemistry",
	},
	auto_recycle = false,
    enabled = false,
    energy_required = 6,
    ingredients =
    {
		{type = "item", name = "steel-plate", amount = 5},
		{type = "item", name = "phosphorus", amount = 3}
    },
    results = {{type="item", name="flamethrower-ammo", amount=1}},
  },
  {
    type = "recipe",
    name = "biolubricant-from-royal-jelly",
    icon = "__apia__/graphics/icons/biolubricant-from-royal-jelly.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "apiculture-products",
	order = "b-a-a[biolubricant]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 3,
	ingredients =
    {
		{type = "fluid", name="royal-jelly", amount = 100},
		{type = "fluid", name="water", amount = 20}
    },
    results =
    {
		{type = "fluid", name="lubricant", amount = 40}
    },
  },
  {
    type = "recipe",
    name = "honeycombs-processing",
    icon = "__apia__/graphics/icons/honeycombs-processing.png",
	categories =
	{
		"apicultural",
		"crafting",
	},
    subgroup = "apiculture-processes",
    order = "a-c-a[honeycombs]-b",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 3,
    ingredients = {{type = "item", name = "honeycombs", amount = 1}},
    results =
    {
		{type = "item", name = "wax", amount = 2},
		{type = "item", name = "honey", amount = 1},
    },
  },
  {
    type = "recipe",
    name = "honeycombs-iron-processing",
    icon = "__apia__/graphics/icons/honeycombs-iron-processing.png",
	categories =
	{
		"apicultural",
		"crafting",
	},
    subgroup = "apiculture-processes",
    order = "a-c-b[honeycombs]-b",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 3,
    ingredients = {{type = "item", name = "honeycombs-iron", amount = 1}},
    results =
    {
		{type = "item", name = "wax", amount = 2},
		{type = "item", name = "iron-ore", amount = 1},
    },
  },
  {
    type = "recipe",
    name = "honeycombs-copper-processing",
    icon = "__apia__/graphics/icons/honeycombs-copper-processing.png",
	categories =
	{
		"apicultural",
		"crafting",
	},
    subgroup = "apiculture-processes",
    order = "a-c-c[honeycombs]-b",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 3,
    ingredients = {{type = "item", name = "honeycombs-copper", amount = 1}},
    results =
    {
		{type = "item", name = "wax", amount = 2},
		{type = "item", name = "copper-ore", amount = 1},
    },
  },
  {
    type = "recipe",
    name = "nutrients-from-honey",
    icon = "__apia__/graphics/icons/nutrients-from-honey.png",
    categories =
	{
		"apicultural",
	},
    subgroup = "apiculture-processes",
    order = "a-n-a[nutrients]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 4,
    ingredients = {{type = "item", name = "honey", amount = 1}},
    results = {{type="item", name="nutrients", amount=4}},
  },
  {
    type = "recipe",
    name = "nutrients-from-polysaccharides",
    icon = "__apia__/graphics/icons/nutrients-from-polysaccharides.png",
    categories =
	{
		"apicultural",
	},
    subgroup = "apiculture-processes",
    order = "a-n-b[nutrients]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 2,
    ingredients = {{type = "item", name = "polysaccharides", amount = 5}},
    results = {{type="item", name="nutrients", amount=30}},
  },
  {
    type = "recipe",
    name = "honey-processing",
    icon = "__apia__/graphics/icons/honey-processing.png",
    categories =
	{
		"apicultural",
	},
    subgroup = "apiculture-products",
    order = "a-a-b[honey]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 6,
    ingredients = {{type = "item", name = "honey", amount = 10}},
    results =
    {
		{type = "item", name = "polysaccharides", amount = 3},
		{type = "fluid", name = "water", amount = 80}
    },
  },
  {
    type = "recipe",
    name = "honey-dehydration",
    icon = "__apia__/graphics/icons/honey-dehydration.png",
    categories =
	{
		"apicultural",
	},
    subgroup = "apiculture-products",
    order = "a-a-c[honey]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 8,
    ingredients = {{type = "item", name = "honey", amount = 10}},
    results =
    {
		{type = "item", name = "polysaccharides", amount = 4},
    },
  },
  {
    type = "recipe",
    name = "bioplastic-from-wax",
    icon = "__apia__/graphics/icons/bioplastic-from-wax.png",
    categories =
	{
		"apicultural",
	},
    subgroup = "apiculture-products",
	order = "b-b-a[bioplastic]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 3,
    ingredients =
	{
		{type = "item", name = "wax", amount = 10},
		{type = "fluid", name = "steam", amount = 20},
		{type = "fluid", name = "phosphoric-acid", amount = 60},
    },
    results =
	{
		{type = "item", name = "plastic-bar", amount = 10},
    },
  },
  {
    type = "recipe",
    name = "wax-platform",
    always_show_made_in = true,
	categories =
	{
		"crafting-with-fluid",
	},
    energy_required = 16,
	allow_productivity = false,
    ingredients =
    {
		{type = "fluid", name = "royal-jelly", amount = 400},
		{type = "item", name = "wax", amount = 50},
    },
    results = {{type="item", name="wax-platform", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "artificial-honey-soil",
    always_show_made_in = true,
	categories =
	{
		"crafting-with-fluid",
	},
	surface_conditions = apia_utils.surface_conditions("apia"),
    energy_required = 2,
	allow_productivity = true,
    ingredients =
    {
		{type = "item", name = "raw-larvae", amount = 10},
		{type = "item", name = "nutrients", amount = 50},
		{type = "item", name = "landfill", amount = 5},
		{type="fluid", name="water", amount = 100}
    },
    results = {{type="item", name="artificial-honey-soil", amount=10}},
    enabled = false
  },
  {
    type = "recipe",
    name = "artificial-copper-soil",
    always_show_made_in = true,
	categories =
	{
		"crafting-with-fluid",
	},
	surface_conditions = apia_utils.surface_conditions("apia"),
    energy_required = 2,
	allow_productivity = true,
    ingredients =
    {
		{type = "item", name = "copper-bacteria", amount = 1},
		{type = "item", name = "nutrients", amount = 50},
		{type = "item", name = "landfill", amount = 5},
		{type="fluid", name="water", amount = 100}
    },
    results = {{type="item", name="artificial-copper-soil", amount=10}},
    enabled = false
  },
  {
    type = "recipe",
    name = "artificial-iron-soil",
    always_show_made_in = true,
	categories =
	{
		"crafting-with-fluid",
	},
	surface_conditions = apia_utils.surface_conditions("apia"),
    energy_required = 2,
	allow_productivity = true,
    ingredients =
    {
		{type = "item", name = "iron-bacteria", amount = 1},
		{type = "item", name = "nutrients", amount = 50},
		{type = "item", name = "landfill", amount = 5},
		{type="fluid", name="water", amount = 100}
    },
    results = {{type="item", name="artificial-iron-soil", amount=10}},
    enabled = false
  },
  {
    type = "recipe",
    name = "honeycombs",
    icon = "__apia__/graphics/icons/honeycombs.png",
	categories =
	{
		"artificial-hive-process",
	},
    order = "c-a[honeycombs]-a",
    hide_from_player_crafting = true,
    auto_recycle = false,
    preserve_products_in_machine_output = true,
	surface_conditions = apia_utils.surface_conditions("apia"),
    energy_required = 10,
    ingredients = {},
    results =
    {
		{type = "item", name = "honeycombs", amount = 10}
    },
    enabled = true
  },
  {
    type = "recipe",
    name = "honeycombs-iron",
    icon = "__apia__/graphics/icons/honeycombs-iron.png",
	categories =
	{
		"artificial-hive-process",
	},
    order = "c-a[honeycombs]-b",
    hide_from_player_crafting = true,
    auto_recycle = false,
    preserve_products_in_machine_output = true,
	surface_conditions = apia_utils.surface_conditions("apia"),
    energy_required = 10,
    ingredients = {},
    results =
    {
		{type = "item", name = "honeycombs-iron", amount = 10}
    },
    enabled = true
  },
  {
    type = "recipe",
    name = "honeycombs-copper",
    icon = "__apia__/graphics/icons/honeycombs-copper.png",
	categories =
	{
		"artificial-hive-process",
	},
    order = "c-a[honeycombs]-c",
    hide_from_player_crafting = true,
    auto_recycle = false,
    preserve_products_in_machine_output = true,
	surface_conditions = apia_utils.surface_conditions("apia"),
    energy_required = 10,
    ingredients = {},
    results =
    {
		{type = "item", name = "honeycombs-copper", amount = 10}
    },
    enabled = true
  },
  {
    type = "recipe",
    name = "solid-fuel-from-polysaccharides",
    icon = "__apia__/graphics/icons/solid-fuel-from-polysaccharides.png",
	categories =
	{
		"apicultural",
	},
	subgroup = "apiculture-products",
	order = "b-d-a[solid-fuel]",
    enabled = false,
	auto_recycle = false,
    allow_productivity = true,
    energy_required = 2,
    ingredients =
	{
		{type = "item", name = "polysaccharides", amount = 1},
		{type = "item", name = "wax", amount = 4}
    },
    results =
    {
		{type = "item", name = "solid-fuel", amount = 1},
    },
  },
  {
    type = "recipe",
    name = "rocket-fuel-from-phosphoric-acid",
    icon = "__apia__/graphics/icons/rocket-fuel-from-phosphoric-acid.png",
    categories =
	{
		"apicultural",
	},
	subgroup = "apia-carnova-products",
	order = "a-a-d",
    enabled = false,
	auto_recycle = false,
    allow_productivity = true,
    energy_required = 10,
	ingredients =
    {
		{type = "item", name = "solid-fuel", amount = 10},
		{type = "fluid", name =  "phosphoric-acid", amount = 30},
    },
    results = {{type="item", name="rocket-fuel", amount=1}},
  },
  {
    type = "recipe",
    name = "artificial-hive",
    categories =
	{
		"apicultural",
	},
	subgroup = "apiculture",
    energy_required = 20,
    enabled = false,
	auto_recycle = false,
    allow_productivity = false,
    ingredients =
    {
      {type = "item", name = "wax", amount = 100},
	  {type = "item", name = "honeycombs", amount = 30},
      {type = "item", name = "electronic-circuit", amount = 10},
      {type = "item", name = "electric-engine-unit", amount = 5},
      {type = "fluid", name = "lubricant", amount = 100},
    },
    results = {{type = "item", name = "artificial-hive", amount = 1, reset_freshness_on_craft = true}},
	surface_conditions = apia_utils.surface_conditions("apia"),
  },
  {
    type = "recipe",
    name = "bio-solar-panel",
    categories =
	{
		"apicultural",
	},
	subgroup = "apiculture",
    energy_required = 20,
    enabled = false,
	auto_recycle = false,
    allow_productivity = false,
    ingredients =
    {	
		{type = "item", name = "electronic-circuit", amount = 25},
		{type = "item", name = "nutrients", amount = 100},
		{type = "item", name = "landfill", amount = 2},
		{type = "item", name = "tree-seed", amount = 5},
		{type = "fluid", name = "water", amount = 200},
    },
    results = {{type = "item", name = "bio-solar-panel", amount = 1, reset_freshness_on_craft = true}},
	surface_conditions = apia_utils.surface_conditions("apia-carnova"),
  },
  {
    type = "recipe",
    name = "biosynthesizer-apia",
	icon = "__apia__/graphics/icons/biosynthesizer-apia.png",
	categories =
	{
		"apicultural",
		"advanced-crafting",
	},
	subgroup = "apiculture",
    surface_conditions = apia_utils.surface_conditions("apia"),
    energy_required = 20,
    ingredients =
    {
		{type = "item", name = "nutrients", amount = 10},
		{type = "item", name = "raw-larvae", amount = 50},
		{type = "item", name = "steel-plate", amount = 20},
		{type = "item", name = "electronic-circuit", amount = 5},
		{type = "item", name = "landfill", amount = 2}
    },
    results = {{type="item", name="biosynthesizer", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "biosynthesizer-carnova",
	icon = "__apia__/graphics/icons/biosynthesizer-carnova.png",
	categories =
	{
		"apicultural",
		"advanced-crafting",
	},
	subgroup = "apiculture",
    surface_conditions = apia_utils.surface_conditions("carnova"),
    energy_required = 20,
    ingredients =
    {
		{type = "item", name = "nutrients", amount = 10},
		{type = "item", name = "piranha-roe", amount = 2},
		{type = "item", name = "steel-plate", amount = 20},
		{type = "item", name = "electronic-circuit", amount = 5},
		{type = "item", name = "landfill", amount = 2}
    },
    results = {{type="item", name="biosynthesizer", amount=1}},
    enabled = false
  },
  {
    type = "recipe",
    name = "bioreactor",
	categories =
	{
		"apicultural",
	},
	subgroup = "apiculture",
    surface_conditions = apia_utils.surface_conditions("apia-carnova"),
    energy_required = 25,
    ingredients =
    {
		{type = "item", name = "nutrients", amount = 50},
		{type = "item", name = "carbon-fiber", amount = 50},
		{type = "item", name = "electronic-circuit", amount = 20},
		{type = "item", name = "refined-concrete", amount = 30},
		{type = "fluid", name = "water", amount = 200}
    },
    results = {{type="item", name="bioreactor", amount=1}},
    enabled = false,
  },
  {
    type = "recipe",
    name = "flamethrower-capsule",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {type = "item", name = "flamethrower-ammo", amount = 3},
      {type = "item", name = "electronic-circuit", amount = 3},
      {type = "item", name = "iron-gear-wheel", amount = 3}
    },
    results = {{type="item", name="flamethrower-capsule", amount=1}}
  },
  {
    type = "recipe",
    name = "simple-bone-processing",
    icon = "__apia__/graphics/icons/simple-bone-processing.png",
	categories =
	{
		"apicultural",
		"crafting",
	},
    subgroup = "sarciculture-processes",
    order = "a-a-b[bones]",
    enabled = false,
    allow_productivity = true,
	auto_recycle = false,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "bones", amount = 1},
    },
    results =
    {
      {type = "item", name = "bone-meal", amount = 4},
    },
  },
  {
    type = "recipe",
    name = "advanced-bone-processing",
    icon = "__apia__/graphics/icons/advanced-bone-processing.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-processes",
    order = "a-a-c[bones]",
    enabled = false,
    allow_productivity = true,
	auto_recycle = false,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "bones", amount = 1},
    },
    results =
    {
      {type = "item", name = "bone-meal", amount = 4},
	  {type = "item", name = "calcite", amount = 1, independent_probability = 0.25},
	  {type = "item", name = "phosphorus", amount = 1, independent_probability = 0.1},
    },
  },
  {
    type = "recipe",
    name = "roe-reproduction",
	icon = "__apia__/graphics/icons/roe-reproduction.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-processes",
    order = "a-c-b[roe]",
	surface_conditions = apia_utils.surface_conditions("carnova"),
    enabled = false,
    allow_productivity = true,
	auto_recycle = false,
    energy_required = 16,
    ingredients =
    {
      {type = "item", name = "piranha-roe", amount = 1, ignored_by_stats = 1},
	  {type = "item", name = "proteins", amount = 3},
      {type = "fluid", name = "blood", amount = 100}
    },
    results =
    {
      {type = "item", name = "piranha-roe", amount = 3, reset_freshness_on_craft = true, ignored_by_stats = 1, ignored_by_productivity = 1},
    },
  },
  {
    type = "recipe",
    name = "lymph-refining",
    icon = "__apia__/graphics/icons/lymph-refining.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-products",
    order = "a-a-a[lymph]",
    enabled = false,
    allow_productivity = false,
	auto_recycle = false,
    energy_required = 6,
    ingredients =
    {
      {type = "fluid", name = "dirty-lymph", amount = 100, ignored_by_stats = 100, ignored_by_productivity = 100},
	  {type = "item", name = "calcite", amount = 1},
    },
    results =
    {
	  {type = "fluid", name = "lymph", amount = 100, ignored_by_stats = 100, ignored_by_productivity = 100},
	  {type = "item", name = "carbon", amount = 2, independent_probability = 0.5},
    },
  },
  {
    type = "recipe",
    name = "blood-separation",
    icon = "__apia__/graphics/icons/blood-separation.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-products",
    order = "a-b-a[blood]",
    enabled = false,
    allow_productivity = true,
	auto_recycle = false,
    energy_required = 3,
    ingredients =
    {
	  {type = "fluid", name = "blood", amount = 200},
	  {type = "fluid", name = "lymph", amount = 50, ignored_by_stats = 50, ignored_by_productivity = 50},
    },
    results =
    {
	  {type = "item", name = "nutrients", amount = 4},
	  {type = "fluid", name = "water", amount = 100},
	  {type = "fluid", name = "dirty-lymph", amount = 50, ignored_by_stats = 50, ignored_by_productivity = 50},
    },
  },
  {
    type = "recipe",
    name = "bone-meal-smelting",
	icon = "__base__/graphics/icons/stone.png",
	categories =
	{
		"smelting",
	},
	subgroup = "sarciculture-products",
	order = "a-c-b[bone-meal]",
    auto_recycle = false,
	enabled = false,
    energy_required = 3.2,
    ingredients = {{type = "item", name = "bone-meal", amount = 2}},
    results =
    {
	  {type = "item", name = "stone", amount = 1},
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "bone-meal-sieving",
	icon = "__apia__/graphics/icons/bone-meal-sieving.png",
	categories =
	{
		"apicultural",
		"crafting",
	},
	subgroup = "sarciculture-products",
	order = "a-c-c[bone-meal]",
    auto_recycle = false,
	enabled = false,
    energy_required = 1,
    ingredients = {{type = "item", name = "bone-meal", amount = 2}},
    results =
    {
	  {type = "item", name = "bone-meal", amount = 1, independent_probability = 0.5, ignored_by_productivity = 1},
	  {type = "item", name = "iron-ore", amount = 1, independent_probability = 0.3},
	  {type = "item", name = "copper-ore", amount = 1, independent_probability = 0.1},
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "flesh-reproduction",
    icon = "__apia__/graphics/icons/flesh-reproduction.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-processes",
    order = "a-b-c[flesh]",
    surface_conditions = apia_utils.surface_conditions("carnova"),
    enabled = false,
    allow_productivity = true,
	auto_recycle = false,
    energy_required = 2,
    ingredients =
    {
	  {type = "item", name = "flesh", amount = 1},
	  {type = "item", name = "nutrients", amount = 5},
	  {type = "fluid", name = "lymph", amount = 10, ignored_by_productivity = 5},
    },
    results =
    {
	  {type = "item", name = "flesh", amount = 4},
	  {type = "fluid", name = "dirty-lymph", amount = 5, ignored_by_productivity = 5},
    },
  },
  {
    type = "recipe",
    name = "flesh-separation",
    icon = "__apia__/graphics/icons/flesh-separation.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-processes",
    order = "a-b-b[flesh]",
    enabled = false,
    allow_productivity = true,
	auto_recycle = false,
    energy_required = 2,
    ingredients =
    {
	  {type = "item", name = "flesh", amount = 1},
	  {type = "fluid", name = "lymph", amount = 10, ignored_by_productivity = 5},
    },
    results =
    {
	  {type = "item", name = "lipids", amount = 2},
	  {type = "item", name = "proteins", amount = 1},
	  {type = "fluid", name = "dirty-lymph", amount = 5, ignored_by_productivity = 5},
    },
  },
  {
    type = "recipe",
    name = "nutrients-from-lipids",
    icon = "__apia__/graphics/icons/nutrients-from-lipids.png",
    categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-processes",
    order = "a-n-a[nutrients]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 2,
	ingredients =
    {
	  {type = "item", name = "lipids", amount = 2},
    },
    results =
    {
	  {type = "item", name = "nutrients", amount = 8},
    },
  },
  {
    type = "recipe",
    name = "nutrients-from-proteins",
    icon = "__apia__/graphics/icons/nutrients-from-proteins.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-processes",
    order = "a-n-b[nutrients]",
	auto_recycle = false,
    enabled = false,
    allow_productivity = true,
    energy_required = 3,
	ingredients =
    {
	  {type = "item", name = "proteins", amount = 2},
    },
    results =
    {
	  {type = "item", name = "nutrients", amount = 12},
    },
  },
  {
    type = "recipe",
    name = "solid-fuel-from-glycerine",
    icon = "__apia__/graphics/icons/solid-fuel-from-glycerine.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-products",
	order = "a-f-f[solid-fuel]",
    enabled = false,
    allow_productivity = true,
	auto_recycle = false,
    energy_required = 1,
    ingredients =
    {
	  {type = "fluid", name = "glycerine", amount = 20},
	  {type = "item", name = "carbon", amount = 3},
    },
    results =
    {
	  {type = "item", name = "solid-fuel", amount = 1},
    },
  },
  {
    type = "recipe",
    name = "glycerine",
	categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-products",
	order = "a-f-a[glycerine]",
    enabled = false,
    allow_productivity = true,
	auto_recycle = false,
    energy_required = 1,
    ingredients =
    {
	  {type = "item", name = "lipids", amount = 10},
	  {type = "fluid", name = "water", amount = 100},
    },
    results =
    {
	  {type = "fluid", name = "glycerine", amount = 50},
    },
  },
  {
    type = "recipe",
    name = "biolubricant-from-glycerine",
	icon = "__apia__/graphics/icons/lubricant-from-glycerine.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-products",
	order = "a-f-b[biolubricant]",
    enabled = false,
    allow_productivity = true,
	auto_recycle = false,
    energy_required = 3,
    ingredients =
    {
	  {type = "fluid", name = "glycerine", amount = 20},
    },
    results =
    {
	  {type = "fluid", name = "lubricant", amount = 10},
    },
  },
  {
    type = "recipe",
    name = "explosives-from-nitroglycerine",
    icon = "__apia__/graphics/icons/explosives-from-nitroglycerine.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-products",
	order = "a-f-e[solid-fuel]",
    enabled = false,
    allow_productivity = true,
	auto_recycle = false,
    energy_required = 4,
	ingredients =
    {
		{type = "item", name = "phosphorus", amount = 1},
		{type = "item", name = "carbon", amount = 2},
		{type = "fluid", name = "glycerine", amount = 20}
    },
    results = {{type="item", name="explosives", amount=3}},
  },
  {
    type = "recipe",
    name = "bioplastic-from-proteins",
    icon = "__apia__/graphics/icons/bioplastic-from-proteins.png",
	categories =
	{
		"apicultural",
	},
    subgroup = "sarciculture-products",
	order = "a-f-d[bioplastic]",
    enabled = false,
    allow_productivity = true,
	auto_recycle = false,
    energy_required = 3,
	ingredients =
	{
		{type = "item", name = "lipids", amount = 2},
		{type = "item", name = "proteins", amount = 4},
		{type = "fluid", name = "phosphoric-acid", amount = 40},
    },
    results =
	{
		{type = "item", name = "plastic-bar", amount = 6},
    },
  },
  {
    type = "recipe",
    name = "apicultural-science-pack",
    icon = "__apia__/graphics/icons/apicultural-science-pack.png",
    categories =
	{
		"apicultural",
	},
	subgroup = "science-pack",
    enabled = false,
	auto_recycle = false,
    allow_productivity = true,
    energy_required = 6,
    ingredients =
	{
		{type = "item", name = "wax", amount = 6},
		{type = "item", name = "polysaccharides", amount = 2},
		{type = "item", name = "piranha-roe", amount = 1},
		{type = "fluid", name = "glycerine", amount = 20},
		{type = "fluid", name = "lymph", amount = 20, ignored_by_productivity = 10},
    },
    results =
    {
		{type = "item", name = "apicultural-science-pack", amount = 1},
		{type = "fluid", name = "dirty-lymph", amount = 10, ignored_by_productivity = 10},
    },
	main_product = "apicultural-science-pack",
	surface_conditions = apia_utils.surface_conditions("apia-carnova"),
  },
})




if settings.startup["apia-flesh-reset-freshness-on-craft"].value then
	local recipe = data.raw.recipe["flesh-reproduction"]
    if recipe and recipe.results then
        for _, result in pairs(recipe.results) do
            if result.type == "item" then
                result.reset_freshness_on_craft = true
            end
        end
    end
end