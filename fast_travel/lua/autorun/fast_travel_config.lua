print("Fast Travel System - Config-File Loading...")

BB_Fast_Travel = BB_Fast_Travel or {} -- don't touch

-------------------------------------

BB_Fast_Travel.FastDL = true 

BB_Fast_Travel.Title_Text = "Fast Travel"
BB_Fast_Travel.Text_Title_Color = Color(255,255,255)

BB_Fast_Travel.Desc_Text = "You can quickly go to other locations from here"
BB_Fast_Travel.Text_Desc_Color = Color(206,206,206)

BB_Fast_Travel.Box_Color = Color(41,41,41,96)

BB_Fast_Travel.CoolDown_Seconds = 30
BB_Fast_Travel.CoolDown_Message = "You are on cooldown now, please wait. ("..BB_Fast_Travel.CoolDown_Seconds.."s)"
