hook.Add("EntityEmitSound","NPC_HalfLife2_FootstepFix",function(soundData)
	local ent = soundData.Entity
	local snd = soundData.SoundName
	local level = soundData.SoundLevel
	local vol = soundData.Volume
	local pitch = soundData.Pitch
	if ent:IsNPC() then
		local class = ent:GetClass()
		if class == "npc_citizen" then
			if string.find(snd,"/footsteps/") then
				-- local dirt = string.find(snd,"dirt")
				-- local grass = string.find(snd,"grass")
				-- local gravel = string.find(snd,"gravel")
				-- local mud = string.find(snd,"mud")
				-- local snow = string.find(snd,"snow")
				-- local sand = string.find(snd,"sand")
				-- local makeVeryStrangeSound = (dirt or grass or gravel or mud or snow or sand)
				local tbl = {
					"npc/footsteps/hardboot_generic1.wav",
					"npc/footsteps/hardboot_generic2.wav",
					"npc/footsteps/hardboot_generic3.wav",
					"npc/footsteps/hardboot_generic4.wav",
					"npc/footsteps/hardboot_generic5.wav",
					"npc/footsteps/hardboot_generic6.wav",
					"npc/footsteps/hardboot_generic8.wav",
				}
				-- if makeVeryStrangeSound then
					-- table.insert(tbl,"npc/footsteps/softshoe_generic6.wav")
				-- end
				local newSnd = tbl[math.random(1,#tbl)]
				sound.Play(newSnd,ent:GetPos(),level,pitch,vol)
				return false
			end
		end
		if class == "npc_combine_s" then
			if string.find(snd,"/footsteps/") then
				sound.Play("npc/combine_soldier/gear" .. math.random(1,6) .. ".wav",ent:GetPos(),level,pitch,vol)
				return false
			end
		end
		if class == "npc_metropolice" then
			if string.find(snd,"/footsteps/") then
				sound.Play("npc/metropolice/gear" .. math.random(1,6) .. ".wav",ent:GetPos(),level,pitch,vol)
				return false
			end
		end
		if class == "npc_stalker" then
			if string.find(snd,"/footsteps/") then
				local ovSnd = math.random(1,2) == 1 && "npc/stalker/stalker_footstep_left" .. math.random(1,2) .. ".wav" or "npc/stalker/stalker_footstep_right" .. math.random(1,2) .. ".wav"
				sound.Play(ovSnd,ent:GetPos(),level,pitch,vol)
				return false
			end
		end
		if class == "npc_zombine" then
			if string.find(snd,"/footsteps/") then
				sound.Play("npc/zombine/gear" .. math.random(1,3) .. ".wav",ent:GetPos(),level,pitch,vol)
				return false
			end
			if string.find(snd,"/zombie/foot") then
				sound.Play("npc/zombine/gear" .. math.random(1,3) .. ".wav",ent:GetPos(),level,pitch,vol)
				return false
			end
		end
	end
end)