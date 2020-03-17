--[[----------------------------------------------------
  CONFIGURATION
  Tweakable parameters to customize the addon
]]------------------------------------------------------

if SERVER then

  -- Parameters
  local SLOWMO = "sv_gtavds_slowmo";

  -- ConVars
  local slowmo = CreateConVar(SLOWMO, 1, {FCVAR_LUA_SERVER, FCVAR_ARCHIVE}, "Enables slow-motion on singleplayer after dying." );

  --[[
    Whether the slow-motion is enabled
    @return {boolean} slowmo enabled
  ]]
  function GTAVDS:IsSlowmoEnabled()
    return slowmo:GetInt() >= 1 and (game.SinglePlayer() and player.GetByID(1):GetInfoNum("cl_gtavds_enabled", 1) >= 1);
  end

end

if CLIENT then

  -- Parameters
  local ENABLED, ENABLED_DEFAULT = "cl_gtavds_enabled", 1;
  local LANGUAGE, LANGUAGE_DEFAULT = "cl_gtavds_language", "en";
  local USE_CUSTOM, USE_CUSTOM_DEFAULT = "cl_gtavds_custom_enabled", 0;
  local CUSTOM, CUSTOM_DEFAULT = "cl_gtavds_custom", "wasted";
  local NG, NG_DEFAULT = "cl_gtavds_ng", 0;
  local SOUND, SOUND_DEFAULT = "cl_gtavds_sound", 1;
  local SLOWMO, SLOWMO_DEFAULT = "sv_gtavds_slowmo", 1;

  -- ConVars
  local enabled = CreateClientConVar(ENABLED, ENABLED_DEFAULT, true, true);
  local language = CreateClientConVar(LANGUAGE, LANGUAGE_DEFAULT, true);
  local useCustom = CreateClientConVar(USE_CUSTOM, USE_CUSTOM_DEFAULT, true);
  local custom = CreateClientConVar(CUSTOM, CUSTOM_DEFAULT, true);
  local sound = CreateClientConVar(SOUND, SOUND_DEFAULT, true);
  local nextGen = CreateClientConVar(NG, NG_DEFAULT, true);

  --[[
    Is the addon enabled?
    @return {boolean} is enabled
  ]]
  function GTAVDS:IsEnabled()
    return enabled:GetInt() >= 1;
  end

  --[[
    Gets the currently used language
    @return {string} language
  ]]
  function GTAVDS:GetCurrentLanguage()
    return language:GetString();
  end

  --[[
    Is using custom text for the 'wasted' label?
    @return {boolean} uses custom text
  ]]
  function GTAVDS:IsUsingCustomText()
    return useCustom:GetInt() >= 1;
  end

  --[[
    Gets the custom text being used
    @return {string} custom text
  ]]
  function GTAVDS:GetCustomText()
    return custom:GetString();
  end

  --[[
    Is sound enabled?
    @return {boolean} sound enabled
  ]]
  function GTAVDS:SoundEnabled()
    return sound:GetInt() >= 1;
  end

  --[[
    Is using next-gen screen on singleplayer?
    @return {boolean} is next gen
  ]]
  function GTAVDS:IsNextGen()
    return nextGen:GetInt() >= 1;
  end

  --[[
    Resets the settings
  ]]
  concommand.Add("cl_gtavds_reset", function(ply, com, args)
    RunConsoleCommand(ENABLED, ENABLED_DEFAULT);
    RunConsoleCommand(LANGUAGE, LANGUAGE_DEFAULT);
    RunConsoleCommand(USE_CUSTOM, USE_CUSTOM_DEFAULT);
    RunConsoleCommand(CUSTOM, CUSTOM_DEFAULT);
    RunConsoleCommand(SOUND, SOUND_DEFAULT);
    RunConsoleCommand(NG, NG_DEFAULT);
    RunConsoleCommand(SLOWMO, SLOWMO_DEFAULT);
  end);

end
