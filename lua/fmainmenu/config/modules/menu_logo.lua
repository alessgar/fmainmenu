--[[

	LOGO IGC MODULE

]]--

local FMainMenu = FMainMenu

FMainMenu.ConfigModules = FMainMenu.ConfigModules || {}

local propertyCode = 23
local configPropList = {"logoIsText","logoContent","logoImageScaleX","logoImageScaleY","logoImageKeppAspectRatio","logoImageScaleAL"}

FMainMenu.ConfigModules[propertyCode] = {}
FMainMenu.ConfigModules[propertyCode].previewLevel = 1
FMainMenu.ConfigModules[propertyCode].category = 2
FMainMenu.ConfigModules[propertyCode].propName = FMainMenu.GetPhrase("ConfigPropertiesLogoPropName")
FMainMenu.ConfigModules[propertyCode].liveUpdate = true

-- Creates the property editing panel
FMainMenu.ConfigModules[propertyCode].GeneratePanel = function(configSheet)
	--Property Panel Setup
	local mainPropPanel = FMainMenu.ConfigModulesHelper.generatePropertyHeader(FMainMenu.GetPhrase("ConfigPropertiesLogoPropName"), FMainMenu.GetPhrase("ConfigPropertiesLogoPropDesc"))

	-- logo type selection
	mainPropPanel.toggleOption = FMainMenu.ConfigModulePanels.createComboBox(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesLogoLabel"), FMainMenu.GetPhrase("ConfigPropertiesLogoSelectOne"))
	mainPropPanel.toggleOption:AddChoice( FMainMenu.GetPhrase("ConfigPropertiesLogoSelectTwo") )

	-- logo content box
	mainPropPanel.contentBox = FMainMenu.ConfigModulePanels.createLabelBoxComboLarge(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesLogoContentLabel"))

	-- maintain image scale aspect ratio
	mainPropPanel.scaleRatioCBox, mainPropPanel.scaleRatioCBoxLabel = FMainMenu.ConfigModulePanels.createCheckBoxCombo(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesLogoImageRatioLock"), false, true)
	mainPropPanel.scaleRatioCBox:SetVisible(false)
	mainPropPanel.scaleRatioCBoxLabel:SetVisible(false)

	-- logo image scale box (for locked aspect ratio)
	mainPropPanel.scaleBoxAL, mainPropPanel.scaleLabelAL = FMainMenu.ConfigModulePanels.createLabelBoxComboSmall(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesLogoImageScaleLocked"), true)
	mainPropPanel.scaleBoxAL:SetVisible(false)
	mainPropPanel.scaleLabelAL:SetVisible(false)

	mainPropPanel.tempYPos = mainPropPanel.tempYPos - 18

	-- logo image scale box (x axis)
	mainPropPanel.scaleBoxX, mainPropPanel.scaleLabelX = FMainMenu.ConfigModulePanels.createLabelBoxComboSmall(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesLogoImageScaleX"), true)
	mainPropPanel.scaleBoxX:SetVisible(false)
	mainPropPanel.scaleLabelX:SetVisible(false)

	-- logo image scale box (y axis)
	mainPropPanel.scaleBoxY, mainPropPanel.scaleLabelY = FMainMenu.ConfigModulePanels.createLabelBoxComboSmall(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesLogoImageScaleY"), true)
	mainPropPanel.scaleBoxY:SetVisible(false)
	mainPropPanel.scaleLabelY:SetVisible(false)

	return {configPropList, mainPropPanel}
end

-- Determines whether the local property settings differ from the servers, meaning the user has changed it
FMainMenu.ConfigModules[propertyCode].isVarChanged = function()
	local parentPanel = FMainMenu.configPropertyWindow.currentProp

	local serverVar = ""
	if parentPanel.lastRecVariable[1] then
		serverVar = FMainMenu.GetPhrase("ConfigPropertiesLogoSelectOne")
	else
		serverVar = FMainMenu.GetPhrase("ConfigPropertiesLogoSelectTwo")
	end

	if serverVar != parentPanel.toggleOption:GetText() then
		return true
	end

	if parentPanel.lastRecVariable[2] != parentPanel.contentBox:GetText() then
		return true
	end

	if parentPanel.lastRecVariable[3] * 100 != tonumber(parentPanel.scaleBoxX:GetText()) then
		return true
	end

	if parentPanel.lastRecVariable[4] * 100 != tonumber(parentPanel.scaleBoxY:GetText()) then
		return true
	end

	if parentPanel.lastRecVariable[5] != parentPanel.scaleRatioCBox:GetChecked() then
		return true
	end

	if parentPanel.lastRecVariable[6] * 100 != tonumber(parentPanel.scaleBoxAL:GetText()) then
		return true
	end

	return false
end

-- Updates necessary live preview options
FMainMenu.ConfigModules[propertyCode].updatePreview = function()
	local parentPanel = FMainMenu.configPropertyWindow.currentProp
	local previewCopy = FMainMenu.ConfigPreview.previewCopy

	if tonumber(parentPanel.scaleBoxX:GetText()) == nil then return true end
	if tonumber(parentPanel.scaleBoxY:GetText()) == nil then return true end
	if tonumber(parentPanel.scaleBoxAL:GetText()) == nil then return true end

	-- HTML boxes are super expensive when scaled too high
	if tonumber(parentPanel.scaleBoxX:GetText()) > 500 then
		parentPanel.scaleBoxX:SetText(500)
	elseif tonumber(parentPanel.scaleBoxX:GetText()) < 0 then
		parentPanel.scaleBoxX:SetText(0)
	end

	if tonumber(parentPanel.scaleBoxY:GetText()) > 500 then
		parentPanel.scaleBoxY:SetText(500)
	elseif tonumber(parentPanel.scaleBoxY:GetText()) < 0 then
		parentPanel.scaleBoxY:SetText(0)
	end

	if tonumber(parentPanel.scaleBoxAL:GetText()) > 500 then
		parentPanel.scaleBoxAL:SetText(500)
	elseif tonumber(parentPanel.scaleBoxAL:GetText()) < 0 then
		parentPanel.scaleBoxAL:SetText(0)
	end

	if parentPanel.toggleOption:GetValue() == FMainMenu.GetPhrase("ConfigPropertiesLogoSelectOne") then
		previewCopy["_" .. configPropList[1]] = true
	elseif parentPanel.toggleOption:GetValue() == FMainMenu.GetPhrase("ConfigPropertiesLogoSelectTwo") then
		previewCopy["_" .. configPropList[1]] = false
	else
		return
	end

	if parentPanel.toggleOption:GetValue() != FMainMenu.GetPhrase("ConfigPropertiesLogoSelectTwo") then
		parentPanel.scaleRatioCBox:SetVisible(false)
		parentPanel.scaleRatioCBoxLabel:SetVisible(false)
		parentPanel.scaleBoxAL:SetVisible(false)
		parentPanel.scaleLabelAL:SetVisible(false)
		parentPanel.scaleBoxX:SetVisible(false)
		parentPanel.scaleLabelX:SetVisible(false)
		parentPanel.scaleBoxY:SetVisible(false)
		parentPanel.scaleLabelY:SetVisible(false)
	else
		parentPanel.scaleRatioCBox:SetVisible(true)
		parentPanel.scaleRatioCBoxLabel:SetVisible(true)

		if parentPanel.scaleRatioCBox:GetChecked() then
			parentPanel.scaleBoxAL:SetVisible(true)
			parentPanel.scaleLabelAL:SetVisible(true)
			parentPanel.scaleBoxX:SetVisible(false)
			parentPanel.scaleLabelX:SetVisible(false)
			parentPanel.scaleBoxY:SetVisible(false)
			parentPanel.scaleLabelY:SetVisible(false)
		else
			parentPanel.scaleBoxAL:SetVisible(false)
			parentPanel.scaleLabelAL:SetVisible(false)
			parentPanel.scaleBoxX:SetVisible(true)
			parentPanel.scaleLabelX:SetVisible(true)
			parentPanel.scaleBoxY:SetVisible(true)
			parentPanel.scaleLabelY:SetVisible(true)
		end
	end

	previewCopy["_" .. configPropList[2]] = parentPanel.contentBox:GetText()
	previewCopy["_" .. configPropList[3]] = tonumber(parentPanel.scaleBoxX:GetText()) / 100
	previewCopy["_" .. configPropList[4]] = tonumber(parentPanel.scaleBoxY:GetText()) / 100
	previewCopy["_" .. configPropList[5]] = parentPanel.scaleRatioCBox:GetChecked()
	previewCopy["_" .. configPropList[6]] = tonumber(parentPanel.scaleBoxAL:GetText()) / 100
end

-- Called when property is closed, allows for additional clean up if needed
FMainMenu.ConfigModules[propertyCode].onClosePropFunc = function() end

-- Handles saving changes to a property
FMainMenu.ConfigModules[propertyCode].saveFunc = function()
	local parentPanel = FMainMenu.configPropertyWindow.currentProp

	if tonumber(parentPanel.scaleBoxX:GetText()) == nil then return end
	if tonumber(parentPanel.scaleBoxY:GetText()) == nil then return end
	if tonumber(parentPanel.scaleBoxAL:GetText()) == nil then return true end

	if parentPanel.toggleOption:GetValue() == FMainMenu.GetPhrase("ConfigPropertiesLogoSelectOne") then
		parentPanel.lastRecVariable[1] = true
	elseif parentPanel.toggleOption:GetValue() == FMainMenu.GetPhrase("ConfigPropertiesLogoSelectTwo") then
		parentPanel.lastRecVariable[1] = false
	else
		return true
	end

	parentPanel.lastRecVariable[2] = parentPanel.contentBox:GetText()
	parentPanel.lastRecVariable[3] = tonumber(parentPanel.scaleBoxX:GetText()) / 100
	parentPanel.lastRecVariable[4] = tonumber(parentPanel.scaleBoxY:GetText()) / 100
	parentPanel.lastRecVariable[5] = parentPanel.scaleRatioCBox:GetChecked()
	parentPanel.lastRecVariable[6] = tonumber(parentPanel.scaleBoxAL:GetText()) / 100

	FMainMenu.ConfigModulesHelper.updateVariables(parentPanel.lastRecVariable, configPropList)
end

-- Called when the current values are being overwritten by the server
FMainMenu.ConfigModules[propertyCode].varFetch = function(receivedVarTable)
	local parentPanel = FMainMenu.configPropertyWindow.currentProp

	if receivedVarTable[1] then
		parentPanel.toggleOption:SetValue(FMainMenu.GetPhrase("ConfigPropertiesLogoSelectOne"))
	else
		parentPanel.toggleOption:SetValue(FMainMenu.GetPhrase("ConfigPropertiesLogoSelectTwo"))
	end

	parentPanel.contentBox:SetText(receivedVarTable[2])
	parentPanel.scaleBoxX:SetText(receivedVarTable[3] * 100)
	parentPanel.scaleBoxY:SetText(receivedVarTable[4] * 100)
	parentPanel.scaleRatioCBox:SetChecked(receivedVarTable[5])
	parentPanel.scaleBoxAL:SetText(receivedVarTable[6] * 100)

	if receivedVarTable[1] then
		parentPanel.scaleRatioCBox:SetVisible(false)
		parentPanel.scaleRatioCBoxLabel:SetVisible(false)
		parentPanel.scaleBoxAL:SetVisible(false)
		parentPanel.scaleLabelAL:SetVisible(false)
		parentPanel.scaleBoxX:SetVisible(false)
		parentPanel.scaleLabelX:SetVisible(false)
		parentPanel.scaleBoxY:SetVisible(false)
		parentPanel.scaleLabelY:SetVisible(false)
	else
		parentPanel.scaleRatioCBox:SetVisible(true)
		parentPanel.scaleRatioCBoxLabel:SetVisible(true)

		if receivedVarTable[5] then
			parentPanel.scaleBoxAL:SetVisible(true)
			parentPanel.scaleLabelAL:SetVisible(true)
			parentPanel.scaleBoxX:SetVisible(false)
			parentPanel.scaleLabelX:SetVisible(false)
			parentPanel.scaleBoxY:SetVisible(false)
			parentPanel.scaleLabelY:SetVisible(false)
		else
			parentPanel.scaleBoxAL:SetVisible(false)
			parentPanel.scaleLabelAL:SetVisible(false)
			parentPanel.scaleBoxX:SetVisible(true)
			parentPanel.scaleLabelX:SetVisible(true)
			parentPanel.scaleBoxY:SetVisible(true)
			parentPanel.scaleLabelY:SetVisible(true)
		end
	end
end

-- Called when the player wishes to reset the property values to those of the server
FMainMenu.ConfigModules[propertyCode].revertFunc = function()
	return configPropList
end