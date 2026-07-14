--========================================================--
-- Wayfinder
-- File: UI/Widgets/Section.lua
-- Purpose:
-- Reusable information section widget.
--========================================================--

WF.UI.Section = {}
WF.UI.Section.__index = WF.UI.Section

setmetatable(WF.UI.Section, {
    __index = WF.UI.BaseWidget
})

----------------------------------------------------------
-- Constructor
----------------------------------------------------------

function WF.UI:CreateSection(parent)

    local self = WF.UI:CreateBaseWidget(parent)

    setmetatable(self, WF.UI.Section)

    ------------------------------------------------------
    -- Default Size
    ------------------------------------------------------

    self:SetSize(220, 50)

    ------------------------------------------------------
    -- Title
    ------------------------------------------------------

    self.Title = self.Frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")

    self.Title:SetPoint("TOPLEFT", 0, 0)
    self.Title:SetJustifyH("LEFT")

    ------------------------------------------------------
    -- Value
    ------------------------------------------------------

    self.Value = self.Frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")

    self.Value:SetPoint("TOPLEFT", self.Title, "BOTTOMLEFT", 0, -4)
    self.Value:SetJustifyH("LEFT")
    self.Value:SetJustifyV("TOP")
    self.Value:SetWidth(220)

    ------------------------------------------------------
    -- Divider
    ------------------------------------------------------

    self.Divider = WF.UI:CreateDivider(self.Frame)

    return self

end

----------------------------------------------------------
-- Methods
----------------------------------------------------------

function WF.UI.Section:SetWidth(width)

    WF.UI.BaseWidget.SetWidth(self, width)

    self.Value:SetWidth(width)

    self.Divider:SetWidth(width)

end

function WF.UI.Section:SetTitle(text)

    self.Title:SetText(text)

end

function WF.UI.Section:SetValue(text)

    self.Value:SetText(text)

    local height =
        self.Title:GetStringHeight()
        + self.Value:GetStringHeight()
        + 18

    self:SetHeight(height)

    self.Divider:SetPoint(
        "TOPLEFT",
        self.Value,
        "BOTTOMLEFT",
        0,
        -8
    )

end

function WF.UI.Section:GetContentHeight()

    return self:GetHeight()

end