print("Fast Travel System - Client-Side Loading...")

BB_Fast_Travel = BB_Fast_Travel or {}

surface.CreateFont("Fast_Travel_Derma_Font",{
	font = "Arial",
	extended = true,
    antialias = true,
    shadow = true,
	size = 30
})

local function Fast_Travel_Derma()
    local Frame = vgui.Create( "DFrame" )
    Frame:SetPos( 5, 5 ) 
    Frame:SetSize( 300, 550 ) 
    Frame:SetTitle( "" ) 
    Frame:SetVisible( true ) 
    Frame:Center()
    Frame:SetDraggable( false ) 
    Frame:ShowCloseButton( true ) 
    Frame:MakePopup()
    function Frame:Paint(w, h) 
        draw.RoundedBox( 5, 0, 0, w, h, Color( 34, 34, 34) )
    end

    local DScrollPanel = vgui.Create( "DScrollPanel", Frame )
    DScrollPanel:SetSize( 280,425 )
    DScrollPanel:SetPos(10,100)
    function DScrollPanel:Paint( w, h )
        draw.RoundedBox( 5, 0, 0, w, h, Color( 41, 41, 41) )
    end

    local number = 0
    local currentistat = 0
    local lpeyetrace = LocalPlayer():GetEyeTrace().Entity

    for i, ent in ipairs(ents.FindByClass("fast_travel_entity")) do
        number = number + 1
        if lpeyetrace == ent then 
            currentistat = number
            continue 
        end
	    local DButton = DScrollPanel:Add( "DButton" )
        local pos = tostring(ent:GetPos():Distance(LocalPlayer():GetPos()))
	    DButton:SetText("Fast Travel #"..number.." ("..string.StripExtension( pos ) ..")")
	    DButton:Dock( TOP )
	    DButton:SetTextColor(Color(255,255,255))	
	    DButton:DockMargin( 5, 5, 5, 5 )
        DButton:SetSize(50,50)
	    DButton:SetFont("Fast_Travel_Derma_Font")
	    DButton.DoClick = function() 
		net.Start("FastTravel_Server_Teleport")
        net.WriteEntity(ent)
		net.SendToServer()
        Frame:Remove()
	    end
	    function DButton:Paint( w, h )
		    draw.RoundedBox( 5, 0, 0, w, h, Color( 51, 51, 51) )
	    end
    end

local DLabel = vgui.Create( "DLabel", Frame )
DLabel:SetPos( 10, 10 )
DLabel:SetFont("Fast_Travel_Derma_Font")
DLabel:SetText( "Current Station: #"..currentistat )
DLabel:SetSize(500,100)

end
net.Receive("FastTravel_Client_Derma", Fast_Travel_Derma)