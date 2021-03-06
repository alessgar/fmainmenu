--[[

	ADVANCED SPAWN IGC MODULE

]]--

local FMainMenu = FMainMenu

-- localized global calls
local LocalPlayer = LocalPlayer
local math_Round = math.Round
local game_GetMap = game.GetMap
local tonumber = tonumber
local table_Copy = table.Copy
local Vector = Vector
local net_Start = net.Start
local net_WriteTable = net.WriteTable
local net_WriteString = net.WriteString
local util_TableToJSON = util.TableToJSON
local net_SendToServer = CLIENT and net.SendToServer
local surface_PlaySound = surface.PlaySound

FMainMenu.ConfigModules = FMainMenu.ConfigModules || {}

local propertyCode = 61
local configPropList = {"AdvancedSpawn","AdvancedSpawnPos"}
local configPropListTwo = {"AdvancedSpawn","AdvancedSpawnPos","CameraPosition","CameraAngle"}

FMainMenu.ConfigModules[propertyCode] = {}
FMainMenu.ConfigModules[propertyCode].previewLevel = 0
FMainMenu.ConfigModules[propertyCode].category = 6
FMainMenu.ConfigModules[propertyCode].propName = FMainMenu.GetPhrase("ConfigPropertiesAdvancedSpawnPropName")
FMainMenu.ConfigModules[propertyCode].liveUpdate = false

-- Creates the property editing panel
FMainMenu.ConfigModules[propertyCode].GeneratePanel = function(configSheet)
	--Property Panel Setup
	local mainPropPanel = FMainMenu.ConfigModulesHelper.generatePropertyHeader(FMainMenu.GetPhrase("ConfigPropertiesAdvancedSpawnPropName"), FMainMenu.GetPhrase("ConfigPropertiesAdvancedSpawnPropDesc"))

	-- Advanced Spawn Toggle
	mainPropPanel.advancedSpawnOption = FMainMenu.ConfigModulePanels.createComboBox(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesAdvancedSpawnOptLabel"), FMainMenu.GetPhrase("ConfigCommonValueDisabled"))
	mainPropPanel.advancedSpawnOption:AddChoice( FMainMenu.GetPhrase("ConfigCommonValueEnabled") )

	--Advanced Spawn Position
	FMainMenu.ConfigModulePanels.createLabel(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesAdvancedSpawnPosLabel"))
	mainPropPanel.cameraPositionPosBoxX = FMainMenu.ConfigModulePanels.createLabelBoxComboSmall(mainPropPanel, FMainMenu.GetPhrase("ConfigCommonValueX"), false)
	mainPropPanel.cameraPositionPosBoxY = FMainMenu.ConfigModulePanels.createLabelBoxComboSmall(mainPropPanel, FMainMenu.GetPhrase("ConfigCommonValueY"), false)
	mainPropPanel.cameraPositionPosBoxZ = FMainMenu.ConfigModulePanels.createLabelBoxComboSmall(mainPropPanel, FMainMenu.GetPhrase("ConfigCommonValueZ"), false)

	-- Helpful function to autofill player's current position
	local cameraPositionChooseButton = FMainMenu.ConfigModulePanels.createTextButtonLarge(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesAdvancedSpawnCaptureLabel"))
	cameraPositionChooseButton.DoClick = function(button)
		local ply = LocalPlayer()
		local plyPOS = ply:GetPos()

		mainPropPanel.cameraPositionPosBoxX:SetText(math_Round( plyPOS.x, 3))
		mainPropPanel.cameraPositionPosBoxY:SetText(math_Round( plyPOS.y, 3))
		mainPropPanel.cameraPositionPosBoxZ:SetText(math_Round( plyPOS.z, 3))

		FMainMenu.ConfigModulesHelper.setUnsaved(FMainMenu.ConfigModules[propertyCode].isVarChanged())
		FMainMenu.ConfigModules[propertyCode].updatePreview()

		surface_PlaySound("garrysmod/content_downloaded.wav")
	end

	-- Provides ability for player to get detailed info on the Advanced Spawn system if needed
	FMainMenu.ConfigModulePanels.createLabelLarge(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesAdvancedSpawnInfoLabel"))
	local informationButton = FMainMenu.ConfigModulePanels.createTextButtonLarge(mainPropPanel, FMainMenu.GetPhrase("ConfigPropertiesAdvancedGeneralInfoButtonLabel"))
	informationButton.DoClick = function(button)
		surface_PlaySound("garrysmod/ui_click.wav")
		FMainMenu.ConfigModulesHelper.doInformationalWindow(FMainMenu.GetPhrase("ConfigPropertiesAdvancedSpawnInfoWindowTitle"), FMainMenu.GetPhrase("ConfigPropertiesAdvancedSpawnInfo"))
	end

	LocalPlayer():SetNoDraw( true )

	return {configPropListTwo, mainPropPanel}
end

-- Determines whether the local property settings differ from the servers, meaning the user has changed it
FMainMenu.ConfigModules[propertyCode].isVarChanged = function()
	local mapName = game_GetMap()
	local parentPanel = FMainMenu.configPropertyWindow.currentProp

	local serverVar = ""
	if parentPanel.lastRecVariable[1] then
		serverVar = FMainMenu.GetPhrase("ConfigCommonValueEnabled")
	else
		serverVar = FMainMenu.GetPhrase("ConfigCommonValueDisabled")
	end

	if parentPanel.advancedSpawnOption:GetValue() != serverVar then
		return true
	end

	if FMainMenu.ConfigModulesHelper.numericTextBoxHasChanges(parentPanel.cameraPositionPosBoxX:GetText(), parentPanel.lastRecVariable[2][mapName].x, 3) then
		return true
	end

	if FMainMenu.ConfigModulesHelper.numericTextBoxHasChanges(parentPanel.cameraPositionPosBoxY:GetText(), parentPanel.lastRecVariable[2][mapName].y, 3) then
		return true
	end

	if FMainMenu.ConfigModulesHelper.numericTextBoxHasChanges(parentPanel.cameraPositionPosBoxZ:GetText(), parentPanel.lastRecVariable[2][mapName].z, 3) then
		return true
	end

	return false
end

-- Updates necessary live preview options
FMainMenu.ConfigModules[propertyCode].updatePreview = function()
	local mapName = game_GetMap()
	local parentPanel = FMainMenu.configPropertyWindow.currentProp

	if tonumber(parentPanel.cameraPositionPosBoxX:GetText()) == nil then return end
	if tonumber(parentPanel.cameraPositionPosBoxY:GetText()) == nil then return end
	if tonumber(parentPanel.cameraPositionPosBoxZ:GetText()) == nil then return end

	local varUpdate = {}
	varUpdate[1] = table_Copy(FMainMenu.ConfigPreview.previewCopy["_CameraPosition"])
	varUpdate[1][mapName] = Vector(tonumber(parentPanel.cameraPositionPosBoxX:GetText()), tonumber(parentPanel.cameraPositionPosBoxY:GetText()), tonumber(parentPanel.cameraPositionPosBoxZ:GetText()))
	varUpdate[2] = table_Copy(FMainMenu.ConfigPreview.previewCopy["_CameraAngle"])

	net_Start("FMainMenu_Config_UpdateTempVariable")
		net_WriteTable({"CameraPosition","CameraAngle"})
		net_WriteString(util_TableToJSON(varUpdate))
	net_SendToServer()
end

-- Called when property is closed, allows for additional clean up if needed
FMainMenu.ConfigModules[propertyCode].onClosePropFunc = function()
	FMainMenu.ConfigModulesHelper.closeOpenExtraWindows()

	LocalPlayer():SetNoDraw( false )

	if FMainMenu.configPropertyWindow.quitting == nil then
		local varUpdate = {}
		varUpdate[1] = table_Copy(FMainMenu.ConfigPreview.previewCopy["_CameraPosition"])
		varUpdate[2] = table_Copy(FMainMenu.ConfigPreview.previewCopy["_CameraAngle"])

		net_Start("FMainMenu_Config_UpdateTempVariable")
			net_WriteTable({"CameraPosition","CameraAngle"})
			net_WriteString(util_TableToJSON(varUpdate))
		net_SendToServer()
	end
end

-- Handles saving changes to a property
FMainMenu.ConfigModules[propertyCode].saveFunc = function()
	local mapName = game_GetMap()
	local parentPanel = FMainMenu.configPropertyWindow.currentProp

	if tonumber(parentPanel.cameraPositionPosBoxX:GetText()) == nil then return true end
	if tonumber(parentPanel.cameraPositionPosBoxY:GetText()) == nil then return true end
	if tonumber(parentPanel.cameraPositionPosBoxZ:GetText()) == nil then return true end

	if parentPanel.advancedSpawnOption:GetValue() == FMainMenu.GetPhrase("ConfigCommonValueEnabled") then
		parentPanel.lastRecVariable[1] = true
	elseif parentPanel.advancedSpawnOption:GetValue() == FMainMenu.GetPhrase("ConfigCommonValueDisabled") then
		parentPanel.lastRecVariable[1] = false
	else
		return true
	end

	parentPanel.lastRecVariable[2][mapName] = Vector(tonumber(parentPanel.cameraPositionPosBoxX:GetText()), tonumber(parentPanel.cameraPositionPosBoxY:GetText()), tonumber(parentPanel.cameraPositionPosBoxZ:GetText()))

	FMainMenu.ConfigModulesHelper.updateVariables(parentPanel.lastRecVariable, configPropList)
end

-- Called when the current values are being overwritten by the server
FMainMenu.ConfigModules[propertyCode].varFetch = function(receivedVarTable)
	local mapName = game_GetMap()
	local parentPanel = FMainMenu.configPropertyWindow.currentProp

	FMainMenu.ConfigPreview.previewCopy["_CameraPosition"] = receivedVarTable[3]
	FMainMenu.ConfigPreview.previewCopy["_CameraAngle"] = receivedVarTable[4]

	if receivedVarTable[1] then
		parentPanel.advancedSpawnOption:SetValue(FMainMenu.GetPhrase("ConfigCommonValueEnabled"))
	else
		parentPanel.advancedSpawnOption:SetValue(FMainMenu.GetPhrase("ConfigCommonValueDisabled"))
	end
	parentPanel.cameraPositionPosBoxX:SetText(math_Round( receivedVarTable[2][mapName].x, 3))
	parentPanel.cameraPositionPosBoxY:SetText(math_Round( receivedVarTable[2][mapName].y, 3))
	parentPanel.cameraPositionPosBoxZ:SetText(math_Round( receivedVarTable[2][mapName].z, 3))
end

-- Called when the player wishes to reset the property values to those of the server
FMainMenu.ConfigModules[propertyCode].revertFunc = function()
	return configPropListTwo
end