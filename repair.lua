-- repair.lua (standalone /repair script)

RegisterCommand("repair", function(source, args, rawCommand)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    -- check if player is inside a vehicle
    if vehicle == 0 then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            args = {"Repair", "You must be in a vehicle to repair it!"}
        })
        return
    end

    -- repair vehicle
    SetVehicleFixed(vehicle)
    SetVehicleDirtLevel(vehicle, 0.0)
    SetVehicleEngineHealth(vehicle, 1000.0)
    SetVehiclePetrolTankHealth(vehicle, 1000.0)
    SetVehicleBodyHealth(vehicle, 1000.0)

    -- optional: reset broken doors/windows/tires
    for i = 0, 5 do
        SetVehicleDoorFixed(vehicle, i)
    end
    for i = 0, 7 do
        SetVehicleTyreFixed(vehicle, i)
    end
    for i = 0, 13 do
        FixVehicleWindow(vehicle, i)
    end

    -- feedback
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        args = {"Repair", "Your vehicle has been fully repaired!"}
    })
end, false)
