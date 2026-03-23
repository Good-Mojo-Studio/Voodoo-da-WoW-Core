local base = {
	ADDON_IS_STATE = "The addon %s is %s.",
	COMBAT_LOCKDOWN = "You can't do that while in combat!",
	MOVING_LOCKDOWN = "You can't do that while you're moving!",
	OPEN_SETTINGS_MAIN = "Open the main settings panel.",
	DRAG_ME_TO_MOVE = "and drag to move me!",
	LEFT_CLICK = "Left Click",
	RIGHT_CLICK = "Right Click",
-- A
	ASCENDING = "Ascending",
-- B
	BANNER = "Banner",
	BAR = "Bar",
	BORDER = "Border",
	BOTH = "Both",
	BOTTOM = "Bottom",
	BOTTOMLEFT = "Bottom Left",
	BOTTOMRIGHT = "Bottom Right",
-- C
	CENTER = "Center",
	CLASS = "Class",
	CLASS_ROUND = "Class Round",
	CLASS_SQUARE = "Class Square",
	CLASSIC = "Classic",
	CUSTOM = "Custom",
-- D
	DEFAULT = "Default",
	DESCENDING = "Descending",
	DOWNWARD = "Downward",
-- F
	FACTION = "Faction",
	FACTION_NEW = "Faction New",
	FACTION_OLD = "Faction Old",
	FACTION_ROUND = "Faction Round",
-- H
	HERO = "Hero",
	HIDE = "Hide",
-- I
	ICON = "Icon",
-- L
	LEFT = "Left",
	LOCKED = "Locked",
-- M
	MODERN = "Modern",
-- R
	REVERSED = "Reversed",
	RIGHT = "Right",
	RUNES = "Runes",
-- S
	SHOW = "Show",
	SPELL_SCHOOL = "Spell School",
	STANDARD = "Standard",
-- T
	TOP = "Top",
	TOPLEFT = "Top Left",
	TOPRIGHT = "Top Right",
-- U
	UNLOCKED = "Unlocked",
	UPWARD = "Upward",
-- profiles
	P_TAB = "Profiles",
	P_TITLE = "Create, Load, and Delete Profiles",
	P_SUB_CREATE = "Create Profiles",
	P_SUB_LOAD = "Load Profiles",
	P_SUB_DELETE = "Delete Profiles",
	P_SUB_NOTES = "Notes",
	P_TIP_CREATE = "Type a profile name and press Enter to save your settings.",
	P_TIP_LOAD = "Select a profile to load.",
	P_TIP_DELETE = "Select a profile to delete.",
	P_WRN_NEED = "Please enter a profile name.",
	P_WRN_EXIST = "That profile already exists. Please try another name.",
	P_WRN_LOAD = "There are no profiles to load.",
	P_WRN_DELETE = "There are no profiles to delete.",
}
VDWtranslate.Local.enUS = base
local loc = GetLocale()
local o = VDWtranslate.Local[loc]
if type(o) == "string" then
	o = VDWtranslate.Local[o]
end
if type(o) ~= "table" then
	o = nil
end
for k, v in pairs(base) do
	VDWtranslate.Global[k] = (o and o[k]) or v
end
