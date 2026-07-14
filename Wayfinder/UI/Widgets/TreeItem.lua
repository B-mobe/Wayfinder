--========================================================--
-- Wayfinder
-- File: UI/Widgets/TreeItem.lua
-- Purpose:
-- Reusable tree item widget.
--========================================================--

WF.UI.TreeItem = {}
WF.UI.TreeItem.__index = WF.UI.TreeItem

setmetatable(WF.UI.TreeItem, {
    __index = WF.UI.BaseWidget
})

----------------------------------------------------------
-- Constructor
----------------------------------------------------------

function WF.UI:CreateTreeItem(parent)

    local self = WF.UI:CreateBaseWidget(parent)

    setmetatable(self, WF.UI.TreeItem)

    ------------------------------------------------------
    -- Default Size
    ------------------------------------------------------

    self:SetSize(180, 20)

    ------------------------------------------------------
    -- Click Area
    ------------------------------------------------------

    self.Button = CreateFrame("Button", nil, self.Frame)

    self.Button:SetAllPoints()

    ------------------------------------------------------
    -- Expand Icon
    ------------------------------------------------------

    self.Icon = self.Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")

    self.Icon:SetPoint("LEFT", 0, 0)
    self.Icon:SetText("▶")

    ------------------------------------------------------
    -- Text
    ------------------------------------------------------

    self.Text = self.Frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")

    self.Text:SetPoint("LEFT", self.Icon, "RIGHT", 6, 0)
    self.Text:SetJustifyH("LEFT")

    ------------------------------------------------------
    -- Highlight
    ------------------------------------------------------

    self.Highlight = self.Button:CreateTexture(nil, "HIGHLIGHT")

    self.Highlight:SetAllPoints()

    self.Highlight:SetColorTexture(
        1,
        1,
        1,
        0.08
    )

    ------------------------------------------------------

    self.Expanded = false

    return self

end

----------------------------------------------------------
-- Methods
----------------------------------------------------------

function WF.UI.TreeItem:SetText(text)

    self.Text:SetText(text)

end

function WF.UI.TreeItem:SetExpanded(expanded)

    self.Expanded = expanded

    if expanded then
        self.Icon:SetText("▼")
    else
        self.Icon:SetText("▶")
    end

end

function WF.UI.TreeItem:SetOnClick(callback)

    self.Button:SetScript("OnClick", callback)

end