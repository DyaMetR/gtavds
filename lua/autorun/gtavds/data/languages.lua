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
    ["wasted.default"] = "vous êtes mort",
    ["death.weapon.generic"] = "vous a tuer.",
    ["death.weapon.pistol"] = "vous a abattu.",
    ["death.weapon.smg"] = "vous a criblé.",
    ["death.weapon.rifle"] = "vous a abattu.",
    ["death.weapon.shotgun"] = "vous a rempli de chevrotine.",
    ["death.weapon.explosion"] = "vous a explosé.",
    ["death.weapon.bolt"] = "vous a déchiré.",
    ["death.suicide"] = "Vous vous êtes suicider.",
    ["death.generic"] = "Vous êtes mort.",
    ["death.vehicle"] = "vous a aplati.",
    ["death.explosion"] = "Vous vous êtes fais exploser.",
    ["death.npc.one"] = "A",
    ["death.npc.generic"] = "vous a tuer."
  });

end
