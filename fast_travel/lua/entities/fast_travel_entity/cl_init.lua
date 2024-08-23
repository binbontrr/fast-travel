include( "shared.lua" )

BB_Fast_Travel = BB_Fast_Travel or {}

local color_black = Color(0, 0, 0)

surface.CreateFont("Fast_Travel_Big_Font",{
	font = "Raleway Light",
	weight = 500,
	extended = true, 
    antialias = true,
    shadow = true,
	size = 130
})
surface.CreateFont("Fast_Travel_Small_Font",{
	font = "Raleway Light",
	extended = true,
    antialias = true,
    shadow = true,
	size = 50
})

function ENT:Draw()
	self:DrawModel()
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local distance = pos:Distance(LocalPlayer():GetPos())
	
	if distance > 800 then return end

	local Text_Title_Color = BB_Fast_Travel.Text_Title_Color
	local Text_Desc_Color = BB_Fast_Travel.Text_Desc_Color
	local Box_Color = BB_Fast_Travel.Box_Color

	Text_Title_Color.a = 800 - distance
	Text_Desc_Color.a = 800 - distance
	Box_Color.a = 600 - distance
    color_black.a = 800 - distance

	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 90)	

	cam.Start3D2D(pos + ang:Up() + ang:Right() * -90, Angle(0, self:GetAngles().y + 90, 90), 0.15)

    		draw.RoundedBoxEx(15,-425,-185,850,175,Box_Color,0,0,0,0)
            draw.SimpleTextOutlined(BB_Fast_Travel.Title_Text, "Fast_Travel_Big_Font", 0, -205, Text_Title_Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_LEFT, 2, color_black)
			draw.SimpleTextOutlined(BB_Fast_Travel.Desc_Text, "Fast_Travel_Small_Font", 0, -75, Text_Desc_Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_LEFT, 2, color_black) 

	cam.End3D2D()	
end