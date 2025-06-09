local notificationTitle = nil
local notificationMessage = nil
local activeNotifications = {}
local function createNotification(title, message, duration)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false

    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Size = UDim2.new(0, 300, 0, 80)
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = NotificationFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -10, 0, 20)
    TitleLabel.Position = UDim2.new(0, 5, 0, 5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextScaled = true
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.Parent = NotificationFrame

    local MessageLabel = Instance.new("TextLabel")
    MessageLabel.Size = UDim2.new(1, -10, 0, 50)
    MessageLabel.Position = UDim2.new(0, 5, 0, 25)
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.Text = message
    MessageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    MessageLabel.TextScaled = true
    MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
    MessageLabel.TextWrapped = true
    MessageLabel.Font = Enum.Font.SourceSans
    MessageLabel.Parent = NotificationFrame

    local notification = {
        ScreenGui = ScreenGui,
        Frame = NotificationFrame,
        Index = #activeNotifications + 1
    }
    table.insert(activeNotifications, notification)

    local function updatePositions()
        for i, notif in ipairs(activeNotifications) do
            notif.Frame.Position = UDim2.new(0, 10, 1, -90 - (i - 1) * 90)
            notif.Index = i
        end
    end

    updatePositions()

    NotificationFrame.BackgroundTransparency = 1
    TitleLabel.TextTransparency = 1
    MessageLabel.TextTransparency = 1
    NotificationFrame.Visible = true

    for i = 1, 0, -0.05 do
        NotificationFrame.BackgroundTransparency = i
        TitleLabel.TextTransparency = i
        MessageLabel.TextTransparency = i
        wait(0.01)
    end

    wait(duration)

    for i = 0, 1, 0.05 do
        NotificationFrame.BackgroundTransparency = i
        TitleLabel.TextTransparency = i
        MessageLabel.TextTransparency = i
        wait(0.01)
    end

    NotificationFrame.Visible = false
    ScreenGui:Destroy()

    for i, notif in ipairs(activeNotifications) do
        if notif == notification then
            table.remove(activeNotifications, i)
            break
        end
    end
    updatePositions()
end
local function showNotification(duration)
    createNotification(notificationTitle, notificationMessage, duration)
end
