--https://www.roblox.com/games/12014935450
local PlaceId = 12014935450
if game.PlaceId ~= PlaceId then warn(string.format("Wrong game detected. %s expected, got %s", PlaceId, game.PlaceId)) return end
--Vars
local pp,LP = game.Players,game.Players.LocalPlayer
local char = LP.Character or LP.CharacterAdded():Wait()
local hum = char:WaitForChild("Humanoid")
local rep,remote = game.ReplicatedStorage,game.ReplicatedStorage:WaitForChild("Remote")
local vu = game:GetService("VirtualUser")
--Libs
local add = loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/additional.lua"))()
--AntiAFK
LP.Idled:Connect(function() vu:CaptureController() vu:ClickButton2(Vector2.new()) end)
--Main
while task.wait() do
	for i,v in pairs(game:GetService("Workspace").TrainingZones:children()) do
		if v.Name ~= "Other" and v.Name ~= "Speed" then
			for i1,v1 in pairs(v:children()) do
				if add.dist(v1.TrainingZone.Position) <= 15 and add.isstill(hum) then
					remote:FireServer("Train", v.Name)
				end
			end
		end
	end
	remote:FireServer("Train Speed")
end