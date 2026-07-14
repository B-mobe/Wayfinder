--========================================================--
-- Wayfinder
-- File: UI/Widgets/BaseWidget.lua
-- Purpose:
-- Base widget used by all UI components.
--========================================================--

WF.UI.BaseWidget = {}
WF.UI.BaseWidget.__index = WF.UI.BaseWidget

----------------------------------------------------------
-- Constructor
----------------------------------------------------------

function WF.UI:CreateBaseWidget(parent)

    local self = setmetatable({}, WF.UI.BaseWidget)

    self.Frame = CreateFrame("Frame", nil, parent)

    return self

end

----------------------------------------------------------
-- Position
----------------------------------------------------------

function WF.UI.BaseWidget:SetPoint(...)

    self.Frame:SetPoint(...)

end

function WF.UI.BaseWidget:ClearAllPoints()

    self.Frame:ClearAllPoints()

end

----------------------------------------------------------
-- Size
----------------------------------------------------------

function WF.UI.BaseWidget:SetSize(width, height)

    self.Frame:SetSize(width, height)

end

function WF.UI.BaseWidget:SetWidth(width)

    self.Frame:SetWidth(width)

end

function WF.UI.BaseWidget:SetHeight(height)

    self.Frame:SetHeight(height)

end

function WF.UI.BaseWidget:GetWidth()

    return self.Frame:GetWidth()

end

function WF.UI.BaseWidget:GetHeight()

    return self.Frame:GetHeight()

end

----------------------------------------------------------
-- Visibility
----------------------------------------------------------

function WF.UI.BaseWidget:Show()

    self.Frame:Show()

end

function WF.UI.BaseWidget:Hide()

    self.Frame:Hide()

end

function WF.UI.BaseWidget:IsShown()

    return self.Frame:IsShown()

end

----------------------------------------------------------
-- Enable / Disable
----------------------------------------------------------

function WF.UI.BaseWidget:Enable()

    self.Frame:Enable()

end

function WF.UI.BaseWidget:Disable()

    self.Frame:Disable()

end

----------------------------------------------------------
-- Alpha
----------------------------------------------------------

function WF.UI.BaseWidget:SetAlpha(alpha)

    self.Frame:SetAlpha(alpha)

end

----------------------------------------------------------
-- Scale
----------------------------------------------------------

function WF.UI.BaseWidget:SetScale(scale)

    self.Frame:SetScale(scale)

end

----------------------------------------------------------
-- Parent
----------------------------------------------------------

function WF.UI.BaseWidget:GetFrame()

    return self.Frame

end