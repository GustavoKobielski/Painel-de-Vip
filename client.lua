local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","Lak_vip")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("Lak_vip",src)
vSERVER = Tunnel.getInterface("Lak_vip")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES GLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
local Nui = false

RegisterCommand("vip", function()
    if vSERVER.verificar() then
        if vSERVER.permi() then
            Nui = true
            SetNuiFocus(true, true)
            SendNUIMessage({action = true})
        end
    end
end)

RegisterNUICallback("closeNui", function(data)
    Nui = false
    SetNuiFocus(false, false)
    SendNUIMessage({action = false})
end)

RegisterNUICallback("closeVipNui", function(data)
    SetNuiFocus(false, false)
    Nui = false
end) 

RegisterNUICallback("sendInformations", function(data)
    vSERVER.dados(data.id, data.money, data.vehicle, data.group)
    SendNUIMessage({action = false})
    SetNuiFocus(false, false)
    
    Nui = false
end)



    
    
