--[[

	BACKGROUND MUSIC IGC MODULE

]]--

-- localized global calls
local FMainMenu = FMainMenu
local tonumber = tonumber
local string_find = string.find
local string_Replace = string.Replace
local surface_PlaySound = CLIENT and surface.PlaySound

FMainMenu.ConfigModules = FMainMenu.ConfigModules || {}

local propertyCode = 26
local configPropList = {"musicToggle","musicLooping","musicVolume","musicFade","musicContent"}

FMainMenu.ConfigModules[propertyCode] = {}
FMainMenu.ConfigModules[propertyCode].previewLevel = 3
FMainMenu.ConfigModules[propertyCode].category = 2
FMainMenu.ConfigModules[propertyCode].propName = FMainMenu.GetPhrase("ConfigPropertiesMusicPropName")
FMainMenu.ConfigModules[propertyCode].liveUpdate = true

-- Creates the property editing panel
FMainMenu.ConfigModules[propertyCode].GeneratePanel = function(configSheet)
	--Property Panel Setup
	local mainPropPanel = FMainMenu.ConfigModulesHelper.generatePropertyHeader(FMainMenu.GetPhrase("ConfigPropertiesMusicPropName"), FMainMenu.GetPhrase("ConfigPropertiesMusicPropDesc"))

	-- music toggle
	mainPropPanel.toggleOption = FMainMenu.ConfigModulePanels.createComboBox(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesMusicTypeLabel"), FMainMenu.GetPhrase("ConfigCommonValueDisabled"))
	mainPropPanel.toggleOption:AddChoice( FMainMenu.GetPhrase("ConfigPropertiesMusicTypeOptionOneLabel") )
	mainPropPanel.toggleOption:AddChoice( FMainMenu.GetPhrase("ConfigPropertiesMusicTypeOptionTwoLabel") )

	-- loop music toggle
	mainPropPanel.loopOption = FMainMenu.ConfigModulePanels.createComboBox(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesMusicLoopLabel"), FMainMenu.GetPhrase("ConfigCommonValueEnabled"))
	mainPropPanel.loopOption:AddChoice( FMainMenu.GetPhrase("ConfigCommonValueDisabled") )

	-- music volume
	mainPropPanel.textBox = FMainMenu.ConfigModulePanels.createLabelBoxComboSmall(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesMusicVolumeLabel"), true)

	-- music fade
	mainPropPanel.fadeBox = FMainMenu.ConfigModulePanels.createLabelBoxComboSmall(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesMusicFadeLabel"), true)

	-- music content
	mainPropPanel.contentBox, mainPropPanel.contentLabel = FMainMenu.ConfigModulePanels.createLabelBoxComboLarge(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesMusicSelectLabel"))

	-- File Selector Button
	mainPropPanel.audioFileChooseButton = FMainMenu.ConfigModulePanels.createTextButtonLarge(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesMusicButtonLabel"))
	mainPropPanel.audioFileChooseButton:SetVisible(false)
	mainPropPanel.audioFileChooseButton.DoClick = function(button)
		surface_PlaySound("garrysmod/ui_click.wav")
		FMainMenu.ConfigModulesHelper.doSoundSelection(mainPropPanel.contentBox, mainPropPanel.textBox)
	end

	return {configPropList, mainPropPanel}
end

-- Determines whether the local property settings differ from the servers, meaning the user has changed it
FMainMenu.ConfigModules[propertyCode].isVarChanged = function()
	local parentPanel = FMainMenu.configPropertyWindow.currentProp

	local serverVar = ""
	if parentPanel.lastRecVariable[1] == 1 then
		serverVar = FMainMenu.GetPhrase("ConfigPropertiesMusicTypeOptionOneLabel")
	elseif parentPanel.lastRecVariable[1] == 2 then
		serverVar = FMainMenu.GetPhrase("ConfigPropertiesMusicTypeOptionTwoLabel")
	else
		serverVar = FMainMenu.GetPhrase("ConfigCommonValueDisabled")
	end

	if parentPanel.toggleOption:GetText() != serverVar then
		return true
	end

	serverVar = ""
	if parentPanel.lastRecVariable[2] then
		serverVar = FMainMenu.GetPhrase("ConfigCommonValueEnabled")
	else
		serverVar = FMainMenu.GetPhrase("ConfigCommonValueDisabled")
	end

	if parentPanel.loopOption:GetText() != serverVar then
		return true
	end

	if tonumber(parentPanel.textBox:GetText()) != parentPanel.lastRecVariable[3] then
		return true
	end

	if tonumber(parentPanel.fadeBox:GetText()) != parentPanel.lastRecVariable[4] then
		return true
	end

	if parentPanel.contentBox:GetText() != parentPanel.lastRecVariable[5] then
		return true
	end

	return false
end

-- Updates necessary live preview options
FMainMenu.ConfigModules[propertyCode].updatePreview = function()
	local parentPanel = FMainMenu.configPropertyWindow.currentProp
	local previewCopy = FMainMenu.ConfigPreview.previewCopy

	-- Dropbox Link Patch
	local curContentLink = parentPanel.contentBox:GetText()
	if string_find(curContentLink, "dropbox") != nil then
		parentPanel.contentBox:SetText(string_Replace(curContentLink, "?dl=0", "?dl=1"))
	end

	if tonumber(parentPanel.textBox:GetText()) == nil then return true end
	if tonumber(parentPanel.textBox:GetText()) > 1 then
		parentPanel.textBox:SetText(1.0)
	elseif tonumber(parentPanel.textBox:GetText()) < 0 then
		parentPanel.textBox:SetText(0.0)
	end

	if tonumber(parentPanel.fadeBox:GetText()) == nil then return true end
	if tonumber(parentPanel.fadeBox:GetText()) < 0 then
		parentPanel.fadeBox:SetText(0)
	end

	if parentPanel.toggleOption:GetValue() == FMainMenu.GetPhrase("ConfigPropertiesMusicTypeOptionOneLabel") then
		previewCopy["_" .. configPropList[1]] = 1
		parentPanel.contentBox:SetVisible(true)
		parentPanel.contentLabel:SetVisible(true)
		parentPanel.audioFileChooseButton:SetVisible(true)
	elseif parentPanel.toggleOption:GetValue() == FMainMenu.GetPhrase("ConfigPropertiesMusicTypeOptionTwoLabel") then
		previewCopy["_" .. configPropList[1]] = 2
		parentPanel.contentBox:SetVisible(true)
		parentPanel.contentLabel:SetVisible(true)
		parentPanel.audioFileChooseButton:SetVisible(false)
	else
		previewCopy["_" .. configPropList[1]] = 0
		parentPanel.contentBox:SetVisible(false)
		parentPanel.contentLabel:SetVisible(false)
		parentPanel.audioFileChooseButton:SetVisible(false)
	end

	if parentPanel.loopOption:GetValue() == FMainMenu.GetPhrase("ConfigCommonValueEnabled") then
		previewCopy["_" .. configPropList[2]] = true
	else
		previewCopy["_" .. configPropList[2]] = false
	end

	previewCopy["_" .. configPropList[3]] = tonumber(parentPanel.textBox:GetText())
	previewCopy["_" .. configPropList[4]] = tonumber(parentPanel.fadeBox:GetText())
	previewCopy["_" .. configPropList[5]] = parentPanel.contentBox:GetText()
end

-- Called when property is closed, allows for additional clean up if needed
FMainMenu.ConfigModules[propertyCode].onClosePropFunc = function()
	FMainMenu.ConfigModulesHelper.closeOpenExtraWindows()
end

-- Handles saving changes to a property
FMainMenu.ConfigModules[propertyCode].saveFunc = function()
	local parentPanel = FMainMenu.configPropertyWindow.currentProp

	if tonumber(parentPanel.textBox:GetText()) == nil then return true end
	if tonumber(parentPanel.fadeBox:GetText()) == nil then return true end

	if parentPanel.toggleOption:GetValue() == FMainMenu.GetPhrase("ConfigPropertiesMusicTypeOptionOneLabel") then
		parentPanel.lastRecVariable[1] = 1
	elseif parentPanel.toggleOption:GetValue() == FMainMenu.GetPhrase("ConfigPropertiesMusicTypeOptionTwoLabel") then
		parentPanel.lastRecVariable[1] = 2
	elseif parentPanel.toggleOption:GetValue() == FMainMenu.GetPhrase("ConfigCommonValueDisabled") then
		parentPanel.lastRecVariable[1] = 0
	else
		return true
	end

	if parentPanel.loopOption:GetValue() == FMainMenu.GetPhrase("ConfigCommonValueEnabled") then
		parentPanel.lastRecVariable[2] = true
	elseif parentPanel.loopOption:GetValue() == FMainMenu.GetPhrase("ConfigCommonValueDisabled") then
		parentPanel.lastRecVariable[2] = false
	else
		return true
	end

	parentPanel.lastRecVariable[3] = tonumber(parentPanel.textBox:GetText())
	parentPanel.lastRecVariable[4] = tonumber(parentPanel.fadeBox:GetText())
	parentPanel.lastRecVariable[5] = parentPanel.contentBox:GetText()

	FMainMenu.ConfigModulesHelper.updateVariables(parentPanel.lastRecVariable, configPropList)
end

-- Called when the current values are being overwritten by the server
FMainMenu.ConfigModules[propertyCode].varFetch = function(receivedVarTable)
	local parentPanel = FMainMenu.configPropertyWindow.currentProp

	if receivedVarTable[1] == 2 then
		parentPanel.toggleOption:SetValue(FMainMenu.GetPhrase("ConfigPropertiesMusicTypeOptionTwoLabel"))
	elseif receivedVarTable[1] == 1 then
		parentPanel.toggleOption:SetValue(FMainMenu.GetPhrase("ConfigPropertiesMusicTypeOptionOneLabel"))
	else
		parentPanel.toggleOption:SetValue(FMainMenu.GetPhrase("ConfigCommonValueDisabled"))
	end

	if receivedVarTable[2] then
		parentPanel.loopOption:SetValue(FMainMenu.GetPhrase("ConfigCommonValueEnabled"))
	else
		parentPanel.loopOption:SetValue(FMainMenu.GetPhrase("ConfigCommonValueDisabled"))
	end

	parentPanel.textBox:SetText(receivedVarTable[3])
	parentPanel.fadeBox:SetText(receivedVarTable[4])
	parentPanel.contentBox:SetText(receivedVarTable[5])
end

-- Called when the player wishes to reset the property values to those of the server
FMainMenu.ConfigModules[propertyCode].revertFunc = function()
	return configPropList
end