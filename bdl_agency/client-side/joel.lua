
-- [ NUI CFG ] --
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		StartScreenEffect("MenuMGSelectionIn", 0, true)
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		StopScreenEffect("MenuMGSelectionIn")
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end

-- [ NUI CallBack ] --
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "assinar-pizza" then
		TriggerServerEvent("bdl:signpizza")

	elseif data == "assinar-carteiro" then
		TriggerServerEvent("bdl:signfedex")

	elseif data == "assinar-onibus" then
		TriggerServerEvent("bdl:signonibus")

	elseif data == "assinar-uber" then
		TriggerServerEvent("bdl:signuber")
	
	elseif data == "fechar" then
		ToggleActionMenu()
	
	end
end)


-- [ Array ] --
local coords = {
	{ ['x'] = -268.24, ['y'] = -957.31, ['z'] = 31.23 },
}


-- [ Main thread ] --
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local sleep = 1000

		for k,v in pairs(coords) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local coords = coords[k]

			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords.x, coords.y, coords.z, true ) <= 2 then
				sleep = 5
				DrawText3D(coords.x, coords.y, coords.z, "[~g~E~w~] Para ~g~ABRIR~w~ o menu da agência.")
			end
			
			if distance <= 15 then
				sleep = 5
				DrawMarker(30, coords.x, coords.y, coords.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,0,140,255,90,0,0,0,1)
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) then
						ToggleActionMenu()
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)


-- [ 3D Text function ] --
function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.40, 0.40)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end