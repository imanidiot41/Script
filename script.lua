local playerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- ScreenGui setup
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "GagFreezeTradeGUI"
screenGui.ResetOnSpawn = false

-- Main Frame
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.fromOffset(400, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Helper: Create TextLabel or TextButton
local function createText(name, text, size, position, color, parent, isButton)
	local el = isButton and Instance.new("TextButton") or Instance.new("TextLabel")
	el.Name = name
	el.Size = UDim2.new(0.8, 0, 0, 40)
	el.Position = position
	el.BackgroundColor3 = color or Color3.fromRGB(30, 30, 30)
	el.Text = text
	el.TextColor3 = Color3.new(1, 1, 1)
	el.Font = Enum.Font.GothamBold
	el.TextSize = size
	el.Parent = parent
	return el
end

-- Title
local title = createText("Title", "Gag Freeze Trade", 26, UDim2.new(0, 0, 0, 0), Color3.fromRGB(30, 30, 30), frame, false)
title.Size = UDim2.new(1, 0, 0, 50)

-- Freeze Trade button
local freezeBtn = createText("FreezeButton", "Freeze Trade", 20, UDim2.new(0.1, 0, 0, 70), Color3.fromRGB(100, 100, 255), frame, true)

-- Accept button
local acceptBtn = createText("AcceptButton", "Accept", 20, UDim2.new(0.1, 0, 0, 120), Color3.fromRGB(0, 200, 100), frame, true)

-- Credit
local credit = createText("Credit", "by: ZeusxScript", 18, UDim2.new(0, 0, 1, -30), nil, frame, false)
credit.BackgroundTransparency = 1
credit.TextYAlignment = Enum.TextYAlignment.Bottom
credit.Size = UDim2.new(1, 0, 0, 30)

-- Loading bar background
local loadingBarBG = Instance.new("Frame", frame)
loadingBarBG.Size = UDim2.new(0.8, 0, 0, 20)
loadingBarBG.Position = UDim2.new(0.1, 0, 0, 180)
loadingBarBG.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
loadingBarBG.Visible = false

-- Loading bar fill
local loadingFill = Instance.new("Frame", loadingBarBG)
loadingFill.Size = UDim2.new(0, 0, 1, 0)
loadingFill.Position = UDim2.new(0, 0, 0, 0)
loadingFill.BackgroundColor3 = Color3.fromRGB(0, 255, 100)

-- % Text
local percentText = Instance.new("TextLabel", loadingBarBG)
percentText.Size = UDim2.new(1, 0, 1, 0)
percentText.BackgroundTransparency = 1
percentText.TextColor3 = Color3.new(1, 1, 1)
percentText.Font = Enum.Font.GothamBold
percentText.TextSize = 14
percentText.Text = "0%"
percentText.ZIndex = 2

-- Function to simulate loading
local function startLoading()
	loadingBarBG.Visible = true
	loadingFill.Size = UDim2.new(0, 0, 1, 0)
	percentText.Text = "0%"
	
	for i = 1, 100 do
		loadingFill.Size = UDim2.new(i/100, 0, 1, 0)
		percentText.Text = i .. "%"
		wait(3 / 100)
	end
	
	wait(0.5)
	loadingBarBG.Visible = false
end

-- Connect buttons to loading
freezeBtn.MouseButton1Click:Connect(startLoading)
acceptBtn.MouseButton1Click:Connect(startLoading)
