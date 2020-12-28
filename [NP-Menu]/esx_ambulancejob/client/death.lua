ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)


local isDead = false
local ShouldPlayDeathAnimation = false

RegisterNetEvent('esx_ambulancejob:onPlayerDeath')

RegisterNetEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
    isDead = true
    ShouldPlayDeathAnimation = true
end)

RegisterNetEvent('esx_ambulancejob:stopAnim')
AddEventHandler('esx_ambulancejob:stopAnim', function()
    ShouldPlayDeathAnimation = false
end)
RegisterNetEvent('esx_ambulancejob:startAnim')
AddEventHandler('esx_ambulancejob:startAnim', function()
    ShouldPlayDeathAnimation = true
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local playerPed = PlayerPedId()
        if isDead or GetEntityHealth(playerPed) <= 0 then
            ShouldPlayDeathAnimation = true
            ClearPedTasksImmediately(playerPed)
            SetEntityInvincible(playerPed, true)
            Citizen.Wait(200)
            SetEntityHealth(playerPed, GetPedMaxHealth(playerPed))
            ClearPedTasksImmediately(playerPed)
            --local lib, anim = 'random@drunk_driver_1', 'drunk_fall_over'
            local lib, anim = 'move_fall', 'land_fall'
            ESX.Streaming.RequestAnimDict(lib, function()
                TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 1, 0, 0, 0, 0)
                Citizen.Wait(1000)
                while isDead do
                    if not IsEntityPlayingAnim(playerPed, 'dead', 'dead_a', 3) and ShouldPlayDeathAnimation then
                        ESX.Streaming.RequestAnimDict('dead', function()
                            TaskPlayAnim(playerPed, 'dead', 'dead_a', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
                        end)
                        Citizen.Wait(3000)
                    end
                    Citizen.Wait(0)
                end
            end)
        end
    end
end)

function Atdzivinat(playerPed)
    Coords = GetEntityCoords(playerPed)
    Heading = GetEntityHeading(playerPed)
    NetworkResurrectLocalPlayer(Coords.x, Coords.y, Coords.z, Heading, true, false)
    ShouldPlayDeathAnimation = false
    isDead = false
    ClearPedTasksImmediately(playerPed)
    SetEntityInvincible(playerPed, false)
    ClearPedBloodDamage(playerPed)
    SetEntityHealth(playerPed, GetPedMaxHealth(playerPed))
end
