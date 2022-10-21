
RegisterNetEvent('snr:sendMessageAdmin')
AddEventHandler('snr:sendMessageAdmin', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "STAFF | "..name, {255, 0, 125}, string.sub(message,0))
 	elseif pid ~= myId then
    TriggerServerEvent("snr:checkadmin", name, message)
  end
end)


RegisterNetEvent('snr:sendMessageToAllAdmins')
AddEventHandler('snr:sendMessageToAllAdmins', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "STAFF | "..name, {255, 0, 125}, string.sub(message,0))
  end
end)

RegisterNetEvent('snr:sendMessageToAllThors')
AddEventHandler('snr:sendMessageToAllThors', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "ADMİN | "..name, {255, 0, 125}, string.sub(message,0))
  end
end)


RegisterNetEvent('snr:sendMessageThor')
AddEventHandler('snr:sendMessageThor', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "ADMİN | "..name, {255, 0, 125}, string.sub(message,0))
 	elseif pid ~= myId then
    TriggerServerEvent("snr:checkthor", name, message)
  end
end)
