--========================================================--
-- Wayfinder
-- File: UI/Windows/AdventureWindow.lua
-- Purpose:
-- Creates the Adventure window.
--========================================================--

function WF.UI:CreateAdventureWindow()

    --------------------------------------------------------
    -- Main Frame
    --------------------------------------------------------

    local frame = CreateFrame("Frame", "WayfinderAdventureWindow", UIParent, "BasicFrameTemplateWithInset")

    frame:SetSize(355, 455)
    frame:SetPoint("CENTER")

    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")

    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

    frame:SetClampedToScreen(true)
    frame:SetToplevel(true)

    frame:Hide()

    --------------------------------------------------------
    -- ESC closes frame
    --------------------------------------------------------

    table.insert(UISpecialFrames, "WayfinderAdventureWindow")

    --------------------------------------------------------
    -- Title
    --------------------------------------------------------

    frame.Title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    frame.Title:SetPoint("TOP", 0, -8)
    frame.Title:SetText("Wayfinder")

    --------------------------------------------------------
    -- Logo Placeholder
    --------------------------------------------------------

    frame.Logo = frame:CreateTexture(nil, "ARTWORK")
    frame.Logo:SetSize(36, 36)
    frame.Logo:SetPoint("TOP", 0, -32)

    -- Placeholder icon until our own logo exists.
    frame.Logo:SetTexture("Interface\\Icons\\INV_Misc_Map02")

    --------------------------------------------------------
    -- Adventure Tab
    --------------------------------------------------------

    frame.Tab = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    frame.Tab:SetPoint("TOPLEFT", 16, -72)
    frame.Tab:SetText("Adventure")

    --------------------------------------------------------
    -- Divider
    --------------------------------------------------------

    frame.Divider = frame:CreateTexture(nil, "BACKGROUND")
    frame.Divider:SetColorTexture(0.35, 0.35, 0.35, 1)
    frame.Divider:SetHeight(1)
    frame.Divider:SetPoint("TOPLEFT", 12, -92)
    frame.Divider:SetPoint("TOPRIGHT", -12, -92)

    --------------------------------------------------------
    -- Left Panel
    --------------------------------------------------------

    frame.LeftPanel = CreateFrame("Frame", nil, frame, "InsetFrameTemplate")

    frame.LeftPanel:SetSize(125, 315)
    frame.LeftPanel:SetPoint("TOPLEFT", 12, -102)

    --------------------------------------------------------
    -- Right Panel
    --------------------------------------------------------

    frame.RightPanel = CreateFrame("Frame", nil, frame, "InsetFrameTemplate")

    frame.RightPanel:SetPoint("TOPLEFT", frame.LeftPanel, "TOPRIGHT", 8, 0)
    frame.RightPanel:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -12, 12)

    --------------------------------------------------------
    -- Left Title
    --------------------------------------------------------

    frame.LeftTitle = frame.LeftPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")

    frame.LeftTitle:SetPoint("TOPLEFT", 10, -10)
    frame.LeftTitle:SetText("Categories")

    --------------------------------------------------------
    -- Placeholder Tree
    --------------------------------------------------------

    local tree = frame.LeftPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")

    tree:SetPoint("TOPLEFT", frame.LeftTitle, "BOTTOMLEFT", 0, -10)

    tree:SetJustifyH("LEFT")

    tree:SetText(
        "▼ Dungeons\n\n" ..
        "    Ragefire Chasm\n" ..
        "    Wailing Caverns\n" ..
        "    Shadowfang Keep\n\n" ..
        "▶ Class\n\n" ..
        "▶ Professions\n\n" ..
        "▶ Raids"
    )

    --------------------------------------------------------
    -- Detail Title
    --------------------------------------------------------

    frame.DetailTitle = frame.RightPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")

    frame.DetailTitle:SetPoint("TOPLEFT", 10, -10)
    frame.DetailTitle:SetText("Ragefire Chasm")

    --------------------------------------------------------
    -- Detail Text
    --------------------------------------------------------

    WF.UI:CreateSection(

    frame.RightPanel,

    "Recommended Level",

    "13 - 18",

    -40

)

WF.UI:CreateSection(

    frame.RightPanel,

    "Status",

    "Available",

    -115

)

WF.UI:CreateSection(

    frame.RightPanel,

    "Requirements",

    "None",

    -190

)

WF.UI:CreateSection(

    frame.RightPanel,

    "Dungeon Quests",

    "Placeholder",

    -265

)

WF.UI:CreateSection(

    frame.RightPanel,

    "Rewards",

    "Placeholder",

    -340

)

    --------------------------------------------------------

    self.MainFrame = frame

end

function WF.UI:ToggleMainFrame()

    if self.MainFrame:IsShown() then
        self.MainFrame:Hide()
    else
        self.MainFrame:Show()
    end

end