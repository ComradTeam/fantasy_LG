-- Определяем кастомный класс кнопки, если ещё не существует
if not vgui.GetControlTable("ImageButton") then
    local PANEL = {}

    function PANEL:Init()
        self:SetText("")                     -- убираем стандартный текст
        self.idleMat = nil                   -- материал спокойного состояния
        self.hoverMat = nil                  -- материал при наведении
        self.currentMat = nil
    end

    function PANEL:SetIdleMaterial(mat)
        self.idleMat = mat
        if not self.currentMat then
            self.currentMat = mat
        end
    end

    function PANEL:SetHoverMaterial(mat)
        self.hoverMat = mat
    end

    function PANEL:Paint(w, h)
        if self.currentMat then
            surface.SetDrawColor(255, 255, 255, 255)
            surface.SetMaterial(self.currentMat)
            surface.DrawTexturedRect(0, 0, w, h)
        end
    end

    function PANEL:OnCursorEntered()
        if self.hoverMat then
            self.currentMat = self.hoverMat
        end
    end

    function PANEL:OnCursorExited()
        if self.idleMat then
            self.currentMat = self.idleMat
        end
    end

    vgui.Register("ImageButton", PANEL, "DButton")
end

hook.Add("CreateMenu", "CustomAnimatedMenu", function()
    -- 1. Создаём фрейм меню
    local menu = vgui.Create("DFrame")
    menu:SetSize(ScrW(), ScrH())
    menu:SetTitle("")
    menu:ShowCloseButton(false)   -- убираем крестик закрытия
    menu:MakePopup()
    menu:SetDraggable(false)
    menu.Paint = nil              -- прозрачный фон, чтобы GIF не перекрывался

    -- 2. Добавляем HTML-панель с GIF
    local bg = vgui.Create("DHTML", menu)
    bg:Dock(FILL)                 -- растягиваем на всё окно
    bg:SetMouseInputEnabled(false) -- важно! пропускаем клики к кнопкам
    local htmlContent = file.Read("html/splash.html", "GAME")
    if htmlContent then
        bg:SetHTML(htmlContent)
    else
        -- запасной чёрный фон, если файл не найден
        bg:SetHTML([[<html><body style="background:#000;"></body></html>]])
    end

    -- 3. Кнопка «Играть»
    local btnPlay = vgui.Create("ImageButton", menu)
    btnPlay:SetSize(350, 90)
    btnPlay:SetPos(ScrW()/2 - 175, ScrH() * 0.65)  -- позиция по центру
    btnPlay:SetIdleMaterial(Material("vgui/menu/btn_play.png", "smooth"))
    btnPlay:SetHoverMaterial(Material("vgui/menu/btn_play_hover.png", "smooth"))
    -- Добавим текстовую метку поверх изображения (по желанию)
    local lblPlay = vgui.Create("DLabel", btnPlay)
    lblPlay:Dock(FILL)
    lblPlay:SetText("ИГРАТЬ")
    lblPlay:SetFont("ixLargeFont")   -- используем шрифт из Helix (или любой другой)
    lblPlay:SetContentAlignment(5)   -- центр
    lblPlay:SetTextColor(Color(255, 255, 255))

    btnPlay.DoClick = function()
        -- Открываем стандартное меню персонажа
        if ix.gui.characterMenu then
            ix.gui.characterMenu:Remove()
        end
        ix.gui.characterMenu = vgui.Create("ixCharMenu")
        menu:Close()
    end

    -- 4. Кнопка «Правила» (аналогично)
    local btnRules = vgui.Create("ImageButton", menu)
    btnRules:SetSize(350, 90)
    btnRules:SetPos(ScrW()/2 - 175, ScrH() * 0.78)
    btnRules:SetIdleMaterial(Material("vgui/menu/btn_rules.png", "smooth"))
    btnRules:SetHoverMaterial(Material("vgui/menu/btn_rules_hover.png", "smooth"))
    local lblRules = vgui.Create("DLabel", btnRules)
    lblRules:Dock(FILL)
    lblRules:SetText("ПРАВИЛА")
    lblRules:SetFont("ixLargeFont")
    lblRules:SetContentAlignment(5)
    lblRules:SetTextColor(Color(255, 255, 255))

    btnRules.DoClick = function()
        -- Отправка команды для открытия правил (зависит от схемы)
        RunConsoleCommand("ix", "rules")
    end

    -- 5. Возвращаем панель меню, чтобы Helix знал о ней
    return menu
end)