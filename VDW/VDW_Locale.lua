-- some variables --
VDW = VDW or {}
VDW.Local = VDW.Local or {}
VDW.Local.Override = VDW.Local.Override or {}
-- localization --
local base = {
-- warnings --
	WRN_ADDON_IS_STATE = "The addon %s is %s.",
	WRN_COMBAT_LOCKDOWN = "You can't do that while in combat.",
	WRN_MOVING = "You can't do that while you're moving.",
-- tool tip --
	TIP_OPEN_SETTINGS_MAIN = "Open the main settings panel.",
	TIP_DRAG_ME = " and drag to move me!",
-- mouse buttons --
	BUTTON_L_CLICK = "Left Click",
	BUTTON_R_CLICK = "Right Click",
-- options --
-- hide - show --
	OPTIONS_V_HIDE = "Hide",
	OPTIONS_V_SHOW = "Show",
-- position --
	OPTIONS_P_TOPLEFT = "Top Left",
	OPTIONS_P_LEFT = "Left",
	OPTIONS_P_BOTTOMLEFT = "Bottom Left",
	OPTIONS_P_TOP = "Top",
	OPTIONS_P_CENTER = "Center",
	OPTIONS_P_BOTTOM = "Bottom",
	OPTIONS_P_TOPRIGHT = "Top Right",
	OPTIONS_P_RIGHT = "Right",
	OPTIONS_P_BOTTOMRIGHT = "Bottom Right",
	OPTIONS_P_BOTH = "Both",
-- color --
	OPTIONS_C_DEFAULT = "Default",
	OPTIONS_C_CUSTOM = "Custom",
	OPTIONS_C_CLASS = "Class",
	OPTIONS_C_FACTION = "Faction",
	OPTIONS_C_SPELL = "Spell's School",
-- style --
	OPTIONS_S_CLASS_ICON = "Class Icon",
	OPTIONS_S_HERO_ICON = "Hero Icon",
	OPTIONS_S_FACTION_ICON = "Fanction Icon",
	OPTIONS_S_CLASSIC = "Classic",
	OPTIONS_S_MODERN = "Modern",
	OPTIONS_S_DEFAULT_BAR = "Default Bar",
	OPTIONS_S_BANNER = "Banner",
	OPTIONS_S_RUNES = "Runes",
-- direction --
	OPTIONS_D_ASCENDING = "Ascending",
	OPTIONS_D_DESCENDING = "Descending",
	OPTIONS_D_UPWARD = "Upward",
	OPTIONS_D_DOWNWARD = "Downward",
-- lock state --
	OPTIONS_LS_LOCKED = "Locked",
	OPTIONS_LS_UNLOCKED = "Unlocked",
}
-- translate --
VDW.Local.Translate = {
	frFR = {
-- warnings --
		WRN_ADDON_IS_STATE = "L'addon %s est %s.",
		WRN_COMBAT_LOCKDOWN = "Impossible en combat.",
		WRN_MOVING = "Vous ne pouvez pas faire cela en vous déplaçant.",
-- tool tip --
		TIP_OPEN_SETTINGS_MAIN = "Ouvrir le panneau principal des paramètres",
		TIP_DRAG_ME = " et faites glisser pour me déplacer !",
-- mouse buttons --
		BUTTON_L_CLICK = "Clic gauche",
		BUTTON_R_CLICK = "Clic droit",
-- options --
-- hide - show --
		OPTIONS_V_HIDE = "Masquer",
		OPTIONS_V_SHOW = "Afficher",
-- position --
		OPTIONS_P_TOPLEFT = "Haut gauche",
		OPTIONS_P_LEFT = "Gauche",
		OPTIONS_P_BOTTOMLEFT = "Bas gauche",
		OPTIONS_P_TOP = "Haut",
		OPTIONS_P_CENTER = "Centre",
		OPTIONS_P_BOTTOM = "Bas",
		OPTIONS_P_TOPRIGHT = "Haut droite",
		OPTIONS_P_RIGHT = "Droite",
		OPTIONS_P_BOTTOMRIGHT = "Bas droite",
		OPTIONS_P_BOTH = "Les deux",
-- color --
		OPTIONS_C_DEFAULT = "Par défaut",
		OPTIONS_C_CUSTOM = "Personnalisé",
		OPTIONS_C_CLASS = "Classe",
		OPTIONS_C_SPELL = "École du sort",
		OPTIONS_C_FACTION = "Faction",
-- style --
		OPTIONS_S_CLASS_ICON = "Icône de classe",
		OPTIONS_S_HERO_ICON = "Icône de héros",
		OPTIONS_S_FACTION_ICON = "Icône de faction",
		OPTIONS_S_CLASSIC = "Classique",
		OPTIONS_S_MODERN = "Moderne",
		OPTIONS_S_DEFAULT_BAR = "Barre par défaut",
		OPTIONS_S_BANNER = "Bannière",
		OPTIONS_S_RUNES = "Runes",
-- direction --
		OPTIONS_D_ASCENDING = "Croissant",
		OPTIONS_D_DESCENDING = "Décroissant",
		OPTIONS_D_UPWARD = "Vers le haut",
		OPTIONS_D_DOWNWARD = "Vers le bas",
-- lock state --
		OPTIONS_LS_LOCKED = "Verrouillé",
		OPTIONS_LS_UNLOCKED = "Déverrouillé",
	},
	
	deDE = {
-- warnings --
		WRN_ADDON_IS_STATE = "Das Addon %s ist %s.",
		WRN_COMBAT_LOCKDOWN = "Im Kampf nicht möglich.",
		WRN_MOVING = "Das kannst du nicht, während du dich bewegst.",
-- mouse buttons --
		BUTTON_L_CLICK = "Linksklick",
		BUTTON_R_CLICK = "Rechtsklick",
-- tool tip --
		TIP_OPEN_SETTINGS_MAIN = "Hauptfenster der Einstellungen öffnen",
		TIP_DRAG_ME = " und zieh mich, um mich zu bewegen!",
-- options --
-- hide - show --
		OPTIONS_V_HIDE = "Ausblenden",
		OPTIONS_V_SHOW = "Anzeigen",
-- position --
		OPTIONS_P_TOPLEFT = "Oben links",
		OPTIONS_P_LEFT = "Links",
		OPTIONS_P_BOTTOMLEFT = "Unten links",
		OPTIONS_P_TOP = "Oben",
		OPTIONS_P_CENTER = "Mitte",
		OPTIONS_P_BOTTOM = "Unten",
		OPTIONS_P_TOPRIGHT = "Oben rechts",
		OPTIONS_P_RIGHT = "Rechts",
		OPTIONS_P_BOTTOMRIGHT = "Unten rechts",
		OPTIONS_P_BOTH = "Beides",
-- color --
		OPTIONS_C_DEFAULT = "Standard",
		OPTIONS_C_CUSTOM = "Benutzerdefiniert",
		OPTIONS_C_CLASS = "Klasse",
		OPTIONS_C_SPELL = "Zauberschule",
		OPTIONS_C_FACTION = "Fraktion",
-- style --
		OPTIONS_S_CLASS_ICON = "Klassensymbol",
		OPTIONS_S_HERO_ICON = "Heldensymbol",
		OPTIONS_S_FACTION_ICON = "Fraktionssymbol",
		OPTIONS_S_CLASSIC = "Klassisch",
		OPTIONS_S_MODERN = "Modern",
		OPTIONS_S_DEFAULT_BAR = "Standardleiste",
		OPTIONS_S_BANNER = "Banner",
		OPTIONS_S_RUNES = "Runen",
-- direction --
		OPTIONS_D_ASCENDING = "Aufsteigend",
		OPTIONS_D_DESCENDING = "Absteigend",
		OPTIONS_D_UPWARD = "Nach oben",
		OPTIONS_D_DOWNWARD = "Nach unten",
-- lock state --
		OPTIONS_LS_LOCKED = "Gesperrt",
		OPTIONS_LS_UNLOCKED = "Entsperrt",
	},
	
	esES = {
-- warnings --
		WRN_ADDON_IS_STATE = "El addon %s está %s.",
		WRN_COMBAT_LOCKDOWN = "No puedes hacer eso en combate.",
		WRN_MOVING = "No puedes hacer eso mientras te mueves.",
-- mouse buttons --
		BUTTON_L_CLICK = "Clic izquierdo",
		BUTTON_R_CLICK = "Clic derecho",
-- tool tip --
		TIP_OPEN_SETTINGS_MAIN = "Abrir el panel principal de configuración",
		TIP_DRAG_ME = " y arrástrame para moverme!",
-- options --
-- hide - show --
		OPTIONS_V_HIDE = "Ocultar",
		OPTIONS_V_SHOW = "Mostrar",
-- position --
		OPTIONS_P_TOPLEFT = "Arriba izquierda",
		OPTIONS_P_LEFT = "Izquierda",
		OPTIONS_P_BOTTOMLEFT = "Abajo izquierda",
		OPTIONS_P_TOP = "Arriba",
		OPTIONS_P_CENTER = "Centro",
		OPTIONS_P_BOTTOM = "Abajo",
		OPTIONS_P_TOPRIGHT = "Arriba derecha",
		OPTIONS_P_RIGHT = "Derecha",
		OPTIONS_P_BOTTOMRIGHT = "Abajo derecha",
		OPTIONS_P_BOTH = "Ambos",
-- color --
		OPTIONS_C_DEFAULT = "Predeterminado",
		OPTIONS_C_CUSTOM = "Personalizado",
		OPTIONS_C_CLASS = "Clase",
		OPTIONS_C_SPELL = "Escuela del hechizo",
		OPTIONS_C_FACTION = "Facción",
-- style --
		OPTIONS_S_CLASS_ICON = "Icono de clase",
		OPTIONS_S_HERO_ICON = "Icono de héroe",
		OPTIONS_S_FACTION_ICON = "Icono de facción",
		OPTIONS_S_CLASSIC = "Clásico",
		OPTIONS_S_MODERN = "Moderno",
		OPTIONS_S_DEFAULT_BAR = "Barra predeterminada",
		OPTIONS_S_BANNER = "Estandarte",
		OPTIONS_S_RUNES = "Runas",
-- direction --
		OPTIONS_D_ASCENDING = "Ascendente",
		OPTIONS_D_DESCENDING = "Descendente",
		OPTIONS_D_UPWARD = "Hacia arriba",
		OPTIONS_D_DOWNWARD = "Hacia abajo",
-- lock state --
		OPTIONS_LS_LOCKED = "Bloqueado",
		OPTIONS_LS_UNLOCKED = "Desbloqueado",
	},
	
	esMX = {
-- warnings --
		WRN_ADDON_IS_STATE = "El addon %s está %s.",
		WRN_COMBAT_LOCKDOWN = "No puedes hacer eso en combate.",
		WRN_MOVING = "No puedes hacer eso mientras te mueves.",
-- tool tip --
		TIP_OPEN_SETTINGS_MAIN = "Abrir el panel principal de configuración",
		TIP_DRAG_ME = " y arrástrame para moverme!",
-- mouse buttons --
		BUTTON_L_CLICK = "Clic izquierdo",
		BUTTON_R_CLICK = "Clic derecho",
-- options --
-- hide - show --
		OPTIONS_V_HIDE = "Ocultar",
		OPTIONS_V_SHOW = "Mostrar",
-- position --
		OPTIONS_P_TOPLEFT = "Arriba izquierda",
		OPTIONS_P_LEFT = "Izquierda",
		OPTIONS_P_BOTTOMLEFT = "Abajo izquierda",
		OPTIONS_P_TOP = "Arriba",
		OPTIONS_P_CENTER = "Centro",
		OPTIONS_P_BOTTOM = "Abajo",
		OPTIONS_P_TOPRIGHT = "Arriba derecha",
		OPTIONS_P_RIGHT = "Derecha",
		OPTIONS_P_BOTTOMRIGHT = "Abajo derecha",
		OPTIONS_P_BOTH = "Ambos",
-- color --
		OPTIONS_C_DEFAULT = "Predeterminado",
		OPTIONS_C_CUSTOM = "Personalizado",
		OPTIONS_C_CLASS = "Clase",
		OPTIONS_C_SPELL = "Escuela del hechizo",
		OPTIONS_C_FACTION = "Facción",
-- style --
		OPTIONS_S_CLASS_ICON = "Ícono de clase",
		OPTIONS_S_HERO_ICON = "Ícono de héroe",
		OPTIONS_S_FACTION_ICON = "Ícono de facción",
		OPTIONS_S_CLASSIC = "Clásico",
		OPTIONS_S_MODERN = "Moderno",
		OPTIONS_S_DEFAULT_BAR = "Barra predeterminada",
		OPTIONS_S_BANNER = "Estandarte",
		OPTIONS_S_RUNES = "Runas",
-- direction --
		OPTIONS_D_ASCENDING = "Ascendente",
		OPTIONS_D_DESCENDING = "Descendente",
		OPTIONS_D_UPWARD = "Hacia arriba",
		OPTIONS_D_DOWNWARD = "Hacia abajo",
-- lock state --
		OPTIONS_LS_LOCKED = "Bloqueado",
		OPTIONS_LS_UNLOCKED = "Desbloqueado",
	},
	
	ptBR = {
-- warnings --
		WRN_ADDON_IS_STATE = "O addon %s está %s.",
		WRN_COMBAT_LOCKDOWN = "Não é possível em combate.",
		WRN_MOVING = "Você não pode fazer isso enquanto estiver se movendo.",
-- tool tip --
		TIP_OPEN_SETTINGS_MAIN = "Abrir o painel principal de configurações",
		TIP_DRAG_ME = " e arraste para me mover!",
-- mouse buttons --
		BUTTON_L_CLICK = "Clique esquerdo",
		BUTTON_R_CLICK = "Clique direito",
-- options --
-- hide - show --
		OPTIONS_V_HIDE = "Ocultar",
		OPTIONS_V_SHOW = "Mostrar",
-- position --
		OPTIONS_P_TOPLEFT = "Superior esquerdo",
		OPTIONS_P_LEFT = "Esquerda",
		OPTIONS_P_BOTTOMLEFT = "Inferior esquerdo",
		OPTIONS_P_TOP = "Superior",
		OPTIONS_P_CENTER = "Centro",
		OPTIONS_P_BOTTOM = "Inferior",
		OPTIONS_P_TOPRIGHT = "Superior direito",
		OPTIONS_P_RIGHT = "Direita",
		OPTIONS_P_BOTTOMRIGHT = "Inferior direito",
		OPTIONS_P_BOTH = "Ambos",
-- color --
		OPTIONS_C_DEFAULT = "Padrão",
		OPTIONS_C_CUSTOM = "Personalizado",
		OPTIONS_C_CLASS = "Classe",
		OPTIONS_C_SPELL = "Escola do feitiço",
		OPTIONS_C_FACTION = "Facção",
-- style --
		OPTIONS_S_CLASS_ICON = "Ícone de classe",
		OPTIONS_S_HERO_ICON = "Ícone de herói",
		OPTIONS_S_FACTION_ICON = "Ícone de facção",
		OPTIONS_S_CLASSIC = "Clássico",
		OPTIONS_S_MODERN = "Moderno",
		OPTIONS_S_DEFAULT_BAR = "Barra padrão",
		OPTIONS_S_BANNER = "Estandarte",
		OPTIONS_S_RUNES = "Runas",
-- direction --
		OPTIONS_D_ASCENDING = "Crescente",
		OPTIONS_D_DESCENDING = "Decrescente",
		OPTIONS_D_UPWARD = "Para cima",
		OPTIONS_D_DOWNWARD = "Para baixo",
-- lock state --
		OPTIONS_LS_LOCKED = "Travado",
		OPTIONS_LS_UNLOCKED = "Destravado",
	},
	
	itIT = {
-- warnings --
		WRN_ADDON_IS_STATE = "L'addon %s è %s.",
		WRN_COMBAT_LOCKDOWN = "Impossibile in combattimento.",
		WRN_MOVING = "Non puoi farlo mentre ti stai muovendo.",
-- tool tip --
		TIP_OPEN_SETTINGS_MAIN = "Aprire il pannello principale delle impostazioni",
		TIP_DRAG_ME = " e trascina per spostarmi!",
-- mouse buttons --
		BUTTON_L_CLICK = "Clic sinistro",
		BUTTON_R_CLICK = "Clic destro",
-- options --
-- hide - show --
		OPTIONS_V_HIDE = "Nascondi",
		OPTIONS_V_SHOW = "Mostra",
-- position --
		OPTIONS_P_TOPLEFT = "In alto a sinistra",
		OPTIONS_P_LEFT = "Sinistra",
		OPTIONS_P_BOTTOMLEFT = "In basso a sinistra",
		OPTIONS_P_TOP = "In alto",
		OPTIONS_P_CENTER = "Centro",
		OPTIONS_P_BOTTOM = "In basso",
		OPTIONS_P_TOPRIGHT = "In alto a destra",
		OPTIONS_P_RIGHT = "Destra",
		OPTIONS_P_BOTTOMRIGHT = "In basso a destra",
		OPTIONS_P_BOTH = "Entrambi",
-- color --
		OPTIONS_C_DEFAULT = "Predefinito",
		OPTIONS_C_CUSTOM = "Personalizzato",
		OPTIONS_C_CLASS = "Classe",
		OPTIONS_C_SPELL = "Scuola dell’incantesimo",
		OPTIONS_C_FACTION = "Fazione",
-- style --
		OPTIONS_S_CLASS_ICON = "Icona della classe",
		OPTIONS_S_HERO_ICON = "Icona dell’eroe",
		OPTIONS_S_FACTION_ICON = "Icona della fazione",
		OPTIONS_S_CLASSIC = "Classico",
		OPTIONS_S_MODERN = "Moderno",
		OPTIONS_S_DEFAULT_BAR = "Barra predefinita",
		OPTIONS_S_BANNER = "Stendardo",
		OPTIONS_S_RUNES = "Rune",
-- direction --
		OPTIONS_D_ASCENDING = "Crescente",
		OPTIONS_D_DESCENDING = "Decrescente",
		OPTIONS_D_UPWARD = "Verso l’alto",
		OPTIONS_D_DOWNWARD = "Verso il basso",
-- lock state --
		OPTIONS_LS_LOCKED = "Bloccato",
		OPTIONS_LS_UNLOCKED = "Sbloccato",
	},
	
	enUS = base,
	ruRU = base,
	zhCN = base,
	zhTW = base,
	koKR = base,
}
-- variables for the fuction --
local loc = GetLocale()
local o = VDW.Local.Translate[loc]
-- checking variables --
if type(o) == "string" then
	o = VDW.Local.Translate[o]
end
if type(o) ~= "table" then
	o = nil
end
-- function for the localization --
for k, v in pairs(base) do
	VDW.Local.Override[k] = (o and o[k]) or v
end
