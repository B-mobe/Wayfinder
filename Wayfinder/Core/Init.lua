--========================================================--
-- Wayfinder
-- Core Initialization
--========================================================--

local addon = CreateFrame("Frame")

addon:RegisterEvent("ADDON_LOADED")

function WF:Initialize()

    WayfinderDB = WayfinderDB or {}

    self:Log("Version " .. self.Version .. " loaded.")

    self.UI:CreateAdventureWindow()

end

addon:SetScript("OnEvent", function(_, event, addonName)

    if addonName ~= "Wayfinder" then
        return
    end

    WF:Initialize()

end)