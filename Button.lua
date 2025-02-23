-- 7631202810:AAERfAQWMM1mKDB3RsYr6PLYlUdh5IGmx2M





-- Создаем ScreenGui
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Создаем кнопку
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 50) -- Размер кнопки
button.Position = UDim2.new(0.5, -50, 0.5, -25) -- Позиция кнопки по центру
button.Text = "RightShift"
button.Parent = screenGui

-- Функция для имитации нажатия RightShift
local function simulateRightShift()
    local UserInputService = game:GetService("UserInputService")
    UserInputService.InputBegan:Fire({
        UserInputType = Enum.UserInputType.Keyboard,
        KeyCode = Enum.KeyCode.RightShift
    })
end

-- Обработка нажатия на кнопку
button.MouseButton1Click:Connect(simulateRightShift)

-- Функция для восстановления кнопки после смерти
local function onCharacterAdded(character)
    -- Если кнопка уже существует, просто оставляем её
    if not screenGui:IsDescendantOf(playerGui) then
        screenGui.Parent = playerGui
    end
end

-- Связываем события
player.CharacterAdded:Connect(onCharacterAdded)

-- Проверяем, есть ли у игрока уже персонаж
if player.Character then
    onCharacterAdded(player.Character)
end

-- Позволяем двигать кнопку
button Draggable = true
