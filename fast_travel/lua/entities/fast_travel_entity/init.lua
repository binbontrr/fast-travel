
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

function ENT:Initialize()
	self:SetModel( "models/xqm/podremake.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )
    self:SetUseType( SIMPLE_USE )

    local physObj = self:GetPhysicsObject()
	if ( physObj:IsValid() ) then
		physObj:Wake()
	end
end

local CoolDown = {}
function ENT:Use( ply )
    if not (IsValid(ply)) then return end 
    if CoolDown[ply:SteamID64()] then 
		if CoolDown[ply] > CurTime() then 
			ply:ChatPrint("Slow Down!")
		return 
		end 
	end 

	CoolDown[ply:SteamID64()] = CurTime() + 0.3
	net.Start("FastTravel_Client_Derma")
	net.Send(ply)
end 
