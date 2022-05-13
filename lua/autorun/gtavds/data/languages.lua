--[[----------------------------------------------------
  DEFAULT LANGAUGES
  Languages bundled with the addon
]]------------------------------------------------------

if CLIENT then

  --[[
    DEFAULT LANGUAGE
    Do not erase please or you'll potentially break the addon
  ]]
  GTAVDS:AddLanguage("en", "English", {
    ["wasted.default"] = "wasted",
    ["death.weapon.generic"] = "killed you.",
    ["death.weapon.pistol"] = "gunned you down.",
    ["death.weapon.smg"] = "riddled you.",
    ["death.weapon.rifle"] = "gunned you down.",
    ["death.weapon.shotgun"] = "filled you with buckshot.",
    ["death.weapon.explosion"] = "blew you up.",
    ["death.weapon.bolt"] = "tore through you.",
    ["death.suicide"] = "You commited suicide.",
    ["death.generic"] = "You died.",
    ["death.vehicle"] = "flattened you.",
    ["death.explosion"] = "You blew up.",
    ["death.npc.one"] = "A",
    ["death.npc.generic"] = "killed you."
  });

  -- Spanish
  GTAVDS:AddLanguage("es", "Español", {
    ["wasted.default"] = "eliminado",
    ["death.weapon.generic"] = "te ha matado.",
    ["death.weapon.pistol"] = "te ha tiroteado.",
    ["death.weapon.smg"] = "te ha acribillado.",
    ["death.weapon.rifle"] = "te ha derribado a tiros.",
    ["death.weapon.shotgun"] = "te ha llenado de perdigones.",
    ["death.weapon.explosion"] = "te ha hecho estallar por los aires.",
    ["death.weapon.bolt"] = "te ha atravesado.",
    ["death.suicide"] = "Te has suicidado.",
    ["death.generic"] = "Has muerto.",
    ["death.vehicle"] = "te ha atropellado.",
    ["death.explosion"] = "Has volado por los aires.",
    ["death.npc.one"] = "Te ha matado un",
    ["death.npc.generic"] = "."
  });

  -- Portuguese
  GTAVDS:AddLanguage("pt", "Portugues", {
    ["wasted.default"] = "se fodeu",
    ["death.weapon.generic"] = "matou você.",
    ["death.weapon.pistol"] = "atirou em você até a morte.",
    ["death.weapon.smg"] = "metralhou você.",
    ["death.weapon.rifle"] = "atirou em você até a morte.",
    ["death.weapon.shotgun"] = "encheu você de azeitona.",
    ["death.weapon.explosion"] = "explodiu você.",
    ["death.weapon.bolt"] = "abriu um buraco em você.",
    ["death.suicide"] = "Você cometeu suicídio.",
    ["death.generic"] = "Você morreu.",
    ["death.vehicle"] = "atropelou você.",
    ["death.explosion"] = "Você explodiu.",
    ["death.npc.one"] = "Um",
    ["death.npc.generic"] = "matou você."
  });

  -- French
  GTAVDS:AddLanguage("fr", "Français", {
    ["wasted.default"] = "Vous êtes mort",
    ["death.weapon.generic"] = "vous a tué.",
		["death.weapon.pistol"] = "vous a tué un pistolet.",
		["death.weapon.smg"] = "vous a tué avec un pistolet-mitralleur.",
		["death.weapon.rifle"] = "vous a tué avec un fusil d'assaut.",
		["death.weapon.shotgun"] = "Vous a tué avec un fusil à pompe.",
		["death.weapon.explosion"] = "vous a explosé avec un explosif.",
		["death.weapon.bolt"] = "vous a tué avec un(e) arme de précision.",
		["death.suicide"] = "Vous vous êtes suicidé(e).",
		["death.generic"] = "Vous êtes mort.",
		["death.vehicle"] = "vous a écraser avec un vehicule.",
		["death.explosion"] = "vous vous êtes fais exploser.",
		["death.npc.one"] = "Un(e)",
		["death.npc.generic"] = "vous a tuer."
  });

end
