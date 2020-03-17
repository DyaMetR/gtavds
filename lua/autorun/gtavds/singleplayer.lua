--[[----------------------------------------------------
  SINGLEPLAYER
  Simply display the 'WASTED' text
]]------------------------------------------------------

if CLIENT then

  -- Parameters
  local DEFAULT_LABEL = "wasted";

  -- Create font
  surface.CreateFont( "gtavds_sp", {
    font = "Pricedown Bl",
    size = ScreenScale(30),
    weight = 500,
    antialias = true,
  });

  surface.CreateFont( "gtavds_sp_ng", {
    font = "Pricedown Bl",
    size = ScreenScale(48),
    weight = 500,
    antialias = true
  });

  --[[
    Draws the 'wasted' label in the middle of the screen
    @param {boolean} is next gen
  ]]
  function GTAVDS:DrawWasted(isNextGen)
    if (isNextGen) then
      GTAVDS:DrawPoly();
      draw.SimpleText(GTAVDS:GetWastedLabel(), "gtavds_sp_ng", ScrW() * 0.5, ScrH() * 0.516, Color(176, 40, 56, 200), 1, 1);
    else
      draw.SimpleTextOutlined(GTAVDS:GetWastedLabel(), "gtavds_sp", ScrW() * 0.5, ScrH() * 0.5, Color(200, 40, 40), 1, 1, 3, Color(0, 0, 0));
    end
  end

end
