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
    panel:AddControl( "Label",  { Text = ""});
    panel:AddControl( "Label",  { Text = "Made by DyaMetR"});
    panel:AddControl( "Label",  { Text = "Sounds and concept by Rockstar"});
    panel:AddControl( "Label",  { Text = "Vignette texture base by Rush_Freak"});
    panel:AddControl( "Label",  { Text = "Legacy sound originally ripped by EasterGlitch"});
    panel:AddControl( "Label",  { Text = "Portuguese translation by Vihiper"});
    panel:AddControl( "Label",  { Text = "Version " .. GTAVDS.Version});
  end

  --[[
    Adds the options submenu to the Q menu
  ]]
  local function menuCreation()
  	spawnmenu.AddToolMenuOption( "Options", "DyaMetR", "GTAVDS", "GTA V Death Screen", "", "", menuComposition );
  end
  hook.Add( "PopulateToolMenu", "gtavds_menu", menuCreation );

end
