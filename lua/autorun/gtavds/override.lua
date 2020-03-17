--[[----------------------------------------------------
  OVERRIDE
  Allows the effect to fade away after some seconds
  based on the gamemode being played on
]]------------------------------------------------------

if CLIENT then

  -- Parameters
  local TIME = 8;

  -- Gamemode list
  local gamemodes = {};

  -- Variables
  local time = 0;

  --[[
    Adds a gamemode to the tray
    @param {string} gamemode
  ]]
  function GTAVDS:AddGamemodeOverride(gamemode)
    gamemodes[gamemode] = true;
  end

  --[[
    Is the current instance overriden?
    @return {boolean} overriden
  ]]
  function GTAVDS:IsOverriden()
    local gm = engine.ActiveGamemode();
    if (gm == nil) then return false; end
    return gamemodes[gm] ~= nil and time < RealTime();
  end

  --[[
    Retains the timer if alive
  ]]
  hook.Add("Think", "cl_gtavds_override", function()
    if (not GTAVDS:IsEnabled()) then return; end
    if (LocalPlayer():Alive()) then time = RealTime() + TIME; end
  end);

end
