--========================================================--
-- Wayfinder
-- File: UI/Windows/Window.lua
-- Purpose:
-- Base window used by all Wayfinder windows.
--========================================================--

WF.UI.Window = {}
WF.UI.Window.__index = WF.UI.Window

setmetatable(WF.UI.Window, {
    __index = WF.UI.BaseWidget
})

----------------------------------------------------------
-- Constructor
----------------------------------------------------------

function WF.UI:CreateWindow(name)

    local self = WF.UI:CreateBaseWidget(UIParent)

    setmetatable(self, WF.UI.Window)

    ------------------------------------------------------
    -- Root Frame
    ------------------------------------------------------

    self.Frame = CreateFrame(
        "Frame",
        name,
        UIParent,
        "BasicFrameTemplateWithInset"
    )

    self.Frame:SetClampedToScreen(true)
    self.Frame:SetMovable(true)
    self.Frame:EnableMouse(true)

    self.Frame:RegisterForDrag("LeftButton")

    self.Frame:SetScript("OnDragStart", function(frame)

        frame:StartMoving()

    end)

    self.Frame:SetScript("OnDragStop", function(frame)

        frame:StopMovingOrSizing()

    end)

    table.insert(UISpecialFrames, name)

    ------------------------------------------------------
    -- Internal Widget Registry
    ------------------------------------------------------

    self.Widgets = {}

    ------------------------------------------------------
    -- Header
    ------------------------------------------------------

    self.HeaderFrame = CreateFrame(
        "Frame",
        nil,
        self.Frame
    )

    self.HeaderFrame:SetPoint("TOPLEFT", 8, -28)
    self.HeaderFrame:SetPoint("TOPRIGHT", -8, -28)
    self.HeaderFrame:SetHeight(30)

    ------------------------------------------------------
    -- Content
    ------------------------------------------------------

    self.ContentFrame = CreateFrame(
        "Frame",
        nil,
        self.Frame
    )

    self.ContentFrame:SetPoint(
        "TOPLEFT",
        self.HeaderFrame,
        "BOTTOMLEFT",
        0,
        -8
    )

    self.ContentFrame:SetPoint(
        "BOTTOMRIGHT",
        self.Frame,
        "BOTTOMRIGHT",
        -8,
        40
    )

    ------------------------------------------------------
    -- Footer
    ------------------------------------------------------

    self.FooterFrame = CreateFrame(
        "Frame",
        nil,
        self.Frame
    )

    self.FooterFrame:SetPoint(
        "BOTTOMLEFT",
        self.Frame,
        "BOTTOMLEFT",
        8,
        8
    )

    self.FooterFrame:SetPoint(
        "BOTTOMRIGHT",
        self.Frame,
        "BOTTOMRIGHT",
        -8,
        8
    )

    self.FooterFrame:SetHeight(28)

    ------------------------------------------------------

    return self

end

----------------------------------------------------------
-- Title
----------------------------------------------------------

function WF.UI.Window:SetTitle(text)

    if not self.Title then

        self.Title = self.Frame:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightLarge"
        )

        self.Title:SetPoint(
            "TOP",
            self.Frame,
            "TOP",
            0,
            -8
        )

    end

    self.Title:SetText(text)

end

----------------------------------------------------------
-- Containers
----------------------------------------------------------

function WF.UI.Window:GetHeader()

    return self.HeaderFrame

end

function WF.UI.Window:GetContent()

    return self.ContentFrame

end

function WF.UI.Window:GetFooter()

    return self.FooterFrame

end

----------------------------------------------------------
-- Widget Registry
----------------------------------------------------------

function WF.UI.Window:AddWidget(widget)

    table.insert(self.Widgets, widget)

end

function WF.UI.Window:GetWidgets()

    return self.Widgets

end

----------------------------------------------------------
-- Window
----------------------------------------------------------

function WF.UI.Window:SetCentered()

    self.Frame:ClearAllPoints()
    self.Frame:SetPoint("CENTER")

end

function WF.UI.Window:Toggle()

    if self.Frame:IsShown() then

        self.Frame:Hide()

    else

        self.Frame:Show()

    end

end

----------------------------------------------------------
-- Lifecycle
----------------------------------------------------------

function WF.UI.Window:Refresh()

    for _, widget in ipairs(self.Widgets) do

        if widget.Refresh then

            widget:Refresh()

        end

    end

end

function WF.UI.Window:Destroy()

    for _, widget in ipairs(self.Widgets) do

        if widget.Hide then

            widget:Hide()

        end

    end

    wipe(self.Widgets)

    self.Frame:Hide()

end