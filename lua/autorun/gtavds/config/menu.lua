--[[----------------------------------------------------
  MENU
  Configuration menu for the customizable parameters
]]------------------------------------------------------

if CLIENT then

  --[[
    Composes the menu
    @param {Panel} parent panel
  ]]
  local function menuComposition( panel )
  	panel:ClearControls();

    panel:AddControl( "Label",  { Text = "Clientside settings"});

    panel:AddControl( "CheckBox", {
  		Label = "Enabled",
  		Command = "cl_gtavds_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Use custom text",
  		Command = "cl_gtavds_custom_enabled",
  		}
  	);

    panel:AddControl( "TextBox", {
  		Label = "Custom text",
  		Command = "cl_gtavds_custom",
  		}
  	);

    local combobox, label = panel:ComboBox("Language", "cl_gtavds_language");
    for id, language in pairs(GTAVDS:GetLanguages()) do
  		combobox:AddChoice(language.name, id);
    end

    panel:AddControl( "CheckBox", {
  		Label = "Sound enabled",
  		Command = "cl_gtavds_sound",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Greyscaling enabled",
  		Command = "cl_gtavds_greyscale",
  		}
  	);

    panel:AddControl( "Label",  { Text = ""});
    panel:AddControl( "Label",  { Text = "Singleplayer settings"});

    panel:AddControl( "CheckBox", {
  		Label = "Enable PC/XBOX ONE/PS4 version",
  		Command = "cl_gtavds_ng",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Enable slow-motion",
  		Command = "sv_gtavds_slowmo",
  		}
  	);

    panel:AddControl( "Label",  { Text = ""});

    panel:AddControl( "Button", {
  		Label = "Reset to default",
  		Command = "cl_gtavds_reset",
  		}
  	);

    -- Version number and signature
    panel:Help('\nCredits\n');

    panel:Help('Made by');
    panel:ControlHelp('DyaMetR');

    panel:Help('Sounds and concept');
    panel:ControlHelp('Rockstar Games');

    panel:Help('Vignette texture');
    panel:ControlHelp('Rush_Freak');

    panel:Help('Legacy sound original rip');
    panel:ControlHelp('EasterGlitch');

    panel:Help('Portuguese translation');
    panel:ControlHelp('Vihiper');

    panel:Help('French translation');
    panel:ControlHelp('TifykaSpaghetti');

    panel:Help('\nVersion');
    panel:ControlHelp(GTAVDS.Version);
  end

  --[[
    Adds the options submenu to the Q menu
  ]]
  local function menuCreation()
  	spawnmenu.AddToolMenuOption( "Options", "DyaMetR", "GTAVDS", "GTA V Death Screen", "", "", menuComposition );
  end
  hook.Add( "PopulateToolMenu", "gtavds_menu", menuCreation );

end
