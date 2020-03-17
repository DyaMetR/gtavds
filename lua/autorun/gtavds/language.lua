--[[----------------------------------------------------
  LANGUAGE
  Translable strings
]]------------------------------------------------------

if CLIENT then

  -- Parameters
  local DEFAULT_LANGUAGE = "en";

  -- Languages
  local languages = {};

  --[[
    Adds a language to the list
    @param {string} identifier
    @param {string} name
    @param {table} string table
  ]]
  function GTAVDS:AddLanguage(id, name, data)
    languages[id] = {name = name, data = data};
  end

  --[[
    Returns the available languages
    @return {table} languages
  ]]
  function GTAVDS:GetLanguages()
    return languages;
  end

  --[[
    Adds a string for a specific language
    @return {string} string identifier
    @return {string} string value
    @return {string} language identifier
    @return {string|nil} language name
  ]]
  function GTAVDS:AddString(string, value, language, name)
    if (name == nil) then name = languages; end
    if (languages[language] == nil) then languages[language] = {name = name, data = {}}; end
    languages[language].data[string] = value;
  end

  --[[
    Returns the string from the given language
    @param {string} string
    @param {string|null} language identifier
    @return {string} string
  ]]
  function GTAVDS:GetString(string, language)
    language = language or GTAVDS:GetCurrentLanguage();
    if (languages[language] == nil) then language = DEFAULT_LANGUAGE; end
    if (languages[language].data[string] == nil) then return string; end
    return languages[language].data[string];
  end

  --[[
    Gets the 'wasted' label based on configuration
    @param {string|null} language
    @return {string} 'wasted' label to use
  ]]
  function GTAVDS:GetWastedLabel(language)
    if (GTAVDS:IsUsingCustomText()) then return GTAVDS:GetCustomText(); end
    return GTAVDS:GetString("wasted.default", language);
  end

end
