local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

lak = {}
Tunnel.bindInterface("Lak_vip",lak)
Proxy.addInterface("Lak_vip",lak)

vCLIENT = Tunnel.getInterface("Lak_vip")

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

local Lk_Shop_Is_Coming_dale_2025_brabo_nao_tira_a_autenticacao_beleza_obrigado_pega_a_key_no_discord = true

function lak.authentic()
    if Config.key == nil or Config.key ~= "LkShop-Coming" then
        print("^0^1Script nao autenticado | LK SHOP| https://discord.gg/x5SHTwhZds^0")
        Lk_Shop_Is_Coming_dale_2025_brabo_nao_tira_a_autenticacao_beleza_obrigado_pega_a_key_no_discord = false
    else
        print("^2Script autenticado com sucesso!")
        print("^2Script gratuito feito pela LK SHOP | https://discord.gg/x5SHTwhZds^0")
        Lk_Shop_Is_Coming_dale_2025_brabo_nao_tira_a_autenticacao_beleza_obrigado_pega_a_key_no_discord = true
    end
end

function lak.dados(id, money, vehicle, group)
	local nuser_id2 = vRP.getUserId(source)
	local nuser_id = vRP.getUserSource(parseInt(id))
    if lak.authentic() then
	    if vRP.hasPermission(nuser_id2,Config.Permissao) then
		    if id and money and vehicle and group then
                vRP.giveMoney(parseInt(id),parseInt(money))
                if vehicle and vehicle ~= "nil" and vehicle ~= "" then
                    vRP.execute(Config.TabelaVeiculo, { user_id = parseInt(id), vehicle = vehicle })
                end
                vRP.addUserGroup(parseInt(id),group)

                    if Config.usarWebhook then
                        SendWebhookMessage(Config.Webhook,"```ini\n[PAINEL VIP]\n[ID DE QUEM DEU AS COISAS]: "..nuser_id2.. "\n[ID DE QUEM RECEBEU AS COISAS] "..id.."\n[DINHEIRO]: "..money.."\n[VEICULO]: "..vehicle.."\n[GRUPO]: "..group  ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \n[© LK SHOP] \r```")
                    end
            end
		end
	end
end

function lak.permi()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		return vRP.hasPermission(user_id,Config.Permissao)
	end
end

function lak.verificar()
    if Lk_Shop_Is_Coming_dale_2025_brabo_nao_tira_a_autenticacao_beleza_obrigado_pega_a_key_no_discord then
        return true
    end
end

lak.authentic()

