config = {}

config.debug = false
config.emptyCrate = "empty_crate" -- DB name of the item to use as the empty crate
config.emptyBox = "empty_box" -- DB name of the item to use as the empty box
config.craftTime = 8000 -- Time in ms to craft a crate or box

-- Define crate configurations
config.crates = {
    {
        name = "orange_crate", -- DB Name of the crate
        label = "Crate of Oranges", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "orange", quantity = 200}
        }
    },
    {
        name = "blueberry_crate", -- DB Name of the crate
        label = "Crate of Blueberrys", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "blueberry", quantity = 200}
        }
    },
    {
        name = "apple_crate", -- DB Name of the crate
        label = "Crate of Apples", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "apple", quantity = 200},
        }
    },
    {
        name = "Indian_Tobbaco_crate", -- DB Name of the crate
        label = "Crate of Indian Tobbaco", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Indian_Tobbaco", quantity = 200},
        }
    },
    {
        name = "cotton_crate", -- DB Name of the crate
        label = "Crate of Cotton", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "cotton", quantity = 200},
        }
    },
    {
        name = "Oregano_crate", -- DB Name of the crate
        label = "Crate of Oregano", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Oregano", quantity = 200},
        }
    },
    {
        name = "Basil_crate", -- DB Name of the crate
        label = "Crate of Basil", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Basil", quantity = 200},
        }
    },
    {
        name = "Agarita_crate", -- DB Name of the crate
        label = "Crate of Agarita", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Agarita", quantity = 200},
        }
    },
    {
        name = "Creeking_Thyme_crate", -- DB Name of the crate
        label = "Crate of Creeking Thyme", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Creeking_Thyme", quantity = 200},
        }
    },
    {
        name = "Milk_Weed_crate", -- DB Name of the crate
        label = "Crate of Milk Weed", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Milk_Weed", quantity = 200},
        }
    },
    {
        name = "Crows_Garlic_crate", -- DB Name of the crate
        label = "Crate of Crows Garlic", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Crows_Garlic", quantity = 200},
        }
    },
    {
        name = "English_Mace_crate", -- DB Name of the crate
        label = "Crate of English Mace", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "English_Mace", quantity = 200},
        }
    },
    {
        name = "Hummingbird_Sage", -- DB Name of the crate
        label = "Crate of Hummingbird Sage", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Hummingbird_Sage", quantity = 200},
        }
    },
    {
        name = "Oleander_Sage_crate", -- DB Name of the crate
        label = "Crate of Oleander Sage", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Oleander_Sage", quantity = 200},
        }
    },
    {
        name = "Desert_Sage_crate", -- DB Name of the crate
        label = "Crate of Desert Sage", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Desert_Sage", quantity = 200},
        }
    },
    {
        name = "American_Ginseng_crate", -- DB Name of the crate
        label = "Crate of American Ginseng", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "American_Ginseng", quantity = 200},
        }
    },
    {
        name = "Alaskan_Ginseng_crate", -- DB Name of the crate
        label = "Crate of Alaskan Ginseng", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Alaskan_Ginseng", quantity = 200},
        }
    },
    {
        name = "Red_Raspberry_crate", -- DB Name of the crate
        label = "Crate of Red Raspberry", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Red_Raspberry", quantity = 200},
        }
    },
    {
        name = "Grain_crate", -- DB Name of the crate
        label = "Crate of Grain", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Grain", quantity = 200},
        }
    },
    {
        name = "Agave_crate", -- DB Name of the crate
        label = "Crate of Agave", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Agave", quantity = 200},
        }
    },
    {
        name = "Red_Sage_crate", -- DB Name of the crate
        label = "Crate of Red Sage", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Red_Sage", quantity = 200},
        }
    },
    {
        name = "Black_Currant_crate", -- DB Name of the crate
        label = "Crate of Black Currant", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Black_Currant", quantity = 200},
        }
    },
    {
        name = "Bitter_Weed_crate", -- DB Name of the crate
        label = "Crate of Bitter Weed", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Bitter_Weed", quantity = 200},
        }
    },
    {
        name = "Evergreen_Huckleberry_crate", -- DB Name of the crate
        label = "Crate of Evergreen Huckleberry", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Evergreen_Huckleberry", quantity = 200},
        }
    },
    {
        name = "Bulrush_crate", -- DB Name of the crate
        label = "Crate of Bulrush", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Bulrush", quantity = 200},
        }
    },
    {
        name = "Wisteria_crate", -- DB Name of the crate
        label = "Crate of Wisteria", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Wisteria", quantity = 200},
        }
    },
    {
        name = "Wild_Rhubarb_crate", -- DB Name of the crate
        label = "Crate of Wild Rhubarb", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Wild_Rhubarb", quantity = 200},
        }
    },
    {
        name = "Wintergreen_Berry_crate", -- DB Name of the crate
        label = "Crate of Wintergreen Berry", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "Wintergreen_Berry", quantity = 200},
        }
    },
    {
        name = "sugarcane_crate", -- DB Name of the crate
        label = "Crate of Sugarcane", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "sugarcane", quantity = 200},
        }
    },
    {
        name = "lemon_crate", -- DB Name of the crate
        label = "Crate of Lemons", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "lemon", quantity = 200},
        }
    },
    {
        name = "tomato_crate", -- DB Name of the crate
        label = "Crate of Tomatos", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "tomato", quantity = 200},
        }
    },
    {
        name = "potato_crate", -- DB Name of the crate
        label = "Crate of Potatos", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "potato", quantity = 200},
        }
    },
    {
        name = "goldnugget_crate", -- DB Name of the crate
        label = "Crate of Golden Nuggets", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "goldnugget", quantity = 50},
        }
    },
    {
        name = "rock_crate", -- DB Name of the crate
        label = "Crate of Rocks", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "rock", quantity = 50},
        }
    },
    {
        name = "sand_crate", -- DB Name of the crate
        label = "Crate of Sand", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "sand", quantity = 50},
        }
    },
    {
        name = "coal_ore_crate", -- DB Name of the crate
        label = "Crate of Coal Ore", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "coal_ore", quantity = 50},
        }
    },
    {
        name = "nitrite_crate", -- DB Name of the crate
        label = "Crate of Nitrite", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "nitrite", quantity = 50},
        }
    },
    {
        name = "sulfur_crate", -- DB Name of the crate
        label = "Crate of Sulfur", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "sulfur", quantity = 50},
        }
    },
    {
        name = "iron_crate", -- DB Name of the crate
        label = "Crate of Iron", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "iron", quantity = 50},
        }
    },
    {
        name = "silverore_crate", -- DB Name of the crate
        label = "Crate of Silver Ore", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "silverore", quantity = 50},
        }
    },
    {
        name = "copper_crate", -- DB Name of the crate
        label = "Crate of Copper", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "copper", quantity = 50},
        }
    },
    {
        name = "rock_salt_crate", -- DB Name of the crate
        label = "Crate of Rock Salt", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "rock_salt", quantity = 50},
        }
    },
    {
        name = "coal_crate", -- DB Name of the crate
        label = "Crate of Coal", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "coal", quantity = 50},
        }
    },
    {
        name = "glassbottle_crate", -- DB Name of the crate
        label = "Crate of Glass Bottles", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "glassbottle", quantity = 24},
        }
    },
    {
        name = "small_woodlog_crate", -- DB Name of the crate
        label = "Crate of small woodlog", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "small_woodlog", quantity = 12},
        }
    },
    {
        name = "firewood_crate", -- DB Name of the crate
        label = "Crate of Firewood", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "firewood", quantity = 24},
        }
    },
    {
        name = "wood_crate", -- DB Name of the crate
        label = "Crate of Soft Wood", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "wood", quantity = 20},
        }
    },
    {
        name = "hwood_crate", -- DB Name of the crate
        label = "Crate of Hard Wood", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "hwood", quantity = 20},
        }
    },
    {
        name = "ironbar_crate", -- DB Name of the crate
        label = "Crate of Iron Bars", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "iron", quantity = 50},
        }
    },
    {
        name = "goldbar_crate", -- DB Name of the crate
        label = "Crate of Gold Bars", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "iron", quantity = 50},
        }
    },
    {
        name = "silverbar_crate", -- DB Name of the crate
        label = "Crate of Silver Bars", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "iron", quantity = 50},
        }
    },
    {
        name = "copperbar_crate", -- DB Name of the crate
        label = "Crate of Copper Bars", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "iron", quantity = 50},
        }
    },
    {
        name = "cocoa_crate", -- DB Name of the crate
        label = "Crate of cocoa", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "cocoa", quantity = 200},
        }
    },
    {
        name = "coffeebean_crate", -- DB Name of the crate
        label = "Crate of Coffee Beans", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "coffeebean", quantity = 200},
        }
    },
    {
        name = "grapes_crate", -- DB Name of the crate
        label = "Crate of Grapes", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "coffeebean", quantity = 200},
        }
    },
    {
        name = "corn_crate", -- DB Name of the crate
        label = "Crate of Corn", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "corn", quantity = 200},
        }
    },
    {
        name = "steelbar_crate", -- DB Name of the crate
        label = "Crate of Steel Bars", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "iron", quantity = 50},
        }
    },
    {
        name = "strawberry_crate", -- DB Name of the crate
        label = "Crate of strawberries", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "strawberry", quantity = 200},
        }
    },
    {
        name = "vanilla_crate", -- DB Name of the crate
        label = "Crate of vanilla", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "vanilla", quantity = 200},
        }
    },
    {
        name = "carrot_crate", -- DB Name of the crate
        label = "Crate of carrots", -- Label of the crate
        requiredItems = { -- Required items to create the crate
            {item = "carrot", quantity = 200},
        }
    },
}

-- Define box configurations (same items, different container)
config.boxes = {
    {
        name = "ammo_box",
        label = "Ammo Box",
        requiredItems = {
            {item = "ammorevolvernormal", quantity = 5},
            {item = "WEAPON_REVOLVER_CATTLEMAN", quantity = 1},
            {item = "WEAPON_RIFLE_BOLTACTION", quantity = 1}
        },        
        job = "gunsmith" -- Only 'gunsmith' job can pack this box
    },

}
