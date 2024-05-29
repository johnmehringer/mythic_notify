RegisterNetEvent('mythic_notify:client:SendAlert')
AddEventHandler('mythic_notify:client:SendAlert', function(data)
	DoCustomHudText(data.type, data.text, data.length, data.style)
end)

RegisterNetEvent('mythic_notify:client:PersistentHudText')
AddEventHandler('mythic_notify:client:PersistentHudText', function(data)
	PersistentHudText(data.action, data.id, data.type, data.text, data.style)
end)

function showNotification(message, color, flash, saveToBrief)
  color = color or 30 -- pink
  --   6 red
  --  40 light blue
  -- 130 orange
  -- 140 black
  -- 210 bright green
  flash = flash or false
  saveToBrief = saveToBrief or false
  BeginTextCommandThefeedPost('STRING')
  AddTextComponentSubstringPlayerName(message)
  ThefeedNextPostBackgroundColor(color)
  EndTextCommandThefeedPostTicker(flash, saveToBrief)
end

function showAdvancedNotification(message, sender, subject, textureDict, iconType, color, saveToBrief)
  iconType = iconType or 8 -- rp icon

  BeginTextCommandThefeedPost('STRING')
  AddTextComponentSubstringPlayerName(message)
  ThefeedNextPostBackgroundColor(color)
  EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
  EndTextCommandThefeedPostTicker(flash, saveToBrief)
end

function showAlert(message, beep, duration)
  beep = beep or false
  duration = duration or 1000

  AddTextEntry('ALERT', message)
  BeginTextCommandDisplayHelp('ALERT')
  EndTextCommandDisplayHelp(0, false, beep, duration)
end

function DoShortHudText(type, text, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = 1000,
		style = style
	})
  --showAlert(text)
end

function DoHudText(type, text, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = 2500,
		style = style
	})
end

function DoLongHudText(type, text, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = 5000,
		style = style
	})
end

function DoCustomHudText(type, text, length, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = length,
		style = style
	})
end

function PersistentHudText(action, id, type, text, style)
	if action:upper() == 'START' then
		SendNUIMessage({
			persist = action,
			id = id,
			type = type,
			text = text,
			style = style
		})
	elseif action:upper() == 'END' then
		SendNUIMessage({
			persist = action,
			id = id
		})
	end
end
