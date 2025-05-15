local progressbar = exports.vorp_progressbar:initiate()
local FeatherMenu = exports['feather-menu'].initiate()

if config.debug then
    print("Craft time: " .. tostring(config.craftTime))
end

local craftTime = config.craftTime
local packagingMenu = nil

RegisterNetEvent('bella-packingcrates:crateItems', function(craftableItems, typeUsed)
    if packagingMenu then
        packagingMenu:Close()
    end

    packagingMenu = FeatherMenu:RegisterMenu('packagingMenu', {
        top = '35%',
        left = '25%',
        width = '600px',
        backgroundColor = '#ffffff', -- White background
        border = '2px solid #FFD700', -- Gold border
        borderRadius = '10px',
        ['720width'] = '500px',
        ['1080width'] = '600px',
        draggable = true,
    })

    local packagingPage = packagingMenu:RegisterPage('packagingOptions')

    -- Gold Header with Border
    packagingPage:RegisterElement('header', {
        value = '📦 Packaging Options',
        slot = "header",
        style = {
            color = '#FFD700',
            fontSize = '22px',
            fontWeight = 'bold',
            textAlign = 'center',
            borderBottom = '2px solid #FFD700',
            paddingBottom = '5px',
            marginBottom = '10px'
        }
    })

    for _, item in ipairs(craftableItems) do
        local isBox = false
        for _, box in ipairs(config.boxes) do
            if item.name == box.name then isBox = true break end
        end
        if (typeUsed == "crate" and not isBox) or (typeUsed == "box" and isBox) then
            packagingPage:RegisterElement('button', {
                label = "🎁 Pack: " .. item.label,
                slot = "content",
                style = {
                    backgroundColor = "#2e8b57",
                    color = "#000000", -- black text for readability
                    padding = "8px",
                    margin = "6px",
                    borderRadius = "6px",
                    fontSize = "16px",
                    fontWeight = "500"
                }
            }, function()
                packagingMenu:Close()
                TriggerEvent('bella-crates:StartPackingAnimation', item.label)
                Wait(config.craftTime)
                TriggerServerEvent('bella-packingcrates:createCrates', item.name)
            end)
        end
    end

    -- Close Button
    packagingPage:RegisterElement('button', {
        label = "❌ Close Menu",
        slot = "footer",
        style = {
            backgroundColor = "#8B0000",
            color = "#000000",
            padding = "8px",
            margin = "10px",
            borderRadius = "6px",
            fontWeight = "bold"
        }
    }, function()
        packagingMenu:Close()
    end)

    packagingMenu:Open({startupPage = packagingPage})
end)

RegisterNetEvent('bella-crates:StartCraftingAnimation', function(crateLabel)
    local playerPed = PlayerPedId()
    progressbar.start('Unpacking ' .. crateLabel .. '...', config.craftTime, function() end, 'innercircle')
    local animDict = "amb_work@world_human_hammer_kneel_stakes@male@male_a@base"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(100) end
    TaskPlayAnim(playerPed, animDict, "base", 8.0, -8.0, -1, 49, 0, false, false, false)
    Wait(config.craftTime)
    ClearPedTasks(playerPed)
end)

RegisterNetEvent('bella-crates:StartPackingAnimation', function(crateLabel)
    local playerPed = PlayerPedId()
    progressbar.start('Packing ' .. crateLabel .. '...', config.craftTime, function() end, 'innercircle')
    local animDict = "amb_work@world_human_hammer_kneel_stakes@male@male_a@base"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(100) end
    TaskPlayAnim(playerPed, animDict, "base", 8.0, -8.0, -1, 49, 0, false, false, false)
    Wait(config.craftTime)
    ClearPedTasks(playerPed)
end)

RegisterNetEvent('bella-crates:OpenPackagingMenu', function()
    TriggerServerEvent('bella-packingcrates:requestCraftableItems')
end)
