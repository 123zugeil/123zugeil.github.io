local DuiObject = MachoCreateDui("https://123zugeil.github.io/index.html")
MachoShowDui(DuiObject)

function moveToNextOption()
    local message = json.encode({
        type = 'moveDown'  -- Benutzerdefinierter Nachrichtentyp
    })
    MachoSendDuiMessage(DuiObject, message)  -- Verwendet DuiObject statt duiObject
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 173) then  -- Pfeil nach unten
            moveToNextOption()  -- Nachricht senden
        end
    end
end)
