Config = scriptConfig("TwistedFate", "AlbinoTwistedFate")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Wred", "Use W(Red card)", SCRIPT_PARAM_ONOFF, false)
Config.addParam("Wblue", "Use W(Blue card)", SCRIPT_PARAM_ONOFF, false)
Config.addParam("Wyellow", "Use W(Gold card)", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R(Nothing yet)", SCRIPT_PARAM_ONOFF, false)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))
PrintChat("<font color=\"#6699ff\"><b>[AlbinoScripts]: Champion '"..myHeroName.."' V1 - </b></font> <font color=\"#FFFFFF\">Loaded successfully :^D</font>")
PrintChat("<font color=\"#6699ff\"><b>[AlbinoScripts]: Please leave any feedback and suggestions on the thread!</b></font>")

	
OnLoop(function(myHero)
	if Config.Combo then
	    if waitTickCount > GetTickCount() then return end
		local target = GetTarget(600)
		local mousePos = GetMousePos()
		local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1000,250,GetCastRange(myHero,_Q),40,false,true)
		
		if Config.Q and ValidTarget(target,GetCastRange(myHero,_Q)) then
		if CanUseSpell(myHero,_Q) == READY and QPred.HitChance == 1 then
		   CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)				
		end	
		end
			
	    if Config.W and ValidTarget(target,GetCastRange(myHero,_Q)) then
		if CanUseSpell(myHero,_W) == READY and GetCastName(myHero,_W) == "PickACard" then
		
		 CastSpell(_W)
		 		waitTickCount = GetTickCount() + 400
		end
		end
		
		if Config.Wyellow then
		if CanUseSpell(myHero,_W) == READY and GetCastName(myHero,_W) == "goldcardlock" then
		CastSpell(_W)
		end
		end
				if Config.Wred then
		if CanUseSpell(myHero,_W) == READY and GetCastName(myHero,_W) == "redcardlock" then
		CastSpell(_W)
		end
		end
				if Config.Wblue then
		if CanUseSpell(myHero,_W) == READY and GetCastName(myHero,_W) == "bluecardlock" then
		CastSpell(_W)
		end
		end
		
	end
	
end)
