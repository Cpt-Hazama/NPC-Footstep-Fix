hook.Add("EntityEmitSound","NPC_HalfLife2_FootstepFix",function(soundData) -- Mmm, how bizzare that such a simple thing can't be fixed by the GMod devs. Pathetic. When they "fixed" it as they said, all they did was make them play the citizen footstep sounds...How is that a fucking fix??
	local ent = soundData.Entity
	local snd = soundData.SoundName
	local level = soundData.SoundLevel
	local vol = soundData.Volume
	local pitch = soundData.Pitch
	if ent:IsNPC() then
		local class = ent:GetClass()
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