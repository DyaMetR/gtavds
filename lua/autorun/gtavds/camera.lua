--[[----------------------------------------------------
  CAMERA
  Manages camera position, angles, and field of view
]]------------------------------------------------------

if CLIENT then

  -- Parameters
  local FOV_MAX = 12;
  local ROTATION = 26;
  local ROT_START_TIME = 0.74;
  local ROT_STOP_TIME = 2;
  local ROT_STOP_TIME_MP = 6;
  local VERTICAL = 5;
  local DISTANCE = 60;

  -- Variables
  local rot = 0;
  local tilt = false;
  local fov;
  local time = 0;
  local tick = 0;
  local tickRot = 0;
  local vert = 0;

  --[[
    Resets camera animation variables
    @void
  ]]
  local function ResetCamData()
    rot = 0;
    fov = nil;
    tilt = false;
    time = RealTime() + ROT_START_TIME;
    vert = 0;
  end

  --[[
    Moves the camera according to the death animation status
  ]]
  hook.Add("CalcView", "gtavds_camera", function(player, origin, angles, dFov, znear, zfar )
    if (LocalPlayer():Alive() or not GTAVDS:IsEnabled() or GTAVDS:IsOverriden()) then ResetCamData(); return; end

    -- Camera fov
    if (not fov) then fov = dFov; end
    if (game.SinglePlayer()) then -- Singleplayer animation
      if (not GTAVDS:HasAnimationEnded()) then
        fov = Lerp(RealFrameTime() * 10, fov, math.max(dFov - FOV_MAX * GTAVDS:GetBloomAnimation(), 0));
      else
        fov = Lerp(RealFrameTime() * 0.4, fov, math.max(dFov + FOV_MAX));
      end
    elseif (not game.SinglePlayer() and GTAVDS:ShouldSoundPlay()) then -- Multiplayer animation
      fov = Lerp(RealFrameTime() * 10, fov, math.max(dFov - FOV_MAX, 0));
    end

    -- Camera rotation
    if (game.SinglePlayer()) then -- Singleplayer animation
      if (GTAVDS:HasAnimationEnded() and GTAVDS:GetBloomAnimation() >= 1) then
        if (not tilt) then time = RealTime() + ROT_STOP_TIME; rot = 1; tilt = true; end
        if (time < RealTime()) then
          rot = Lerp(RealFrameTime() * 0.1, rot, 0);
        end
      else
        if (time < RealTime()) then
          if (tickRot < CurTime()) then
            rot = math.min(rot + 0.001, 1);
            tickRot = CurTime() + 0.001;
          end
        end
      end
    else -- Multiplayer animation
      if (not GTAVDS:HasAnimationEnded()) then
        time = RealTime() + ROT_STOP_TIME_MP;
      end

      if (time > RealTime()) then
        rot = Lerp(RealFrameTime() * 0.34, rot, 1);
      else
        rot = Lerp(RealFrameTime() * 0.24, rot, 0);
      end
    end

    -- Camera repositioning
    if (tick < RealTime()) then
      vert = vert + 0.014 * rot;
      tick = CurTime() + 0.001;
    end

    -- Build view data
    local view = {};
  	view.origin = origin + (angles:Up() * 20);
  	view.angles = Angle(angles.p + (VERTICAL * (math.sin(vert) + 1)) + 10, angles.y, angles.r + (ROTATION * rot));
  	view.fov = fov;

	   return view;
  end);

end
