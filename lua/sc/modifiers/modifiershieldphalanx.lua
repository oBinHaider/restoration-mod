if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	ModifierShieldPhalanx.default_value = "spawn_chance"
	ModifierShieldPhalanx.shields = {
		Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
		Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"),
		Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_heavy_shield/ene_zeal_heavy_shield")
	}

	--JUST IN CASE, we do not want these guys breaking the fucking spawn cap
	function ModifierShieldPhalanx:init(data)
		ModifierShieldPhalanx.super.init(data)

	--damn captain flags
		tweak_data.group_ai.unit_categories.CS_shield.is_captain = false
		tweak_data.group_ai.unit_categories.FBI_shield.is_captain = false
	end

	function ModifierShieldPhalanx:modify_value(id, value)
		if id == "GroupAIStateBesiege:SpawningUnit" then
			local is_shield = table.contains(ModifierShieldPhalanx.shields, value)
			if is_shield and math.random(0,100) < 15 then
				return Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			end
		end
		return value
	end

end