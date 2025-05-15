local VORPcore = exports.vorp_core:GetCore()
local VorpInv = exports.vorp_inventory:vorp_inventoryApi()

function createWeaponWithDefaults(source, weaponName)
    local char = VORPcore.getUser(source).getUsedCharacter
    local identifier = char.identifier or GetPlayerIdentifier(source, 0)

    local defaultAmmo = { ["nothing"] = 0 }
    local defaultComponents = { "nothing" }

    local status, result = pcall(function()
        TriggerEvent("vorpCore:registerWeapon", source, weaponName, defaultAmmo, nil, defaultComponents,
            function(res)
                if config.debug then
                    print("[DEBUG] Custom weapon creation result:", json.encode(res))
                end
            end,
            nil, nil, nil
        )
    end)

    if not status then
        print("[ERROR] Failed to create weapon with defaults:", result)
        return false
    end
    return true
end

local function checkCraftableItems(source, typeUsed)
    local _source = source
    local craftableItems = {}
    local char = VORPcore.getUser(_source).getUsedCharacter
    local job = char.job

    exports.vorp_inventory:getUserInventoryItems(_source, function(inventory)
        if typeUsed == "crate" then
            for _, crate in ipairs(config.crates) do
                local canCraft = true
                for _, required in ipairs(crate.requiredItems) do
                    local itemAmount = exports.vorp_inventory:getItemCount(_source, nil, required.item, nil)
                    if itemAmount < required.quantity then
                        canCraft = false
                        break
                    end
                end
                if canCraft then
                    table.insert(craftableItems, crate)
                end
            end
        elseif typeUsed == "box" then
            for _, box in ipairs(config.boxes) do
                local canCraft = true
                for _, required in ipairs(box.requiredItems) do
                    if string.sub(required.item, 1, 7) == "WEAPON_" then
                        local weapons = VorpInv.getUserWeapons(_source)
                        local hasWeapon = false
                        for _, weapon in pairs(weapons) do
                            if weapon.name == required.item then
                                hasWeapon = true
                                break
                            end
                        end
                        if not hasWeapon then
                            canCraft = false
                            break
                        end
                    else
                        local itemAmount = exports.vorp_inventory:getItemCount(_source, nil, required.item, nil)
                        if itemAmount < required.quantity then
                            canCraft = false
                            break
                        end
                    end
                end
                if canCraft and (not box.job or box.job == job) then
                    table.insert(craftableItems, box)
                end
            end
        end

        TriggerClientEvent("bella-packingcrates:crateItems", _source, craftableItems, typeUsed)
    end)
end

exports.vorp_inventory:registerUsableItem(config.emptyCrate, function(data)
    checkCraftableItems(data.source, "crate")
end)

exports.vorp_inventory:registerUsableItem(config.emptyBox, function(data)
    checkCraftableItems(data.source, "box")
end)
RegisterServerEvent("bella-packingcrates:createCrates")
AddEventHandler("bella-packingcrates:createCrates", function(crateName)
    local _source = source
    local container
    local isBox = false
    local char = VORPcore.getUser(_source).getUsedCharacter
    local job = char.job

    for _, crate in ipairs(config.crates) do
        if crate.name == crateName then
            container = crate
            break
        end
    end

    for _, box in ipairs(config.boxes) do
        if box.name == crateName then
            container = box
            isBox = true
            break
        end
    end

    if not container then return end

    if container.job and container.job ~= job then
        TriggerClientEvent("vorp:TipRight", _source, "You must be a " .. container.job .. " to pack this.", 4000)
        return
    end

    local requiredEmpty = isBox and config.emptyBox or config.emptyCrate
    if exports.vorp_inventory:getItemCount(_source, nil, requiredEmpty, nil) < 1 then
        TriggerClientEvent("vorp:TipRight", _source, "You need an empty container to pack.", 4000)
        return
    end

    for _, req in ipairs(container.requiredItems) do
        if string.sub(req.item, 1, 7) == "WEAPON_" then
            local weapons = VorpInv.getUserWeapons(_source)
            local found = false
            for _, w in pairs(weapons) do
                if w.name == req.item then
                    VorpInv.subWeapon(_source, w.id)
                    found = true
                    break
                end
            end
            if not found then
                TriggerClientEvent("vorp:TipRight", _source, "Missing weapon: " .. req.item, 4000)
                return
            end
        else
            exports.vorp_inventory:subItem(_source, req.item, req.quantity, nil)
        end
    end

    exports.vorp_inventory:subItem(_source, requiredEmpty, 1, nil)
    exports.vorp_inventory:addItem(_source, container.name, 1, nil)
    TriggerClientEvent("vorp:TipRight", _source, "Packed: " .. container.label, 3000)
end)

local function unpackContainer(_source, container)
    if config.debug then
        print("[DEBUG] unpackContainer called with container = " .. tostring(container.name))
    end

    local success = true

    if exports.vorp_inventory:getItemCount(_source, nil, container.name) < 1 then
        TriggerClientEvent("vorp:TipRight", _source, "You don't have a " .. tostring(container.label), 3000)
        return
    end

    TriggerClientEvent('bella-crates:StartCraftingAnimation', _source, container.label)
    Wait(config.craftTime)

    for _, req in ipairs(container.requiredItems or {}) do
        if not req.item or not req.quantity then
            if config.debug then print("[ERROR] Invalid item entry: ", req.item) end
            success = false
        else
            if config.debug then print("[DEBUG] Unpacking item: " .. req.item .. " x" .. tostring(req.quantity)) end

            if string.sub(req.item, 1, 7) == "WEAPON_" then
                local ok = createWeaponWithDefaults(_source, req.item)
                if not ok then success = false end
            else
                local ok, err = pcall(function()
                    exports.vorp_inventory:addItem(_source, req.item, req.quantity, nil)
                end)
                if not ok then
                    print("[ERROR] Failed to add item: ", err)
                    success = false
                end
            end
        end
    end

    if config.debug then print("[DEBUG] Finished loop. Success =", tostring(success)) end

    if success then
        exports.vorp_inventory:subItem(_source, container.name, 1, nil)
        if config.debug then print("[DEBUG] Removed container item:", container.name) end
        TriggerClientEvent("vorp:TipRight", _source, "Unpacked: " .. container.label, 3000)
    else
        TriggerClientEvent("vorp:TipRight", _source, "Unpacking failed: " .. container.label, 3000)
    end
end

for _, crate in ipairs(config.crates) do
    exports.vorp_inventory:registerUsableItem(crate.name, function(data)
        unpackContainer(data.source, crate)
    end)
end

for _, box in ipairs(config.boxes) do
    exports.vorp_inventory:registerUsableItem(box.name, function(data)
        unpackContainer(data.source, box)
    end)
end

RegisterServerEvent('bella-packingcrates:requestCraftableItems')
AddEventHandler('bella-packingcrates:requestCraftableItems', function()
    -- fallback if ever used without type
    checkCraftableItems(source, "crate")
end)
