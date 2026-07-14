--========================================================--
-- Wayfinder
-- File: UI/Widgets/Divider.lua
-- Purpose:
-- Reusable divider widget.
--========================================================--

WF.UI.Divider = {}
WF.UI.Divider.__index = WF.UI.Divider

setmetatable(WF.UI.Divider, {
    __index = WF.UI.BaseWidget
})

----------------------------------------------------------
-- Constructor
----------------------------------------------------------

function WF.UI:CreateDivider(parent)

    local self = WF.UI:CreateBaseWidget(parent)

    setmetatable(self, WF.UI.Divider)

    ------------------------------------------------------
    -- Default Size
    ------------------------------------------------------

    self:SetSize(200, 1)

    ------------------------------------------------------
    -- Texture
    ------------------------------------------------------

    self.Texture = self.Frame:CreateTexture(nil, "BACKGROUND")

    self.Texture:SetAllPoints()

    self.Texture:SetColorTexture(
        0.35,
        0.35,
        0.35,
        1
    )

    return self

end

----------------------------------------------------------
-- Methods
----------------------------------------------------------

function WF.UI.Divider:SetColor(r, g, b, a)

    self.Texture:SetColorTexture(
        r,
        g,
        b,
        a or 1
    )

end