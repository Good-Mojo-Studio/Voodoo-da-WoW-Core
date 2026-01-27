-- prefix for game tool tip --
VDW._prefixCache = VDW._prefixCache or {}
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
-- prefix for chat --
function VDW.PrefixChat(addonName)
	local t = GameTime_GetTime(false)
	local title = C_AddOns.GetAddOnMetadata(addonName, "Title") or addonName
	local icon  = C_AddOns.GetAddOnMetadata(addonName, "IconAtlas")
	local p = ("["..t.."] (|A:%s:16:16:0:0|a%s)"):format(icon, title)
	return p
end
-- VDW tooltip --
local function VDW_CreateOptionsTooltip()
	if VDW_OptionsTooltip then return VDW_OptionsTooltip end
	local tt = CreateFrame("GameTooltip", "VDW_OptionsTooltip", UIParent, "GameTooltipTemplate")
	return tt
end
-- VDW tooltip position helpers --
-- entering --
function VDW.Tooltip_Show(owner, titleText, bodyText, color, position)
	local tt = VDW_CreateOptionsTooltip()
	local width = 280
	tt:SetOwner(owner, "ANCHOR_NONE")
	tt:ClearAllPoints()
	if position == "Right" then
		tt:SetPoint("LEFT", owner, "RIGHT", 0, 0)
	elseif position == "Top" then
		tt:SetPoint("BOTTOM", owner, "TOP", 0, 0)
	elseif position == "Bottom" then
		tt:SetPoint("TOP", owner, "BOTTOM", 0, 0)
	else
		tt:SetPoint("RIGHT", owner, "LEFT", 0, 0)
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
-- leaving --
function VDW.Tooltip_Hide()
	if VDW_OptionsTooltip then
		VDW_OptionsTooltip:Hide()
	end
end
-- colors --
VDW.Colors = VDW.Colors or {}
VDW.ColorHex = VDW.ColorHex or {}
-- addons colors --
VDW.ColorHex.FMC = { Main = "F0E68CFF", High = "B57E25FF" }
VDW.ColorHex.MOV = { Main = "D1D9BFFF", High = "BCA220FF" }
VDW.ColorHex.SSOA = { Main = "B09F8DFF", High = "EEE991FF" }
VDW.ColorHex.VCB = { Main = "F0E68CFF", High = "9ACD32FF" }
VDW.ColorHex.VDWS = { Main = "F0E68CFF", High = "974CE7FF" }
-- helping function --
local function MakeNoAlpha(color)
	local r, g, b = color:GetRGB()
	return CreateColor(r, g, b, 0)
end
-- main function --
function VDW.GetAddonColors(addonKey)
-- cache --
	if VDW.Colors[addonKey] then
		return VDW.Colors[addonKey]
	end
	local hex = VDW.ColorHex[addonKey]
	if not hex then
		hex = { Main = "FFFFFFFF", High = "FFFFFFFF" }
	end
	local main = CreateColorFromRGBAHexString(hex.Main)
	local high = CreateColorFromRGBAHexString(hex.High)
	VDW.Colors[addonKey] = {
		Main   = main,
		High   = high,
		NoMain = MakeNoAlpha(main),
		NoHigh = MakeNoAlpha(high),
	}
	return VDW.Colors[addonKey]
end
-- cache player globals into VDW namespace --
local function CachePlayerInfo()
-- class ID --
	local _, _, classID = C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))
	VDW.PlayerClassID = classID
-- class colors --
	VDW.PlayerClassColor = C_ClassColor.GetClassColor(select(2, C_PlayerInfo.GetClass(PlayerLocation:CreateFromUnit("player"))))
-- faction info --
	local raceID = C_PlayerInfo.GetRace(PlayerLocation:CreateFromUnit("player"))
	VDW.PlayerFactionInfo = C_CreatureInfo.GetFactionInfo(raceID)
-- faction color --
	if VDW.PlayerFactionInfo.groupTag == "Alliance" then
		VDW.PlayerFactionColor = PLAYER_FACTION_COLOR_ALLIANCE
	elseif VDW.PlayerFactionInfo.groupTag == "Horde" then
		VDW.PlayerFactionColor = PLAYER_FACTION_COLOR_HORDE
	end
end
-- events time --
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		CachePlayerInfo()
	end
end
vdwZlave:SetScript("OnEvent", EventsTime)
