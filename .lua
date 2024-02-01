local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - #TurtleTeamOnTop")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Vote")

T1:Toggle("Auto shoot",false,function(value)
    _G.sht = value
end)

T2:Dropdown("Select mode",{"classic","twoteams","fourteams"},function(value)
    _G.vote = value
end)

T2:Toggle("Auto vote",false,function(value)
    _G.avt = value
    while wait() do
      if _G.avt == false then break end
      game:GetService("ReplicatedStorage")["RemoteEvent"]:FireServer({["name"] = "vote",["origin"] = "gamemodes"},{_G.vote})
    end
end)

lib:HookCalled(function(self,args)
    if self == "RemoteEvent" and args[1]["name"] == "targetReached" and args[1]["origin"] == "flaretargets" and _G.sht == true then
      args[2][1] = game:GetService("Players"):GetPlayers()[math.random(1,#game:GetService("Players"):GetPlayers())]
     return self.FireServer(self,unpack(args))
    elseif self == "RemoteEvent" and args[1]["name"] == "reached_notice" and args[1]["origin"] == "flaretargets" and _G.sht == true then
      args[2][1] = game:GetService("Players"):GetPlayers()[math.random(1,#game:GetService("Players"):GetPlayers())]
      return self.FireServer(self,unpack(args))
    elseif self == "NETWORK" and args[1] == "nextTarget" and _G.sht == true then
      args[2] = game:GetService("Players"):GetPlayers()[math.random(1,#game:GetService("Players"):GetPlayers())]
      return self.FireServer(self,unpack(args))
    end
end)
