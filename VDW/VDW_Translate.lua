local base = {
	ADDON_IS_STATE = "The addon %s is %s",
	COMBAT_LOCKDOWN = "You can't do that while in combat!",
	MOVING_LOCKDOWN = "You can't do that while you're moving!",
	OPEN_SETTINGS_MAIN = "Open the main settings panel",
	DRAG_ME_TO_MOVE = "and drag to move me!",
	LEFT_CLICK = "Left Click",
	RIGHT_CLICK = "Right Click",
-- A
	ARENA_CAST_BAR = "Arena Cast Bars",
	ASCENDING = "Ascending",
	ANIMATION = "Animation",
-- B
	BANNER = "Banner",
	BAR = "Bar",
	BAR_BORDER = "Bar Border",
	BAR_FILL = "Bar Fill",
	BAR_FILL_TIP = "Select %s |n|n1. Standard means that the bar fills from left to right as values increase.|n|n2. Reversed means that the bar fills from right to left as values increase.|n|n3. Center means that the bar grows outward from the center",
	BAR_STATUS = "Bar Status",
	BOSS_CAST_BAR = "Boss Cast Bars",
	BORDER = "Border",
	BOTH = "Both",
	BOTTOM = "Bottom",
	BOTTOMLEFT = "Bottom Left",
	BOTTOMRIGHT = "Bottom Right",
-- C
	CAST_BAR_SIZE = "Cast Bar Size",
	CAST_TIME_BOTH = "Cast Time (Current/Total)",
	CAST_TIME_CURRENT = "Current Cast Time",
	CAST_TIME_TOTAL = "Total Cast Time",
	CENTER = "Center",
	CHECK_IF_YOU_WANT_TO_TIP = "Check me! if you want to %s.",
	CHECK_IF_YOU_WANT_TO_SHOW = "Check me! if you want the %s to be shown",
	CHECK_IF_YOU_WANT_TO_COLOR_BAR = "Check! me if you want to color the bar while your %s is on cooldown.",
	CLASS = "Class",
	CLASS_ARTIFACT = "Class Artifact",
	CLASS_ROUND = "Class Round",
	CLASS_SQUARE = "Class Square",
	CLASSIC = "Classic",
	CLOSE_THIS_PANEL = "Close this panel!",
	COLOR = "Color",
	COLOR_THE_BAR_IF_COOLDOWN = "Color the bar if my %s is on cooldown.",
	COLOR_TIP = "Which color do you want for %s?",
	CUSTOM = "Custom",
-- D
	DECIMALS = "Decimals",
	DECIMALS_TIP = "How many decimal places do you want to show?",
	DEFAULT = "Default",
	DESCENDING = "Descending",
	DIRECTION = "Direction",
	DIRECTION_TIMER_TIP = "How should the timer count?|n|n'Both' means the timer counts up while casting and counts down while channeling!",
	DIRECTION_POPOUT_TIP = "Choose the direction of the %s Popout Button",
	DOWNWARD = "Downward",
-- E
	ENABLE_GLOBAL_COOLDOWN = "Enable Global Cooldown",
-- F
	FACTION = "Faction",
	FACTION_NEW = "Faction New",
	FACTION_OLD = "Faction Old",
	FACTION_ROUND = "Faction Round",
	FOCUS_CAST_BAR = "Focus Cast Bar",
-- G
	GLOBAL_COOLDOWN = "Global Cooldown",
-- H
	HEIGHT = "Height",
	HERO = "Hero",
	HIDE = "Hide",
-- I
	ICON = "Icon",
	IMPORTANT_NOTES = "Important Notes",
-- L
	LATENCY_BAR = "Latency Bar",
	LAYOUT = "Layout",
	LAYOUT_INSTANT_TIP = "Select a layout for %s |n|n1. Default means that the Instant Cast Bar follows the Player Cast Bar setting.|n|n2. Custom means that you need to set it up manually.",
	LEFT = "Left",
	LOCKING = "Locking",
	LOCKING_TIP_BANNER = "1. Locked: Attach the banner to the player casting bar.|n|n2. Unlocked: Unlock the banner so you can move it anywhere",
	LOCKING_TIP_TARGET = "1. Locked: Attach the cast bar to the target frame.|n|n2. Unlocked: Unlock the cast bar so you can move it anywhere.|n|nAfter changing this option, the UI will reload!",
	LOCKING_TIP_FOCUS  = "1. Locked: Attach the cast bar to the focus frame.|n|n2. Unlocked: Unlock the cast bar so you can move it anywhere.|n|nAfter changing this option, the UI will reload!",
	LOCKING_TIP_BOSS   = "1. Locked: Attach the cast bars to the boss frames.|n|n2. Unlocked: Unlock the cast bars so you can move them anywhere.|n|nAfter changing this option, the UI will reload!",
	LOCKING_TIP_ARENA  = "1. Locked: Attach the cast bars to the arena frames.|n|n2. Unlocked: Unlock the cast bars so you can move them anywhere.|n|nAfter changing this option, the UI will reload!",
	LOCKED = "Locked",
	LOOT_BUTTONS = "Loot Buttons",
	LOOT_BUTTONS_TIP = "to change your loot specialization into: %s Specialization",
	LOOT_BUTTONS_TIP_CURRENT = "to change your loot specialization into: Current Specialization (%s)",
	LOOT_BUTTONS_WRN_CURRENT = "|cnYELLOW_FONT_COLOR:Loot Specialization set to: Current Specialization (%s)|r",
-- M
	MODERN = "Modern",
-- N
	NOTE = "Note",
-- O
	OPTIONS_FOR = "Options for %s",
-- P
	PLAYER_CAST_BAR = "Player Cast Bar",
	POSITION = "Position",
	POSITION_TIP = "Where should %s appear?",
-- Q
	QUEUE_BAR = "Spell Queue Window",
-- R
	REVERSED = "Reversed",
	RIGHT = "Right",
	RUNES = "Runes",
-- S
	SCALE  = "Scale",
	SHOW = "Show",
	SHIELD_ICON = "Shield Icon",
	SIZE = "Size",
	SLIDER_TIP = "You can also use the mouse wheel or the edge buttons to change the value",
	SPECIALIZATION_BUTTONS = "Specialization Buttons",
	SPECIALIZATION_BUTTONS_TIP = "to change into:",
	SPELL_ICON = "Spell Icon",
	SPELL_NAME = "Spell Name",
	SPELL_SCHOOL = "Spell School",
	SPELL_TICKS = "Spell Ticks",
	STANDARD = "Standard",
	STYLE = "Style",
	STYLE_TIP = "Which style do you want for %s?",
-- T
	TALENTS = "Talents",
	TALENT_BUTTONS = "Talent Buttons",
	TALENT_BUTTONS_TIP = "to choose a talent loadout",
	TARGET_CAST_BAR = "Target Cast Bar",
	TEXT_BORDER = "Text Border",
	TIME = "Time",
	TOP = "Top",
	TOPLEFT = "Top Left",
	TOPRIGHT = "Top Right",
-- U
	UNLOCK_CAST_BAR = "Unlock Cast Bar",
	UNLOCKED = "Unlocked",
	UPWARD = "Upward",
-- V
	VISIBILITY = "Visibility",
	VISIBILITY_TIP = "Do you want to show %s?",
-- W
	WIDTH = "Width",
-- notes --
	NOTES_HIDE_SHOW_BUTTONS = "When you hide or show the buttons the game will be RELOADED!",
	NOTES_DIRECTION_BUTTONS = "When you choose the direction of the buttons the game will RELOADED!",
	NOTES_CHANGE_TALENTS = "Please! When you change, or create, or delete a talent load please restart (/reload) the game, so the talent popout buttons will work properly!",
	NOTES_PROFILES = "When you CREATE, LOAD, or DELETE a Profile, the game will be RELOADED!",
-- profiles
	P_TAB = "Profiles",
	P_TITLE = "Create, Load, and Delete Profiles",
	P_SUB_CREATE = "Create Profiles",
	P_SUB_LOAD = "Load Profiles",
	P_SUB_DELETE = "Delete Profiles",
	P_TIP_CREATE = "Type a profile name and press Enter to save your settings",
	P_TIP_LOAD = "Select a profile to load",
	P_TIP_DELETE = "Select a profile to delete",
	P_WRN_NEED = "Please enter a profile name",
	P_WRN_EXIST = "That profile already exists. Please try another name",
	P_WRN_LOAD = "There are no profiles to load",
	P_WRN_DELETE = "There are no profiles to delete",
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
