-- perfix for tool tip
function VDW.Prefix(addonName)
	local cache = VDW._prefixCache
	local p = cache[addonName]
	if p then return p end
	local title = C_AddOns.GetAddOnMetadata(addonName, "Title") or addonName
	local icon  = C_AddOns.GetAddOnMetadata(addonName, "IconAtlas")
	if icon and icon ~= "" then
		p = ("|A:%s:16:16:0:0|a%s"):format(icon, title)
	else
		p = title
	end
	cache[addonName] = p
	return p
end
-- perfix for chat
function VDW.PrefixChat(addonName)
	local t = GameTime_GetTime(false)
	local title = C_AddOns.GetAddOnMetadata(addonName, "Title") or addonName
	local icon  = C_AddOns.GetAddOnMetadata(addonName, "IconAtlas")
	local p = ("["..t.."] (|A:%s:16:16:0:0|a%s)"):format(icon, title)
	return p
end
-- perix for error
function VDW.PrefixError(addonName)
	local icon  = C_AddOns.GetAddOnMetadata(addonName, "IconAtlas")
	local p = ("|A:%s:16:16:0:0|a"):format(icon)
	return p
end
-- tooltip
local function VDW_CreateOptionsTooltip()
	if VDW_OptionsTooltip then return VDW_OptionsTooltip end
	local tt = CreateFrame("GameTooltip", "VDW_OptionsTooltip", UIParent, "GameTooltipTemplate")
	return tt
end
-- tool tip show
function VDW.Tooltip_Show(owner, titleText, bodyText, color, position)
	local tt = VDW_CreateOptionsTooltip()
	local width = 280
	local ScreenWidth, ScreenHeight = GetPhysicalScreenSize()
	local WidthHalf = ScreenWidth / 2
	local HeightHalf = ScreenHeight / 2
	local OwnerLeft = Round(owner:GetLeft())
	local OwnerBottom = Round(owner:GetBottom())
	tt:SetOwner(owner, "ANCHOR_NONE")
	tt:ClearAllPoints()
	if position == "Left" then
		if OwnerLeft >= WidthHalf then
			tt:SetPoint("TOPRIGHT", owner, "TOPLEFT", 0, 0)
		elseif OwnerLeft < WidthHalf then
			tt:SetPoint("TOPLEFT", owner, "TOPRIGHT", 0, 0)
		end
	else
		if OwnerBottom >= HeightHalf then
			tt:SetPoint("TOPLEFT", owner, "BOTTOMLEFT", 0, 0)
		elseif OwnerBottom < HeightHalf then
			tt:SetPoint("BOTTOMLEFT", owner, "TOPLEFT", 0, 0)
		end
	end
	GameTooltip_SetTitle(tt, titleText, color, true)
	GameTooltip_AddColoredLine(tt, bodyText, color, true, 4)
	for i = 1, tt:NumLines() do
		local left = _G[tt:GetName().."TextLeft"..i]
		if left then
			left:SetWidth(width)
		end
	end
	tt:SetWidth(width)
	tt:Show()
end
-- tool tip hide
function VDW.Tooltip_Hide()
	if VDW_OptionsTooltip then
		VDW_OptionsTooltip:Hide()
	end
end
-- colors
VDW.Colors = VDW.Colors or {}
VDW.ColorHex = VDW.ColorHex or {}
-- addons colors
VDW.ColorHex.FMC = { Main = "D79128FF", High = "F2CF72FF" }
VDW.ColorHex.MOV = { Main = "86A7BFFF", High = "BAD6EBFF" }
VDW.ColorHex.SSOA = { Main = "FFDF80FF", High = "AE8200FF" }
VDW.ColorHex.VCB = { Main = "F0E68CFF", High = "9ACD32FF" }
VDW.ColorHex.VDW = { Main = "CFFE9FFF", High = "9EEBFEFF" }
VDW.ColorHex.VDWS = { Main = "94D1BDFF", High = "3B9CCDFF" }
-- no alpha function
local function MakeNoAlpha(color)
	local r, g, b = color:GetRGB()
	return CreateColor(r, g, b, 0)
end
-- addons colors function
function VDW.GetAddonColors(addonName)
	-- cache
	if VDW.Colors[addonName] then
		return VDW.Colors[addonName]
	end
	local hex = VDW.ColorHex[addonName]
	if not hex then
		hex = { Main = "FFFFFFFF", High = "FFFFFFFF" }
	end
	local main = CreateColorFromRGBAHexString(hex.Main)
	local high = CreateColorFromRGBAHexString(hex.High)
	VDW.Colors[addonName] = {
		Main   = main,
		High   = high,
		NoMain = MakeNoAlpha(main),
		NoHigh = MakeNoAlpha(high),
	}
	return VDW.Colors[addonName]
end
-- addons background
VDW.Background = VDW.Background or {}
VDW.Background.FMC = "talents-heroclass-choicepopup-background"
VDW.Background.MOV = "shop-frame-carousel-large-bg"
VDW.Background.SSOA = "GarrMissionLocation-Maw-bg-02"
VDW.Background.VCB = "UI-Journeys-BG"
VDW.Background.VDWS = "Forge-Background"
-- cache player globals
local function CachePlayerInfo()
	-- class id
	local _, _, classID = C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))
	VDW.PlayerClassID = classID
	-- class color
	VDW.PlayerClassColor = C_ClassColor.GetClassColor(select(2, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))))
	-- faction info
	local raceID = C_PlayerInfo.GetRace(PlayerLocation:CreateFromUnit("player"))
	VDW.PlayerFactionInfo = C_CreatureInfo.GetFactionInfo(raceID)
	-- faction color
	if VDW.PlayerFactionInfo.groupTag == "Alliance" then
		VDW.PlayerFactionColor = PLAYER_FACTION_COLOR_ALLIANCE
	elseif VDW.PlayerFactionInfo.groupTag == "Horde" then
		VDW.PlayerFactionColor = PLAYER_FACTION_COLOR_HORDE
	end
end
-- events time
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		CachePlayerInfo()
	end
end
vdwZlave:SetScript("OnEvent", EventsTime)
-- functions for the options UI
-- create slash command and mini map button
function VDW.CreateSlashMinmap(addonName, optionsName, optionsTitle, optionsPanels, command1, command2, color1, color2)
	local function ShowMenu()
		if InCombatLockdown() then
			C_Sound.PlayVocalErrorSound(48)
			DEFAULT_CHAT_FRAME:AddMessage(color1:WrapTextInColorCode(VDW.PrefixChat(addonName).." "..VDWtranslate.Global.COMBAT_LOCKDOWN))
			UIErrorsFrame:AddExternalWarningMessage(VDW.PrefixError(addonName).." "..VDWtranslate.Global.COMBAT_LOCKDOWN)
		else
			local options = _G[optionsPanels]
			local _, loaded = C_AddOns.IsAddOnLoaded(optionsName)
			local loadable, reason = C_AddOns.IsAddOnLoadable(optionsName, nil, true)
			if loadable then
				if loaded then
					options = _G[optionsPanels]
					if options:IsShown() then
						options:Hide()
					else
						options:Show()
					end
				else
					C_AddOns.LoadAddOn(optionsName)
					options = _G[optionsPanels]
					options:Show()
				end
			else
				C_Sound.PlayVocalErrorSound(48)
				DEFAULT_CHAT_FRAME:AddMessage(color1:WrapTextInColorCode(VDW.PrefixChat(addonName).." "..string.format(VDWtranslate.Global.ADDON_IS_STATE, color2:WrapTextInColorCode(optionsTitle), reason)))
				UIErrorsFrame:AddExternalWarningMessage(VDW.PrefixError(addonName).." "..string.format(VDWtranslate.Global.ADDON_IS_STATE, color2:WrapTextInColorCode(optionsTitle), reason))
			end
		end
	end
	-- slash command
	RegisterNewSlashCommand(ShowMenu, command1, command2)
	-- mini map button functions
	AddonCompartmentFrame:RegisterAddon({
		text = color1:WrapTextInColorCode(C_AddOns.GetAddOnMetadata(addonName, "Title")),
		icon = C_AddOns.GetAddOnMetadata(addonName, "IconAtlas"),
		notCheckable = true,
		func = function(button, menuInputData, menu)
			local buttonName = menuInputData.buttonName
			if buttonName == "LeftButton" then
				ShowMenu()
			end
		end,
		funcOnEnter = function(button)
			VDW.Tooltip_Show(button, VDW.Prefix(addonName), VDWtranslate.Global.LEFT_CLICK..": "..VDWtranslate.Global.OPEN_SETTINGS_MAIN, color1, "Left")
		end,
		funcOnLeave = function(button)
			VDW.Tooltip_Hide()
		end,
	})
end
-- create panel
function VDW.CreateOptionsPanel(panel, atlas, color1, color2, desaturation, addon)
	-- background and logo
    panel.BGtexture:SetAtlas(atlas, false)
    panel.BGtexture:SetVertexColor(color2:GetRGB())
    panel.Logo:SetVertexColor(color1:GetRGB())
    panel.BGtexture:SetDesaturation(desaturation)
	-- borders
    panel.BorderTopRight:SetVertexColor(color2:GetRGB())
    panel.BorderBottomRight:SetVertexColor(color2:GetRGB())
    panel.BorderRightMiddle:SetVertexColor(color2:GetRGB())
    panel.BorderTopLeft:SetVertexColor(color2:GetRGB())
    panel.BorderBottomLeft:SetVertexColor(color2:GetRGB())
    panel.BorderLeftMiddle:SetVertexColor(color2:GetRGB())
    panel.BorderTopMiddle:SetVertexColor(color2:GetRGB())
    panel.BorderBottomMiddle:SetVertexColor(color2:GetRGB())
	-- texts
    panel.Title:SetTextColor(color1:GetRGB())
    panel.Title:SetText(VDW.Prefix(addon).."|nVersion: "..color2:WrapTextInColorCode(C_AddOns.GetAddOnMetadata(addon, "Version")))
    panel.TopTxt:SetTextColor(color1:GetRGB())
    panel.BottomRightTxt:SetTextColor(color1:GetRGB())
    panel.BottomRightTxt:SetText("May the Good "..color2:WrapTextInColorCode("Mojo").." be with you! ")
end
-- create box
function VDW.CreateOptionsBox(panel, box, color1, color2)
	local tW = panel["Box"..box].Title:GetStringWidth()+16
	local W = panel["Box"..box]:GetWidth()
	if tW >= W then
		panel["Box"..box]:SetWidth(panel["Box"..box].Title:GetStringWidth()+16)
	end
    panel["Box"..box].Title:SetTextColor(color1:GetRGB())
    panel["Box"..box].BorderTop:SetVertexColor(color2:GetRGB())
    panel["Box"..box].BorderBottom:SetVertexColor(color2:GetRGB())
    panel["Box"..box].BorderLeft:SetVertexColor(color2:GetRGB())
    panel["Box"..box].BorderRight:SetVertexColor(color2:GetRGB())
end
-- create pop out
function VDW.CreateOptionsPopOut(panel, box, popout, color1, color2)
	panel["Box"..box]["PopOut"..popout].Title:SetTextColor(color2:GetRGB())
    panel["Box"..box]["PopOut"..popout].Text:SetTextColor(color1:GetRGB())
    panel["Box"..box]["PopOut"..popout].NormalTexture:SetVertexColor(color2:GetRGB())
    panel["Box"..box]["PopOut"..popout].HighlightTexture:SetVertexColor(color1:GetRGB())
    panel["Box"..box]["PopOut"..popout].PushedTexture:SetVertexColor(color2:GetRGB())
	panel["Box"..box]["PopOut"..popout]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	panel["Box"..box]["PopOut"..popout]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if panel["Box"..box]["PopOut"..popout].Choice1 then
				if panel["Box"..box]["PopOut"..popout].Choice1:IsShown() then
					panel["Box"..box]["PopOut"..popout].Choice1:Hide()
				else
					panel["Box"..box]["PopOut"..popout].Choice1:Show()
				end
			end
		end
	end)
end
-- create pop out button
function VDW.CreateOptionsPopOutButtons(panel, box, popout, choice, name, color1)
	panel["Box"..box]["PopOut"..popout]["Choice"..choice] = CreateFrame("Button", nil, nil, "vdwPopOutButton")
    panel["Box"..box]["PopOut"..popout]["Choice"..choice]:ClearAllPoints()
	panel["Box"..box]["PopOut"..popout]["Choice"..choice].Text:SetTextColor(color1:GetRGB())
    panel["Box"..box]["PopOut"..popout]["Choice"..choice].Text:SetText(name.text)
    if choice == 1 then
        panel["Box"..box]["PopOut"..popout]["Choice"..choice]:SetParent(panel["Box"..box]["PopOut"..popout])
        panel["Box"..box]["PopOut"..popout]["Choice"..choice]:SetPoint("TOP", panel["Box"..box]["PopOut"..popout], "BOTTOM", 0, 4)
        panel["Box"..box]["PopOut"..popout]["Choice"..choice]:SetScript("OnShow", function(self)
            self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
            PlaySound(855, "Master")
        end)
        panel["Box"..box]["PopOut"..popout]["Choice"..choice]:SetScript("OnHide", function(self)
            self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
            PlaySound(855, "Master")
        end)
    else
        panel["Box"..box]["PopOut"..popout]["Choice"..choice]:SetParent(panel["Box"..box]["PopOut"..popout].Choice1)
        panel["Box"..box]["PopOut"..popout]["Choice"..choice]:SetPoint("TOP", panel["Box"..box]["PopOut"..popout]["Choice"..choice-1], "BOTTOM", 0, 0)
        panel["Box"..box]["PopOut"..popout]["Choice"..choice]:Show()
	end
end
-- create checkButton
function VDW.CreateCheckButton(panel, box, checkbutton)
	panel["Box"..box]["CheckButton"..checkbutton].Text:SetWidth(panel["Box"..box]:GetWidth()*0.8)
	panel["Box"..box]["CheckButton"..checkbutton]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
end
-- checkButton Tick
function VDW.CheckButtonTick(self, color1)
	self.Text:SetTextColor(color1:GetRGB())
	self.Text:SetAlpha(1)
	PlaySound(858, "Master")
end
-- checkButton UnTick
function VDW.CheckButtonUnTick(self)
	self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	PlaySound(858, "Master")
end
-- checkButton Check
function VDW.CheckButtonCheck(panel, box, checkbutton, color1)
	panel["Box"..box]["CheckButton"..checkbutton]:SetChecked(true)
	panel["Box"..box]["CheckButton"..checkbutton].Text:SetTextColor(color1:GetRGB())
	panel["Box"..box]["CheckButton"..checkbutton].Text:SetAlpha(1)
end
-- checkButton UnCheck
function VDW.CheckButtonUnCheck(panel, box, checkbutton)
	panel["Box"..box]["CheckButton"..checkbutton]:SetChecked(false)
	panel["Box"..box]["CheckButton"..checkbutton].Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
end
-- create slider
function VDW.CreateOptionsSlider(addonName, panel, box, slider, minText, maxText, minValue, maxValue, color1, color2)
	panel["Box"..box]["Slider"..slider].Slider.Thumb:SetVertexColor(color1:GetRGB())
	panel["Box"..box]["Slider"..slider].Back:GetRegions():SetVertexColor(color1:GetRGB())
	panel["Box"..box]["Slider"..slider].Forward:GetRegions():SetVertexColor(color1:GetRGB())
	panel["Box"..box]["Slider"..slider].TopText:SetTextColor(color2:GetRGB())
	panel["Box"..box]["Slider"..slider].MinText:SetTextColor(color2:GetRGB())
	panel["Box"..box]["Slider"..slider].MaxText:SetTextColor(color2:GetRGB())
	panel["Box"..box]["Slider"..slider].MinText:SetText(minText)
	panel["Box"..box]["Slider"..slider].MaxText:SetText(maxText)
	panel["Box"..box]["Slider"..slider].Slider:SetMinMaxValues(minValue, maxValue)
	panel["Box"..box]["Slider"..slider].Slider:HookScript("OnEnter", function(self)
		VDW.Tooltip_Show(self, VDW.Prefix(addonName), VDWtranslate.Global.SLIDER_TIP, color1, "Left")
	end)
	panel["Box"..box]["Slider"..slider].Slider:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	panel["Box"..box]["Slider"..slider].Slider:SetScript("OnMouseWheel", VDW.MouseWheelSlider)
end
-- create edit box
function VDW.CreateEditBox(panel, box, editBox, color1)
	-- colors
	panel["Box"..box]["EditBox"..editBox].GlowTopLeft:SetVertexColor(color1:GetRGB())
	panel["Box"..box]["EditBox"..editBox].GlowTopRight:SetVertexColor(color1:GetRGB())
	panel["Box"..box]["EditBox"..editBox].GlowBottomLeft:SetVertexColor(color1:GetRGB())
	panel["Box"..box]["EditBox"..editBox].GlowBottomRight:SetVertexColor(color1:GetRGB())
	panel["Box"..box]["EditBox"..editBox].GlowTop:SetVertexColor(color1:GetRGB())
	panel["Box"..box]["EditBox"..editBox].GlowBottom:SetVertexColor(color1:GetRGB())
	panel["Box"..box]["EditBox"..editBox].GlowLeft:SetVertexColor(color1:GetRGB())
	panel["Box"..box]["EditBox"..editBox].GlowRight:SetVertexColor(color1:GetRGB())
	-- size
	local fontFile, height, flags = panel["Box"..box]["EditBox"..editBox].WritingLine:GetFont()
	panel["Box"..box]["EditBox"..editBox]:SetWidth(panel["Box"..box]:GetWidth()*0.65)
	panel["Box"..box]["EditBox"..editBox]:SetHeight(height+8)
	panel["Box"..box]["EditBox"..editBox].WritingLine:SetWidth(panel["Box"..box]["EditBox"..editBox]:GetWidth()-8)
	panel["Box"..box]["EditBox"..editBox].WritingLine:SetHeight(height)
	-- leave
	panel["Box"..box]["EditBox"..editBox].WritingLine:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
end
-- create important notes
function VDW.CreateImportantNotes(panel, box, color1)
	panel["Box"..box].Notes:SetTextColor(color1:GetRGB())
	panel["Box"..box].Notes:SetWidth(panel["Box"..box]:GetWidth() - 8)
end
-- create important notes profiles
function VDW.CreateImportantNotesProfiles(addonName, panel, box, color1, color2)
	panel["Box"..box].Notes:SetTextColor(color1:GetRGB())
	panel["Box"..box].Notes:SetWidth(panel["Box"..box]:GetWidth() - 8)
	panel["Box"..box].Notes:SetText("|A:"..C_AddOns.GetAddOnMetadata(addonName, "IconAtlas")..":16:16|a"..color2:WrapTextInColorCode(VDWtranslate.Global.NOTE.." 1: ")..VDWtranslate.Global.NOTES_PROFILES)
end
-- create background of the tabs
function VDW.CreateBackgroundTab(option, atlas, desaturation, color1, color2)
local OptionsW = option.Panel1:GetWidth()
	option:SetWidth(option.Tab1:GetWidth() + OptionsW)
	option:SetHeight(option.Panel1:GetHeight())
	option.BGtexture:ClearAllPoints()
	option.BGtexture:SetPoint("TOPRIGHT", option, "TOPRIGHT", 0, 0)
	option.BGtexture:SetPoint("BOTTOMLEFT", option, "BOTTOMLEFT", OptionsW, 0)
	option.BGtexture:SetAtlas(atlas, false)
	option.BGtexture:SetDesaturation(desaturation)
	option.BGtexture:SetGradient("VERTICAL", color1, color2)
end
-- move the frame
function VDW.MoveTheFrame(option, clickMouse)
	option:RegisterForDrag(clickMouse)
	option:SetScript("OnDragStart", option.StartMoving)
	option:SetScript("OnDragStop", option.StopMovingOrSizing)
end
-- Mouse Wheel on Sliders
function VDW.MouseWheelSlider(self, delta)
	if delta == 1 then
		self:SetValue(self:GetValue() + 1)
	elseif delta == -1 then
		self:SetValue(self:GetValue() - 1)
	end
end
-- pop out button enable-disable
function VDW.popEnable(self)
	self:EnableMouse(true)
	self:SetAlpha(1)
end
function VDW.popDisable(self)
	self:EnableMouse(false)
	self:SetAlpha(0.35)
end
-- slider enable-disable
function VDW.sliderEnable(self)
	self.Slider:EnableMouse(true)
	self.Back:EnableMouse(true)
	self.Forward:EnableMouse(true)
	self:SetAlpha(1)
end
function VDW.sliderDisable(self)
	self.Slider:EnableMouse(false)
	self.Back:EnableMouse(false)
	self.Forward:EnableMouse(false)
	self:SetAlpha(0.35)
end
