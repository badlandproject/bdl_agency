local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vRPclient = Tunnel.getInterface("vRP", "bdl_agency")


-- [ Pizza Event ] --
RegisterNetEvent('bdl:signpizza')
AddEventHandler('bdl:signpizza',function()
	local src = source
	local user_id = vRP.getUserId(src)
	if user_id then
		if vRP.hasPermission(user_id,'lspd.permission') or vRP.hasPermission(user_id,'lsmd.permission') or vRP.hasPermission(user_id,'bennys.permission') then
			TriggerClientEvent("Notify",src,"negado","Você deve falar com a prefeitura para deixar seu emprego.",10000)
		else
			vRP.addUserGroup(user_id,'pizza')
			TriggerClientEvent("Notify",src,"sucesso","Sua carteira foi assinada, dirija-se a central.",5000)
			vRPclient._setGPS(source,290.53,-958.15)
		end
	end
end)

-- [ FedEx Event ] --
RegisterNetEvent('bdl:signfedex')
AddEventHandler('bdl:signfedex',function()
	local src = source
	local user_id = vRP.getUserId(src)
	if user_id then
		if vRP.hasPermission(user_id,'lspd.permission') or vRP.hasPermission(user_id,'lsmd.permission') or vRP.hasPermission(user_id,'bennys.permission') then
			TriggerClientEvent("Notify",src,"negado","Você deve falar com a prefeitura para deixar seu emprego.",10000)
		else
			vRP.addUserGroup(user_id,'carteiro')
			TriggerClientEvent("Notify",src,"sucesso","Sua carteira foi assinada, dirija-se a central.",5000)
		end
	end
end)

-- [ Bus Event ] --
RegisterNetEvent('bdl:signonibus')
AddEventHandler('bdl:signonibus',function()
	local src = source
	local user_id = vRP.getUserId(src)
	if user_id then
		if vRP.hasPermission(user_id,'lspd.permission') or vRP.hasPermission(user_id,'lsmd.permission') or vRP.hasPermission(user_id,'bennys.permission') then
			TriggerClientEvent("Notify",src,"negado","Você deve falar com a prefeitura para deixar seu emprego.",10000)
		else
			vRP.addUserGroup(user_id,'onibus')
			TriggerClientEvent("Notify",src,"sucesso","Sua carteira foi assinada, dirija-se a central.",5000)
		end
	end
end)

-- [ Uber Event ] --
RegisterNetEvent('bdl:signuber')
AddEventHandler('bdl:signuber',function()
	local src = source
	local user_id = vRP.getUserId(src)
	if user_id then
		if vRP.hasPermission(user_id,'lspd.permission') or vRP.hasPermission(user_id,'lsmd.permission') or vRP.hasPermission(user_id,'bennys.permission') then
			TriggerClientEvent("Notify",src,"negado","Você deve falar com a prefeitura para deixar seu emprego.",10000)
		else
			vRP.addUserGroup(user_id,'uber')
			TriggerClientEvent("Notify",src,"sucesso","Sua carteira foi assinada, dirija-se a central.",5000)
		end
	end
end)

