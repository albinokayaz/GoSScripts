Config = scriptConfig("Tryndamere", "AlbinoTrynda")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))
PrintChat("<font color=\"#6699ff\"><b>[AlbinoScripts]: Champion '"..myHeroName.."' - </b></font> <font color=\"#FFFFFF\">Loaded.</font>")

OnLoop(function(myHero)
	if Config.Combo then
	
		local target = GetTarget(600)
		local mousePos = GetMousePos()
		local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1300,0,GetCastRange(myHero,_E),93,false,true)
		
		if (GetCurrentHP(myHero)/GetMaxHP(myHero)) < 0.13 and Config.R then
		if CanUseSpell(myHero,_R) == READY then
		 CastSpell(_R)
		end
		end
		
		if Config.E and ValidTarget(target,GetCastRange(myHero,_E)) then
		if CanUseSpell(myHero,_E) == READY and EPred.HitChance == 1 then
		   CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)				
		end	
		end
		
		if Config.W and ValidTarget(target,GetCastRange(myHero,_W)) and not IsInDistance(target, 300) and IsInDistance(target,GetCastRange(myHero,_W)) then
		if CanUseSpell(myHero, _W) == READY then
           CastSpell(_W)
		end
		end
			
		if (GetCurrentHP(myHero)/GetMaxHP(myHero)) < 0.50 and Config.Q then
		if CanUseSpell(myHero,_Q) == READY then
		 CastSpell(_Q)
		end
		end
		
	end
	
end)
