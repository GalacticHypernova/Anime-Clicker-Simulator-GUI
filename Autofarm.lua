--A test
getgenv().settings={
   ["click"]=false,
   ["rebirth"]=false,
   ["upgrade"]=false,
   ["boss"]=false,
   ["drops"]=false,
   ["egg"]=false,
   ["ach"]=false,
   ["eggShard"]=false
}
local rS=game:GetService("RunService")

local selectedBoss
function fightBoss(bossCFrame)
    spawn(function()
        local playerHead=game.Players.LocalPlayer.Character.HumanoidRootPart
        playerHead.CFrame=game:GetService("Workspace").BossZones[bossCFrame].Touch.CFrame
        wait(2)
        while getgenv().settings["boss"] do
            
            local args = {
            [1] = true,
            [2] = "HOW ARE YOU DOING THIS!!!",
            [3] = bossCFrame
        }
        game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
        rS.Heartbeat:Wait()
        end
    end)
end
function dailyReward()
   spawn(function()
      game:GetService("ReplicatedStorage").Remotes.CollectChest:InvokeServer("DailyRewards")
      game:GetService("ReplicatedStorage").Remotes.CollectChest:InvokeServer("GroupRewards")
   end)
end
function buyShardEgg(eggType2)
    spawn(function()
        while wait() do
            if not getgenv().settings["eggShard"] then break end
            local args = {
                [1] = eggType2,
                [2] = false,
                [3] = false
            }           
            game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
        end
    end)
end
function achieve()
    spawn(function()
        while getgenv().settings["ach"] do
            local args={
                [1]="Yen Boost I",
                [2]="Click Boost I",
                [3]="Luck Boost I",
                [4]="Yen Boost II",
                [5]="Click Boost II",
                [6]="Click Boost II",
                [7]="Yen Boost III",
                [8]="Click Boost III",
                [9]="Click Boost III",
                [10]="Yen Boost IV",
                [11]="Click Boost IV",
                [12]="Yen Boost IV",
                [13]="Yen Boost V",
                [14]="Click Boost V",
                [15]="Luck Boost V",
                [16]="Yen Boost VI",
                [17]="Luck Boost VI",
                [18]="Slow Auto Click",
                [19]="+1 Equipped",
                [20]="Fast Craft"
            }
            game:GetService("ReplicatedStorage").Remotes.ClaimQuestEvent:FireServer(unpack(args))
            rS.Heartbeat:Wait()
        end
    end)
end

function buyEgg(eggType)
    spawn(function()
        while wait() do
            if not getgenv().settings["egg"] then break end
            local args = {
                [1] = eggType,
                [2] = false,
                [3] = false
            }           
            game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
       end
   end)
end
function click()
   spawn(function()
       while getgenv().settings["click"] do
        local args = {
        [1] = true,
        [2] = "HOW ARE YOU DOING THIS!!!"
        }
        game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
        rS.Heartbeat:Wait()
       end
   end)
end

function teleport(teleportWorld)
    spawn(function()
        local args = {
            [1] = "world",
            [2] = teleportWorld
        }
        game:GetService("ReplicatedStorage").Remotes.RequestTeleport:InvokeServer(unpack(args))
    end)
end
function teleportTO(placeCFrame)
  local player = game.Players.LocalPlayer
  if player.Character then
      player.Character.HumanoidRootPart.CFrame=placeCFrame
  end
end
function teleportWorld(World)
  if game:GetService("Workspace").Worlds:FindFirstChild(World) then
      teleportTO(game:GetService("Workspace").Worlds[World].Spawn.CFrame)
  end
end
function autoRebirth(rebirthAmount)
   spawn(function()
       while getgenv().settings["rebirth"] do
           game:GetService("ReplicatedStorage").Remotes.RebirthRemote:FireServer(rebirthAmount)
           rS.Heartbeat:Wait()
       end
   end)
end
function autoCollectDrops()
   spawn(function()
       local plyrHead=game.Players.LocalPlayer.Character.HumanoidRootPart
       while wait() do
           if not getgenv().settings["drops"] then break end
           for i,v in pairs(game:GetDescendants()) do
               if v.Name=="TouchInterest" and v.Parent.Name=="Part" then
                   firetouchinterest(plyrHead,v.Parent,0)
               end
           end
       end
   end)
end
function upgradeAll()
   spawn(function()
       while wait() do
           if not getgenv().settings["upgrade"] then break end
            game:GetService("ReplicatedStorage").Remotes.RequestUpgrade:FireServer("Run Speed")
       end
   end)
   spawn(function()
       while wait() do
           if not getgenv().settings["upgrade"] then break end
            game:GetService("ReplicatedStorage").Remotes.RequestUpgrade:FireServer("More Rebirths")
       end
   end)
   spawn(function()
       while wait() do
           if not getgenv().settings["upgrade"] then break end
            game:GetService("ReplicatedStorage").Remotes.RequestUpgrade:FireServer("Star Open Speed")
       end
   end)
   spawn(function()
       while wait() do
           if not getgenv().settings["upgrade"] then break end
            game:GetService("ReplicatedStorage").Remotes.RequestUpgrade:FireServer("More Storage")
       end
   end)
   spawn(function()
       while wait() do
           if not getgenv().settings["upgrade"] then break end
            game:GetService("ReplicatedStorage").Remotes.RequestUpgrade:FireServer("Crit Chance")
       end
   end)
   spawn(function()
       while wait() do
           if not getgenv().settings["upgrade"] then break end
            game:GetService("ReplicatedStorage").Remotes.RequestUpgrade:FireServer("More Yen")
       end
   end)
end
--Test to hopefully fix loadstring again
function lagReduce()
   spawn(function()
      local args = {
         [1] = "Notifications",
         [2] = false
      }
      game:GetService("ReplicatedStorage").Remotes.ChangeSettings:FireServer(unpack(args))
  end)
  spawn(function()
      local args = {
         [1] = "Click Alerts",
         [2] = false
      }
      game:GetService("ReplicatedStorage").Remotes.ChangeSettings:FireServer(unpack(args))
  end)
  spawn(function()
      local args = {
         [1] = "Lite Graphics",
         [2] = true
      }
      game:GetService("ReplicatedStorage").Remotes.ChangeSettings:FireServer(unpack(args))
  end)
end



local library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local Wait = library.subs.Wait -- Only returns if the GUI has not been terminated. For 'while Wait() do' loops

local PepsisWorld = library:CreateWindow({
Name = "Pepsi's World",
Themeable = {
Info = "Discord Server: VzYTJ7Y"
}
})

local GeneralTab = PepsisWorld:CreateTab({
Name = "General"
})
local FarmingSection = GeneralTab:CreateSection({
Name = "Autofarm"
})
local PetSection = GeneralTab:CreateSection({
Name = "Pets"
})
local Other = GeneralTab:CreateSection({
  Name = "Misc",
  Side="Right"
})
FarmingSection:AddToggle({
Name = "Auto Click",
Callback=function(bool) getgenv().settings["click"]=bool
  if bool then
      click()
  end
end,
Keybind =  {
Mode=   "Dynamic"
}
})
local selectedRebirth
FarmingSection:AddDropdown({
   Name="Rebirth options",
   List = {"Click Me","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"},
   Callback=function(value)
       selectedRebirth=value
       print(value)
   end
})
FarmingSection:AddToggle({
   Name="Auto Rebirth",
   Callback=function(bool)
       getgenv().settings["rebirth"]=bool
       if bool and selectedRebirth then
           autoRebirth(tonumber(selectedRebirth))
       end
   end
})
FarmingSection:AddToggle({
   Name="Auto collect world drops",
   Callback=function(bool)
       getgenv().settings["drops"]=bool
       if bool then
           autoCollectDrops()
       end
   end
})
FarmingSection:AddToggle({
    Name="Auto Upgrade everything",
    Callback=function(bool)
        getgenv().settings["upgrade"]=bool
        if bool then
            upgradeAll()
        end
    end
    
})
FarmingSection:AddDropdown({
    Name="Boss to fight",
    List={"Click Me","Evil Vegete","Serparu","Freezie","Chima King","The Destroyer"},
    Callback=function(value)
        selectedBoss=value
        print(value)
    end
    
})
FarmingSection:AddToggle({
    Name="Auto fight boss",
    Callback=function(bool)
        getgenv().settings["boss"]=bool
        if bool and selectedBoss then
            fightBoss(selectedBoss)
        end
    end
    
})
FarmingSection:AddButton({
   Name="Collect daily/group chest",
   Callback=function()
      dailyReward()
      end
})
FarmingSection:AddToggle({
    Name="Claim all achievements",
    Callback=function()
        getgenv().settings["ach"]=bool
        if bool then
            achieve()
        end
        
    end
})
local selectedEgg
PetSection:AddDropdown({
   Name="Egg to buy",
   List={"Click Me","Dragon Star","Demon Star","5M Star","Pirate Star","Slayer Star","Nine Tailed Star","Spirit Star","Walled Star","Namekian Star","Quirky Star","Crazy Star","Hunter Star","Fighting Star","city","moon","fire"},
   Callback=function(value)
       selectedEgg=value
       print(value)
       end
})
PetSection:AddToggle({
   Name="Buy egg",
   Callback=function(bool)
       getgenv().settings["egg"]=bool
       if bool and selectedEgg then
       buyEgg(tostring(selectedEgg))
       end
   end
})
local selectedEgg2
PetSection:AddDropdown({
   Name="Shard egg to buy",
   List={"Click Me","Evil Vegete Star","Serparu Star","Freezie Star","Chima King Star"},
   Callback=function(value)
       selectedEgg2=value
       print(value)
       end
})
PetSection:AddToggle({
   Name="Buy egg",
   Callback=function(bool)
       getgenv().settings["eggShard"]=bool
       if bool and selectedEgg2 then
       buyShardEgg(tostring(selectedEgg2))
       end
   end
})
local selectedWorld
local selectedWorld2
Other:AddDropdown({
   Name="World to teleport (no boost)",
   List={"Click Me","Anime Village","Pirate Docks","Purple Forest","Shinobi Village","Spirit Society","Walled City","Narmek","Hero Academy","Stand City","Hunter Kingdom","Jiu Jitsu Sewers","The Sin Zone","Walled Arena"},
   Callback=function(value)
       selectedWorld2=value
       print(value)
   end
})
Other:AddButton({
   Name="Teleport",
   Callback=function()
       if selectedWorld then
       teleportWorld(tostring(selectedWorld2))
       end
   end
})
Other:AddDropdown({
   Name="World to teleport (boost, owned)",
   List={"Click Me","Anime Village","Pirate Docks","Purple Forest","Shinobi Village","Spirit Society","Walled City","Narmek","Hero Academy","Stand City","Hunter Kingdom","Jiu Jitsu Sewers","The Sin Zone","Walled Arena"},
   Callback=function(value)
       selectedWorld=value
       print(value)
   end
})
Other:AddButton({
   Name="Teleport",
   Callback=function()
       if selectedWorld then
       teleport(tostring(selectedWorld))
       end
   end
})
Other:AddSlider({
    Name="Walkspeed",
    Value=16,
    Min=16,
    Max=1000,
    Callback=function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=value
    end
})
Other:AddSlider({
    Name="Jump power",
    Value=50,
    Min=50,
    Max=1000,
    Callback=function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower=value
    end
})
Other:AddButton({
Name="Optimize game (lag reduction)",
Callback=function()
lagReduce()
end
})
