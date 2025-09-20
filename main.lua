local DuiObject = MachoCreateDui("https://123zugeil.github.io/index.html")
local ShowMenu = false  -- Zeigt an, ob das Menü angezeigt wird

-- Funktion zum Senden einer Nachricht an die DUI
function moveToNextOption()
    local message = json.encode({
        type = 'moveDown'  -- Benutzerdefinierter Nachrichtentyp
    })
    MachoSendDuiMessage(DuiObject, message)  -- Verwendet DuiObject statt duiObject
end

-- Überprüfen, ob der Pfeil nach unten gedrückt wurde, um das Menü zu zeigen
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Wenn die Taste für das Öffnen des Menüs gedrückt wird
        if IsControlJustPressed(0, 74) then  -- Pfeil nach unten (Taste 74)
            ShowMenu = true
            MachoShowDui(DuiObject)
        end

        -- Wenn das Menü angezeigt wird und die Pfeil-nach-unten-Taste gehalten wird
        if ShowMenu and IsControlPressed(0, 173) then  -- Pfeil nach unten (Taste 173)
            moveToNextOption()  -- Nachricht senden, um nach unten zu scrollen
            Citizen.Wait(200)  -- Warten, um eine kontinuierliche Bewegung zu ermöglichen (alle 100ms)
        end

        -- Wenn die Taste zum Schließen des Menüs gedrückt wird
        if IsControlJustPressed(0, 305) then  -- ESC-Taste oder eine andere Taste zum Schließen
            MachoHideDui(DuiObject)
            MachoDestroyDui(DuiObject)  -- Zerstört das DUI
            ShowMenu = false  -- Menü ausblenden
        end
    end
end)
