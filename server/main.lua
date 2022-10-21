local admins = { --STAFFLAR
	'steam:1100001345a13d9', --Soner
	'steam:1100001345a13d9', --Soner
}

local thorlar = { -- ADMİNLER
	'steam:1100001345a13d9', --Soner
	'steam:1100001345a13d9', --Soner
}

function isAdmin(player)
    local allowed = false
    for i,id in ipairs(admins) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end

function isTHOR(player)
    local allowed = false
    for i,id in ipairs(thorlar) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end


AddEventHandler('chatMessage', function(source, color, msg)
	cm = stringsplit(msg, " ")
	if cm[1] == "/s" then
		CancelEvent()
		if tablelength(cm) > 1 then
			local names1 = GetPlayerName(source)
			local msgVar = {}
			local textmsg = ""
			for i=1, #cm do
				if i ~= 1 then
					textmsg = (textmsg .. " " .. tostring(cm[i]))
				end
			end
	        if isAdmin(source) then
		        TriggerClientEvent("snr:sendMessageAdmin", -1, source, names1, textmsg)
			else
			    print("STAFF DEĞİLSİN")
			end
		end
	end	
end)


AddEventHandler('chatMessage', function(source, color, msg)
	cm = stringsplit(msg, " ")
	if cm[1] == "/a" then
		CancelEvent()
		if tablelength(cm) > 1 then
			local names1 = GetPlayerName(source)
			local msgVar = {}
			local textmsg = ""
			for i=1, #cm do
				if i ~= 1 then
					textmsg = (textmsg .. " " .. tostring(cm[i]))
				end
			end
	        if isTHOR(source) then
		        TriggerClientEvent("snr:sendMessageThor", -1, source, names1, textmsg)
			else
			    print("ADMİN DEĞİLSİN")
			end
		end
	end	
end)


RegisterServerEvent('snr:checkadmin')
AddEventHandler('snr:checkadmin', function(n1, tmsg)
	local id = source
	if isAdmin(id) then
		TriggerClientEvent("snr:sendMessageToAllAdmins", -1, source, n1, tmsg)
	else
	end
end)

RegisterServerEvent('snr:checkthor')
AddEventHandler('snr:checkthor', function(n1, tmsg)
	local id = source
	if isTHOR(id) then
		TriggerClientEvent("snr:sendMessageToAllThors", -1, source, n1, tmsg)
	else
	end
end)

RegisterCommand('clear', function(source, args, rawCommand)
    TriggerClientEvent('chat:client:ClearChat', source)
end, false)

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end



function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

