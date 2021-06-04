local FMainMenu = FMainMenuFMainMenu.Lang = FMainMenu.Lang || {}FMainMenu.LangPresets = FMainMenu.LangPresets || {}-- IGNORE ABOVE CODE--[[STEPS TO CREATE LANGUAGE:1. Edit these two values to fit your language. (prefix can just be a short code for the language, while fancyName is the full language name that will appear to users) 2. Edit the many strings below to fit your language 3, Drop the file into the language folder and restart the server 4, The language will now be added as an option in the config editor under the "Language" property.5. If you would like to contribute to the addon by having your translation be distributed along with the addon, send Fay a message on gmodstore or elsewhere.]]--local prefix = "ru"local fancyName = "русский"FMainMenu.LangPresets[prefix] = {} -- ignore this linelocal translationList = FMainMenu.LangPresets[prefix] -- ignore this linetranslationList.WelcomerFrameTitle = "Добро пожаловать на сервер"translationList.DisconnectFrameTitle = "Подтвердить отключение"translationList.DisconnectConfirmText = "Вы уверены, что хотите отключить?"translationList.DisconnectConfirmYesText = "да"translationList.DisconnectConfirmNoText = "Нет"translationList.LogNoCamPos = "Положение камеры не существует для этой карты! Кто-то с доступом к конфигурации должен устанавливать позицию камеры!"translationList.LogNoCamAng = "Угол камеры не существует для этой карты! Кто-то с доступом к конфигурации должен устанавливать ориентацию камеры!"translationList.LogNoAdvSpawnPos = "Усовершенствованная позиция спавна не существует для этой карты! Кто-то с доступом к конфигурации должен устанавливать предполагаемое положение!"translationList.PlayButtonText = "Играть"translationList.DisconnectButtonText = "Отключить"translationList.LogHelperHeader = "Следующие строки будут распечатать отформатированную версию вашей позиции и углов. Вы можете скопировать и вставить их в свой конфиг по мере необходимости."translationList.LogPosHead = "Должность:"translationList.LogAngHead = "Углы:"translationList.TTTRoundStarted = "TTT раунд начался, поэтому вы выгнали из главного меню."translationList.MurderRoundStarted = "Раунд убийства начался, поэтому вы выгнали из главного меню."translationList.ZSRoundStarted = "Выживание зомби началось, поэтому вы выгнали из главного меню."translationList.PropHuntRoundStarted = "Выживание зомби началось, поэтому вы выгнали из главного меню."translationList.LogMurderEverySpawn = "Каждый спасок не поддерживается в убийстве, поэтому он был отключен."translationList.LogZSEverySpawn = "Каждый спасок не поддерживается в выживании зомби, поэтому он был отключен."translationList.LogPropHuntEverySpawn = "Каждый спасок не поддерживается в Охоте в Подписку, поэтому он был отключен."translationList.ConfigCommonValueDisabled = "Отключено"translationList.ConfigCommonValueEnabled = "Включено"translationList.ConfigCommonValueYes = "да"translationList.ConfigCommonValueNo = "Нет"translationList.ConfigCommonValueX = "ИКС:"translationList.ConfigCommonValueY = "У:"translationList.ConfigCommonValueZ = "Z:"translationList.ConfigCommonValueAllowed = "Разрешается"translationList.ConfigCommonValueDenied = "Отклонен"translationList.ConfigCommonValueClose = "Закрывать"translationList.ConfigCommonValueCancel = "Отмена"translationList.ConfigLeaveMenu = "Пожалуйста, выйдите из главного меню, прежде чем открыть инструмент конфигурации."translationList.ConfigUnsavedChanges = "Текущее свойство изменено, но несохранено, вы хотели бы выбрать изменения?"translationList.ConfigUnsavedChangesHeader = "Неупрашинные изменения!"translationList.ConfigPropertiesWindowTitle = "Fmainmenu - редактор недвижимости"translationList.ConfigPropertiesNoneSelected = "Нет недвижимости недвижимости"translationList.ConfigPropertiesSelectorTitle = "Fmainmenu - селектор недвижимости"translationList.ConfigPropertiesSavePropButton = "Сохранить свойство"translationList.ConfigPropertiesRevertPropButton = "Вернуть изменения"translationList.ConfigPropertiesCategoriesCamera = "Камера"translationList.ConfigPropertiesCategoriesMenu = "Меню"translationList.ConfigPropertiesCategoriesHooks = "Функциональность крюка"translationList.ConfigPropertiesCategoriesDerma = "Стиль дермы"translationList.ConfigPropertiesCategoriesAccess = "Конфигурация Access."translationList.ConfigPropertiesCategoriesAdvanced = "Передовой"translationList.ConfigTopBarHeaderText = "Fmainmenu Config Editor."translationList.ConfigTopBarExitText = "Выход"translationList.ConfigSoundSelectorWindowTitle = "Sound Selector"translationList.ConfigSoundSelectorChooseButtonText = "Подтверждать"translationList.ConfigSoundSelectorPlayButtonText = "Играть"translationList.ConfigSoundSelectorStopButtonText = "Стоп"translationList.ConfigSoundSelectorWindowSelectionHeader = "В настоящее время выбран:"translationList.ConfigSoundSelectorVolumeLabel = "Объем:"translationList.ConfigPropertiesCameraSetupPropName = "Настройка камеры"translationList.ConfigPropertiesCameraSetupPropDesc = "Позволяет устанавливать, где существует камеравилл в мире"translationList.ConfigPropertiesCameraSetupPosLabel = "Положение (текущая карта):"translationList.ConfigPropertiesCameraSetupAngLabel = "Ориентация (текущая карта):"translationList.ConfigPropertiesCameraSetupCaptureLabel = "Захватить текущее местоположение"translationList.ConfigPropertiesEverySpawnPropName = "Частота меню"translationList.ConfigPropertiesEverySpawnPropDesc = "Следует ли появиться меню на каждом порождении или только один раз"translationList.ConfigPropertiesEverySpawnLabel = "Частота меню:"translationList.ConfigPropertiesEverySpawnOptionOne = "Каждый поронт"translationList.ConfigPropertiesEverySpawnOptionTwo = "Первое порождение"translationList.ConfigPropertiesHearOtherPlayersPropName = "Слышать других игроков"translationList.ConfigPropertiesHearOtherPlayersPropDesc = "Будет ли игрок услышать других игроков, разговаривающих из меню"translationList.ConfigPropertiesHearOtherPlayersLabel = "Слышать других игроков:"translationList.ConfigPropertiesHearOtherPlayersDistanceLabel = "Максимальное расстояние:"translationList.ConfigPropertiesLanguagePropName = "Язык"translationList.ConfigPropertiesLanguagePropDesc = "Выберите то, на каком языковом статическом интерфейсе Use.only применяется к недавно открытому GUI."translationList.ConfigPropertiesLanguageLabel = "Язык:"translationList.ConfigPropertiesGMODStylePropName = "Название / Логотип Позиционирование"translationList.ConfigPropertiesGMODStylePropDesc = "Независимо от того, стоит ли заголовок меню / логотип в центре влево или влево."translationList.ConfigPropertiesGMODStyleLabel = "Положение меню:"translationList.ConfigPropertiesGMODStyleSelectOne = "Верхний левый"translationList.ConfigPropertiesGMODStyleSelectTwo = "Влево"translationList.ConfigPropertiesLogoPropName = "Название / Логотип Содержание"translationList.ConfigPropertiesLogoPropDesc = "Должен ли название меню быть изображением или текстом."translationList.ConfigPropertiesLogoLabel = "Тип логотипа:"translationList.ConfigPropertiesLogoSelectOne = "Текст"translationList.ConfigPropertiesLogoSelectTwo = "Изображение"translationList.ConfigPropertiesLogoContentLabel = "Ссылка текста / изображения:"translationList.ConfigPropertiesBackgroundPropName = "Фоновые эффекты"translationList.ConfigPropertiesBackgroundPropDesc = "Измените размытие и оттенок камеравав. Предупреждение: дорого!"translationList.ConfigPropertiesBackgroundBlurLabel = "Сумма размытия:"translationList.ConfigPropertiesBackgroundTintLabel = "Цвет оттенка:"translationList.ConfigPropertiesChangelogPropName = "ChangeLog"translationList.ConfigPropertiesChangelogPropDesc = "Редактировать различные настройки о панели ThechangeLog."translationList.ConfigPropertiesChangelogToggleLabel = "ChangeLog:"translationList.ConfigPropertiesChangelogSelectOne = "Включено"translationList.ConfigPropertiesChangelogSelectTwo = "Отключено"translationList.ConfigPropertiesChangelogMarginLabel = "Положение ChangeLog:"translationList.ConfigPropertiesMarginSelectOne = "В правом верхнем углу"translationList.ConfigPropertiesMarginSelectTwo = "Нижний правый"translationList.ConfigPropertiesChangelogTextLabel = "Текст изменений:"translationList.ConfigPropertiesMusicPropName = "Фоновая музыка"translationList.ConfigPropertiesMusicPropDesc = "Позволяет музыку играть в те в главном меню."translationList.ConfigPropertiesMusicTypeLabel = "Тип музыки:"translationList.ConfigPropertiesMusicTypeOptionOneLabel = "Файл"translationList.ConfigPropertiesMusicTypeOptionTwoLabel = "Урл"translationList.ConfigPropertiesMusicLoopLabel = "Циклирование:"translationList.ConfigPropertiesMusicVolumeLabel = "Объем (0-1):"translationList.ConfigPropertiesMusicFadeLabel = "Время исчезновения (секунды):"translationList.ConfigPropertiesMusicSelectLabel = "Аудио:"translationList.ConfigPropertiesMusicButtonLabel = "Выберите Audio File."translationList.ConfigPropertiesFJWelcomerPropName = "Добро пожаловать экран"translationList.ConfigPropertiesFJWelcomerPropDesc = "Позволяет игрокам получать информацию о своем первом присоединении."translationList.ConfigPropertiesWelcomerTextLabel = "Добро пожаловать текст:"translationList.ConfigPropertiesWelcomerTypeLabel = "Экран приветствия:"translationList.ConfigPropertiesWelcomerURLTextLabel = "Текст кнопки:"translationList.ConfigPropertiesWelcomerURLLabel = "URL веб-сайта:"translationList.ConfigPropertiesWelcomerURLButtonToggleLabel = "Кнопка открывает URL:"translationList.ConfigPropertiesDisconnectPropName = "Отключить кнопку"translationList.ConfigPropertiesDisconnectPropDesc = "Позволяет игрокам легко отключиться от главного меню."translationList.ConfigPropertiesDisconnectToggleLabel = "Отключить кнопку:"translationList.ConfigPropertiesURLButtonsPropName = "Кнопки URL."translationList.ConfigPropertiesURLButtonsPropDesc = "Позволяет игрокам легко получать ссылки на связи из меню."translationList.ConfigPropertiesURLButtonsEditorButtonLabel = "Редактировать кнопки URL."translationList.ConfigURLButtonEditorWindowTitle = "Редактор кнопок URL"translationList.ConfigURLButtonEditorCloseButtonText = "Закрывать"translationList.ConfigURLButtonEditorRevertButtonText = "Возвращаться"translationList.ConfigURLButtonEditorAddButtonText = "Добавить кнопку"translationList.ConfigURLButtonEditorWindowButtonLabel = "Метка кнопок:"translationList.ConfigURLButtonEditorWindowLinkLabel = "Кнопка ссылка:"translationList.ConfigURLButtonEditorWindowDeleteConfirm = "Вы уверены, что хотите удалить эту кнопку?"translationList.ConfigURLButtonEditorWindowRevertConfirm = "Вы уверены, что хотите вернуться к настройкам сервера?"translationList.ConfigPropertiesSandboxHooksPropName = "Крючки для песочницы"translationList.ConfigPropertiesSandboxHooksPropDesc = "Управляйте тем, что может сделать игрок, пока в главном меню."translationList.ConfigPropertiesSandboxHooksPlayerSpawnEffect = "Нерестовые эффекты:"translationList.ConfigPropertiesSandboxHooksPlayerSpawnNPC = "Нересты NPCS:"translationList.ConfigPropertiesSandboxHooksPlayerSpawnProp = "Нерестовые реквизиты:"translationList.ConfigPropertiesSandboxHooksPlayerSpawnRagdoll = "Нерестых Ragdolls:"translationList.ConfigPropertiesSandboxHooksPlayerSpawnSENT = "Нерестовые рассылки:"translationList.ConfigPropertiesSandboxHooksPlayerSpawnSWEP = "Нересты SWEPS:"translationList.ConfigPropertiesSandboxHooksPlayerSpawnVehicle = "Нерестовые автомобили:"translationList.ConfigPropertiesSandboxHooksPlayerGiveSWEP = "Давая Sweps для себя:"translationList.ConfigPropertiesDarkRPHooksPropName = "DarkRP крючки"translationList.ConfigPropertiesDarkRPHooksPropDesc = "Управляйте тем, что может сделать игрок, пока в главном меню."translationList.ConfigPropertiesDarkRPHooksCanBuy = "Покупка предметов:"translationList.ConfigPropertiesDarkRPHooksCanChatSound = "Звуки разговора:"translationList.ConfigPropertiesDarkRPHooksCanUse = "Использование объектов:"translationList.ConfigPropertiesDarkRPHooksCanUsePocket = "Использование кармана:"translationList.ConfigPropertiesDarkRPHooksCanDropWeapon = "Снижение оружия:"translationList.ConfigPropertiesDarkRPHooksCanReqHits = "Запрашивая хиты:"translationList.ConfigPropertiesDarkRPHooksCanReqWarrants = "Запрашивающие ордера:"translationList.ConfigPropertiesDermaFont = "Шрифт:"translationList.ConfigPropertiesDermaFontSize = "Размер шрифта:"translationList.ConfigPropertiesDermaOutlineThickness = "Обнаружение толщины:"translationList.ConfigPropertiesDermaFontShadow = "Текстовая тень:"translationList.ConfigPropertiesDermaTextColor = "Цвет текста:"translationList.ConfigPropertiesDermaOutlineColor = "Контур цвет:"translationList.ConfigPropertiesLogoDermaPropName = "Стиль логотипа"translationList.ConfigPropertiesLogoDermaPropDesc = "Контроль, насколько различными аспектами логотипа созданы."translationList.ConfigPropertiesTextButtonDermaPropName = "Текстовый стиль кнопки"translationList.ConfigPropertiesTextButtonDermaPropDesc = "Контроль, как различные аспекты кнопок в стиле."translationList.ConfigPropertiesTextButtonDermaHoverColor = "Цвет текста, когда зависел:"translationList.ConfigPropertiesTextButtonDermaHoverSound = "Звук, когда завис:"translationList.ConfigPropertiesTextButtonDermaClickSound = "Звук при нажатии:"translationList.ConfigPropertiesFrameDermaPropName = "Стиль кадров дермы"translationList.ConfigPropertiesFrameDermaPropDesc = "Контроль, насколько различными аспектами кадров дерма в стиле."translationList.ConfigPropertiesFrameDermaFrameColor = "Цвет кадра:"translationList.ConfigPropertiesFrameDermaFrameBevel = "Каркас скос:"translationList.ConfigPropertiesPanelDermaPropName = "Стиль панели дермы"translationList.ConfigPropertiesPanelDermaPropDesc = "Контроль, как различные аспекты панелей дерма в стиле."translationList.ConfigPropertiesPanelDermaPanelColor = "Цвет панели:"translationList.ConfigPropertiesButtonDermaPropName = "Кнопка дермы стиль"translationList.ConfigPropertiesButtonDermaPropDesc = "Контроль, насколько различными аспектами кнопок дермы созданы."translationList.ConfigPropertiesButtonDermaButtonColor = "Цвет кнопки:"translationList.ConfigPropertiesTextDermaPropName = "Текстовый стиль дермы"translationList.ConfigPropertiesTextDermaPropDesc = "Контроль, как различные аспекты меток дермы в стиле."translationList.ConfigPropertiesTextDermaTextColor = "Цвет текста:"translationList.ConfigPropertiesScrollPanelDermaPropName = "Стиль панели прокрутки Derma"translationList.ConfigPropertiesScrollPanelDermaPropDesc = "Контроль, насколько различными аспектами панелей прокрутки Derma устанавливаются."translationList.ConfigPropertiesScrollPanelDermaBarColor = "Цвет бара прокрутки:"translationList.ConfigPropertiesScrollPanelDermaGripColor = "Свиток Grip Color:"translationList.ConfigPropertiesScrollPanelDermaButtonColor = "Цвет кнопки прокрутки:"translationList.ConfigPropertiesConfigAccessPropName = "Конфигурация Access."translationList.ConfigPropertiesConfigAccessPropDesc = "Контроль, который может просматривать и редактировать конфигурацию FMainMenu."translationList.ConfigPropertiesConfigAccessToggleLabel = "Config Access Группа:"translationList.ConfigPropertiesConfigAccessAMToggleLabel = "Предпочтительным администратором мода:"translationList.ConfigPropertiesConfigAccessNoteLabel = "Примечание. Этот параметр может иметь разные эффекты в зависимости от вашего мода администратора."translationList.ConfigPropertiesConfigAccessNoteButtonLabel = "Больше информации"translationList.ConfigPropertiesConfigAccessNoteWindowText = "Конфигурация доступа - различия системы администратора"translationList.ConfigPropertiesConfigAccessNoteText = "По умолчанию только Superadmins смогут редактировать конфигурацию, и он будет использовать встроенный администратор GMOD, чтобы определить, кому разрешено редактировать. Вот как каждый мод администратора будет функционировать: gmod: usergroup набор в конфигурации и выше может делать редактирует \ nulx: группы, которые имеют разрешение fmainmenu_editmenu \ nfadmin: группы, которые имеют разрешение FMAINMENU_EDITMINU FADMIN."translationList.ConfigPropertiesConfigAccessNoteControlULX = "Конфигурация Access контролируется ULX."translationList.ConfigPropertiesConfigAccessNoteControlFAdmin = "Config Access контролируется Fadmin."translationList.ConfigPropertiesAdvancedGeneralInfoButtonLabel = "Получить информацию"translationList.ConfigPropertiesAdvancedSpawnPropName = "Усовершенствованная"translationList.ConfigPropertiesAdvancedSpawnPropDesc = "Будет ли расширенная система Spawn SystemShouse"translationList.ConfigPropertiesAdvancedSpawnOptLabel = "Усовершенствованная резьба:"translationList.ConfigPropertiesAdvancedSpawnPosLabel = "Положение (текущая карта):"translationList.ConfigPropertiesAdvancedSpawnCaptureLabel = "Захватить текущее местоположение"translationList.ConfigPropertiesAdvancedSpawnInfoLabel = "Для получения дополнительной информации о AdvancedSpawn щелкните кнопку ниже"translationList.ConfigPropertiesAdvancedSpawnInfo = "В режиме Garry's Soundscapes на карте может быть вызван только тогда, когда игрок физически в этой части карты. Усовершенствованное порождение работает благодаря физическому перемещению игрока в указанное местоположение. Воспроизведение: это приведет к игроку больше не физически существующим в мире, пока они не нажмут кнопку воспроизведения. Пожалуйста, примите это во внимание, при принятии решения о том, следует ли эту функцию или нет. Это сломает некоторые аспекты определенных игровых средств."translationList.ConfigPropertiesAdvancedSpawnInfoWindowTitle = "Усовершенствованная информация о порождении"translationList.ConfigPropertiesConfigFirstJoinSeedPropName = "Сначала присоединяйтесь к семени"translationList.ConfigPropertiesConfigFirstJoinSeedPropDesc = "Контролируйте, как сначала присоединяйтесь к семению, которые посмотрели его."translationList.ConfigPropertiesConfigFirstJoinSeedBoxLabel = "Сначала присоединяйтесь к семени:"translationList.ConfigPropertiesFirstJoinSeedInfoLabel = "Для получения дополнительной информации о семене перфя, нажмите кнопку ниже"translationList.ConfigPropertiesFirstJoinSeedInfo = "Чтобы обнаружить, когда игрок прошел через диалоговое окно «Добро пожаловать экран», файл создается с именем на основе IP-адреса сервера. Это позволяет нескольким серверам иметь этот аддон без конфликтов .in случаев, когда IP может быть недоступен, например, в одноранговых серверах, имущество «первое соединение \» должно быть установлено на что-то уникальное, чтобы не было Конфликт с другими серверами. Having Свойство будет пустым, приведет к тому, что аддон будет использовать нормальные процедуры именования на основе IP."translationList.ConfigPropertiesFirstJoinSeedInfoWindowTitle = "Сначала соедините информацию о семени"translationList.ConfigPropertiesMenuOverridePropName = "Пользовательская макет"translationList.ConfigPropertiesMenuOverridePropDesc = "Контролируйте, как кнопки меню Areelaid Out."translationList.ConfigPropertiesMenuOverrideOptLabel = "Пользовательская макет:"translationList.ConfigPropertiesMenuSetupEditorButtonLabel = "Редактировать макет"translationList.ConfigPropertiesMenuOverrideInfoLabel = "Для получения дополнительной информации о CustomLayouts нажмите кнопку ниже"translationList.ConfigPropertiesMenuOverrideInfo = "Пользовательские макеты позволяют серверам иметь больше контроля над размещением кнопок под логотипом. Когда включено, кнопка «Отключение \» и \ «URL-кнопки \» будет игнорироваться."translationList.ConfigPropertiesMenuOverrideInfoWindowTitle = "Информация о пользовательской макете"translationList.ConfigMenuSetupEditorWindowTitle = "Редактор макета меню"translationList.ConfigMenuSetupEditorTypePlay = "Кнопка воспроизведения"translationList.ConfigMenuSetupEditorTypeSpacer = "Проставка"translationList.ConfigMenuSetupEditorTypeURL = "Кнопка URL"translationList.ConfigMenuSetupEditorTypeDisconnect = "Отключить кнопку"translationList.ConfigMenuSetupEditorWindowChooseTypeLabel = "Выберите кнопку Тип"-- IGNORE BELOW CODEFMainMenu.languageLookup[prefix] = fancyNameFMainMenu.languageReverseLookup[fancyName] = prefix