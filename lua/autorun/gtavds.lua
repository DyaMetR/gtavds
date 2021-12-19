--[[-------------------
  Grand Theft Auto V
    Death screen
    Version 2.0.7
     19/12/2021

By DyaMetR
]]---------------------

-- Framework table
GTAVDS = {};
GTAVDS.Version = "2.0.7";

--[[
  Correctly includes a file
  @param {string} file
  @void
]]--
function GTAVDS:IncludeFile(file)
  if SERVER then
    include(file);
    AddCSLuaFile(file);
  end
  if CLIENT then
    include(file);
  end
end

-- Include components
GTAVDS:IncludeFile("gtavds/config/config.lua");
GTAVDS:IncludeFile("gtavds/config/menu.lua");
GTAVDS:IncludeFile("gtavds/override.lua");
GTAVDS:IncludeFile("gtavds/language.lua");
GTAVDS:IncludeFile("gtavds/sound.lua");
GTAVDS:IncludeFile("gtavds/multiplayer.lua");
GTAVDS:IncludeFile("gtavds/singleplayer.lua");
GTAVDS:IncludeFile("gtavds/overlay.lua");
GTAVDS:IncludeFile("gtavds/camera.lua");

-- Default data
GTAVDS:IncludeFile("gtavds/data/languages.lua");
GTAVDS:IncludeFile("gtavds/data/override.lua");

-- Load add-ons
local files, directories = file.Find("autorun/gtavds/add-ons/*.lua", "LUA");
for _, file in pairs(files) do
  GTAVDS:IncludeFile("add-ons/"..file);
end

if CLIENT then
  -- Draw overlay
  hook.Add("HUDPaint", "gtavds_draw", function()
    if (not GTAVDS:IsEnabled() or GTAVDS:IsOverriden()) then return; end
    GTAVDS:PlaySound(GTAVDS:IsNextGen());
    GTAVDS:DrawOverlay();
  end);

  hook.Add("RenderScreenspaceEffects", "gtavds_postprocessing", function()
    if (not GTAVDS:IsEnabled() or GTAVDS:IsOverriden()) then return; end
    GTAVDS:PostProcessing();
  end);

  hook.Add("HUDShouldDraw", "gtavds_hide_hud", function(name)
    if ((LocalPlayer().Alive ~= nil and LocalPlayer():Alive()) or not GTAVDS:IsEnabled() or GTAVDS:IsOverriden()) then return; end
    if (name == "CHudDamageIndicator") then return false; end
  end);
end


if SERVER then

  -- Add resources
  resource.AddFile("sound/gtavds/legacy_sound.wav");
  resource.AddFile("sound/gtavds/mp_sound.wav");
  resource.AddFile("sound/gtavds/nextgen_sound.wav");
  resource.AddFile("materials/gtavds/vignette01.vtf");
  resource.AddFile("materials/gtavds/vignette01.vtm");
  resource.AddFile("resource/fonts/pricedown bl.ttf");
  resource.AddFile("resource/fonts/chaletcomprimecolognesixty.ttf");
  resource.AddFile("resource/fonts/chaletlondonnineteensixty.ttf");

  -- Parameters
  local SLOWMO_INIT_TIME = 0.36;
  local SLOWMO_POST_TIME = 2.1;
  local SLOWMO_PRE = 0.3;
  local SLOWMO_POST = 0.17;
  local OVERRIDE_TIME = 8;

  -- Variables
  local slowmo = false;

  --[[
    Starts the slow-motion sequence
    @singleplayer
  ]]
  hook.Add("PlayerDeath", "gtavds_slowmo_death", function(player, inflictor, killer)
    if (not game.SinglePlayer() or not GTAVDS:IsSlowmoEnabled()) then return; end
    slowmo = true;
    timer.Simple(SLOWMO_INIT_TIME, function() -- Start initial slowmo timer
      if (player:Alive() or not slowmo) then return; end
      game.SetTimeScale(SLOWMO_PRE);
      timer.Simple(SLOWMO_POST_TIME * game.GetTimeScale(), function() -- Starts the post 'wasted' slowmo
        if (player:Alive() or not slowmo) then return; end
        game.SetTimeScale(SLOWMO_POST);
      end);
    end);
  end);

  --[[
    Halts the slow-motion sequence
    @singleplayer
  ]]
  hook.Add("PlayerSpawn", "gtavds_slowmo_halt", function(player)
    if (not game.SinglePlayer()) then return; end
    if (not GTAVDS:IsSlowmoEnabled() and not slowmo) then return; end
    game.SetTimeScale(1);
    slowmo = false;
  end);

  --[[
    Overrides the player's death sound
  ]]
  hook.Add("PlayerDeathSound", "gtavds_deathsound", function()
    return true;
  end);

end
