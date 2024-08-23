print("Fast Travel System - Server-Side Loading...")
BB_Fast_Travel = BB_Fast_Travel or {}

if BB_Fast_Travel.FastDL then 
resource.AddFile("resource/fonts/Raleway-Light.ttf")
end 

util.AddNetworkString("FastTravel_Client_Derma")
util.AddNetworkString("FastTravel_Server_Teleport")

local CoolDown_Player = {}
net.Receive("FastTravel_Server_Teleport", function(_, ply)
    if not IsValid(ply) then return end 
    if CoolDown_Player[ply:SteamID64()] then 
        if CoolDown_Player[ply:SteamID64()] > CurTime() then 
        ply:ChatPrint(BB_Fast_Travel.CoolDown_Message)
        return 
        end
    end 
    CoolDown_Player[ply:SteamID64()] = CurTime() + BB_Fast_Travel.CoolDown_Seconds
    local geteyetraceentity = ply:GetEyeTrace().Entity
    if not IsValid(geteyetraceentity) then return end
    if geteyetraceentity:GetClass() != "fast_travel_entity" then return end 
    local ent = net.ReadEntity()
    if not IsValid(ent) then return end 
    if ent == geteyetraceentity then return end 
    if ent:GetClass() != "fast_travel_entity" then return end 
    if geteyetraceentity:GetPos():Distance(ply:GetPos()) > 150 then return end 

    ply:SetPos(ent:GetPos() + ent:GetForward() * 100)
    ply:EmitSound("ambient/machines/teleport3.wav", 45)
end)
