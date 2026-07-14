--========================================================--
-- Wayfinder
-- File: UI/Widgets/Header.lua
-- Purpose:
-- Reusable header widget.
--========================================================--

WF.UI.Header = {}
WF.UI.Header.__index = WF.UI.Header

setmetatable(WF.UI.Header, {
    __index = WF.UI.BaseWidget
})

----------------------------------------------------------
-- Constructor
----------------------------------------------------------

function WF.UI:CreateHeader(parent)

    local self = WF.UI:CreateBaseWidget(parent)

    setmetatable(self, WF.UI.Header)

    ------------------------------------------------------
    -- Default Size
    ------------------------------------------------------

    self:SetSize(200, 28)

    ------------------------------------------------------
    -- Text
    ------------------------------------------------------

    self.Text = self.Frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")

    self.Text:SetPoint("LEFT", 0, 0)
    self.Text:SetJustifyH("LEFT")

    ------------------------------------------------------
    -- Divider
    ------------------------------------------------------

    self.Divider = WF.UI:CreateDivider(self.Frame)

    self.Divider:SetPoint("BOTTOMLEFT", 0, 0)
    self.Divider:SetWidth(200)

    return self

end

----------------------------------------------------------
-- Methods
----------------------------------------------------------

function WF.UI.Header:SetText(text)

    self.Text:SetText(text)

end

function WF.UI.Header:SetWidth(width)

    WF.UI.BaseWidget.SetWidth(self, width)

    self.Divider:SetWidth(width)

end