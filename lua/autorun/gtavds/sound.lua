--[[----------------------------------------------------
  SOUND
  Play the iconic sound
]]------------------------------------------------------

if CLIENT then

  -- Parameters
  local DELAY = 0.2;
  local SOUND = "gtavds/legacy_sound.wav";
  local NEW_SOUND = "gtavds/nextgen_sound.wav";
  local MP_SOUND = "gtavds/mp_sound.wav";

  -- Precache sounds
  util.PrecacheSound(SOUND);
  util.PrecacheSound(NEW_SOUND);
  util.PrecacheSound(MP_SOUND);

  -- Variables
  local lastSound = nil; -- The last soundfile played
  local sound = nil; -- The actual sound entity
  local delay = 0; -- Sound play delay

  --[[
    Which sound should be played?
    @param {boolean} is next gen
    @return {string} sound file
  ]]
  local function GetSound(isNextGen)
    if (game.SinglePlayer()) then
      if (isNextGen) then
        return NEW_SOUND;
      else
        return SOUND;
      end
    else
      return MP_SOUND;
    end
  end

  --[[
    Plays the sound on death, cancels it out if alive
    @param {boolean} is next gen
  ]]
  function GTAVDS:PlaySound(isNextGen)
    if (LocalPlayer():Alive()) then delay = RealTime() + DELAY; GTAVDS:StopSound(); return; end
    if (not GTAVDS:ShouldSoundPlay()) then return; end
    local curSound = GetSound(isNextGen);
    if (sound == nil or lastSound ~= curSound) then -- Initialize sound if nil
      sound = CreateSound(LocalPlayer(), curSound);
      lastSound = curSound;
    end
    if (not sound:IsPlaying() and GTAVDS:SoundEnabled()) then
      sound:Play();
    end
  end

  --[[
    Stops the sound from playing
    @void
  ]]
  function GTAVDS:StopSound()
    if (sound ~= nil and sound:IsPlaying()) then sound:Stop(); end
  end

  --[[
    Whether the sound delay is over
    @return {boolean} should play
  ]]
  function GTAVDS:ShouldSoundPlay()
    return delay < RealTime();
  end

end
