local editor = CreateFrame("EditBox", nil, UIParent)
editor:SetWidth(420)
editor:SetHeight(420)
editor:SetPoint("CENTER", 0, 0)
editor:SetMultiLine(true)
editor:SetTextInsets(15,15,15,15)
editor:SetFont(STANDARD_TEXT_FONT, 16)
editor:SetAutoFocus(false)
editor:Hide()

editor:SetScript("OnTextChanged", function()
  ShaguWidget_config[this.id] = this:GetText()
end)
editor:SetScript("OnEscapePressed", function()
  this:Hide()
end)

local function SetConfig(self)
  editor.id = self.id
  editor:SetText(ShaguWidget_config[self.id])
  editor:Show()
end

ShaguWidget:MakeMovable(editor)
ShaguWidget:CreateBackdrop(editor)

-- add to core
ShaguWidget.ShowEditor = SetConfig
