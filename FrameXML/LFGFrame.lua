local F, C = unpack(select(2, ...))

tinsert(C.modules["Aurora"], function()
	LFGDungeonReadyDialogBackground:Hide()
	LFGDungeonReadyDialogBottomArt:Hide()
	LFGDungeonReadyDialogFiligree:Hide()

	LFGDungeonReadyDialogRoleIconTexture:SetTexture(C.media.roleIcons)
	LFGDungeonReadyDialogRoleIconLeaderIcon:SetTexture(C.media.roleIcons)
	LFGDungeonReadyDialogRoleIconLeaderIcon:SetTexCoord(0, 0.296875, 0.015625, 0.2875)

	do
		local leaderBg = F.CreateBG(LFGDungeonReadyDialogRoleIconLeaderIcon)
		leaderBg:SetDrawLayer("ARTWORK", 2)
		leaderBg:SetPoint("TOPLEFT", LFGDungeonReadyDialogRoleIconLeaderIcon, 2, 0)
		leaderBg:SetPoint("BOTTOMRIGHT", LFGDungeonReadyDialogRoleIconLeaderIcon, -3, 4)
	end

	for i = 1, 2 do
		local reward = _G["LFGDungeonReadyDialogRewardsFrameReward"..i]
		local border = _G["LFGDungeonReadyDialogRewardsFrameReward"..i.."Border"]

		reward.texture:SetTexCoord(.08, .92, .08, .92)

		border:SetTexture(0, 0, 0)
		border:SetDrawLayer("BACKGROUND")
		border:SetPoint("TOPLEFT", reward.texture, -1, 1)
		border:SetPoint("BOTTOMRIGHT", reward.texture, 1, -1)
	end

	do
		local left = LFGDungeonReadyDialogRoleIcon:CreateTexture(nil, "OVERLAY")
		left:SetWidth(1)
		left:SetTexture(C.media.backdrop)
		left:SetVertexColor(0, 0, 0)
		left:SetPoint("TOPLEFT", 9, -7)
		left:SetPoint("BOTTOMLEFT", 9, 10)

		local right = LFGDungeonReadyDialogRoleIcon:CreateTexture(nil, "OVERLAY")
		right:SetWidth(1)
		right:SetTexture(C.media.backdrop)
		right:SetVertexColor(0, 0, 0)
		right:SetPoint("TOPRIGHT", -8, -7)
		right:SetPoint("BOTTOMRIGHT", -8, 10)

		local top = LFGDungeonReadyDialogRoleIcon:CreateTexture(nil, "OVERLAY")
		top:SetHeight(1)
		top:SetTexture(C.media.backdrop)
		top:SetVertexColor(0, 0, 0)
		top:SetPoint("TOPLEFT", 9, -7)
		top:SetPoint("TOPRIGHT", -8, -7)

		local bottom = LFGDungeonReadyDialogRoleIcon:CreateTexture(nil, "OVERLAY")
		bottom:SetHeight(1)
		bottom:SetTexture(C.media.backdrop)
		bottom:SetVertexColor(0, 0, 0)
		bottom:SetPoint("BOTTOMLEFT", 9, 10)
		bottom:SetPoint("BOTTOMRIGHT", -8, 10)
	end

	hooksecurefunc("LFGDungeonReadyDialogReward_SetMisc", function(button)
		button.texture:SetTexture("Interface\\Icons\\inv_misc_coin_02")
	end)

	hooksecurefunc("LFGDungeonReadyDialogReward_SetReward", function(button, dungeonID, rewardIndex, rewardType, rewardArg)
		local name, texturePath, quantity
		if rewardType == "reward" then
			name, texturePath, quantity = GetLFGDungeonRewardInfo(dungeonID, rewardIndex);
		elseif rewardType == "shortage" then
			name, texturePath, quantity = GetLFGDungeonShortageRewardInfo(dungeonID, rewardArg, rewardIndex);
		end
		if texturePath then
			button.texture:SetTexture(texturePath)
		end
	end)

	F.CreateBD(LFGDungeonReadyDialog)
	LFGDungeonReadyDialog.SetBackdrop = F.dummy
	F.CreateSD(LFGDungeonReadyDialog)
	F.CreateBD(LFGInvitePopup)
	F.CreateSD(LFGInvitePopup)
	F.CreateBD(LFGDungeonReadyStatus)
	F.CreateSD(LFGDungeonReadyStatus)

	F.Reskin(LFGDungeonReadyDialogEnterDungeonButton)
	F.Reskin(LFGDungeonReadyDialogLeaveQueueButton)
	F.Reskin(LFGInvitePopupAcceptButton)
	F.Reskin(LFGInvitePopupDeclineButton)
	F.ReskinClose(LFGDungeonReadyDialogCloseButton)
	F.ReskinClose(LFGDungeonReadyStatusCloseButton)

	for _, roleButton in pairs({LFDQueueFrameRoleButtonTank, LFDQueueFrameRoleButtonHealer, LFDQueueFrameRoleButtonDPS, LFDQueueFrameRoleButtonLeader, LFRQueueFrameRoleButtonTank, LFRQueueFrameRoleButtonHealer, LFRQueueFrameRoleButtonDPS, RaidFinderQueueFrameRoleButtonTank, RaidFinderQueueFrameRoleButtonHealer, RaidFinderQueueFrameRoleButtonDPS, RaidFinderQueueFrameRoleButtonLeader}) do
		if roleButton.background then
			roleButton.background:SetTexture("")
		end

		roleButton.cover:SetTexture(C.media.roleIcons)
		roleButton:SetNormalTexture(C.media.roleIcons)

		roleButton.checkButton:SetFrameLevel(roleButton:GetFrameLevel() + 2)

		for i = 1, 2 do
			local left = roleButton:CreateTexture(nil, "OVERLAY")
			left:SetWidth(1)
			left:SetTexture(C.media.backdrop)
			left:SetVertexColor(0, 0, 0)
			left:SetPoint("TOPLEFT", roleButton, 6, -5)
			left:SetPoint("BOTTOMLEFT", roleButton, 6, 7)
			roleButton["leftLine"..i] = left

			local right = roleButton:CreateTexture(nil, "OVERLAY")
			right:SetWidth(1)
			right:SetTexture(C.media.backdrop)
			right:SetVertexColor(0, 0, 0)
			right:SetPoint("TOPRIGHT", roleButton, -6, -5)
			right:SetPoint("BOTTOMRIGHT", roleButton, -6, 7)
			roleButton["rightLine"..i] = right

			local top = roleButton:CreateTexture(nil, "OVERLAY")
			top:SetHeight(1)
			top:SetTexture(C.media.backdrop)
			top:SetVertexColor(0, 0, 0)
			top:SetPoint("TOPLEFT", roleButton, 6, -5)
			top:SetPoint("TOPRIGHT", roleButton, -6, -5)
			roleButton["topLine"..i] = top

			local bottom = roleButton:CreateTexture(nil, "OVERLAY")
			bottom:SetHeight(1)
			bottom:SetTexture(C.media.backdrop)
			bottom:SetVertexColor(0, 0, 0)
			bottom:SetPoint("BOTTOMLEFT", roleButton, 6, 7)
			bottom:SetPoint("BOTTOMRIGHT", roleButton, -6, 7)
			roleButton["bottomLine"..i] = bottom
		end

		local shortageBorder = roleButton.shortageBorder
		if shortageBorder then
			local icon = roleButton.incentiveIcon

			shortageBorder:SetTexture("")

			icon.border:SetTexture(0, 0, 0)
			icon.border:SetDrawLayer("BACKGROUND")
			icon.border:SetPoint("TOPLEFT", icon.texture, -1, 1)
			icon.border:SetPoint("BOTTOMRIGHT", icon.texture, 1, -1)

			icon:SetPoint("BOTTOMRIGHT", 3, -3)
			icon:SetSize(14, 14)
			icon.texture:SetSize(14, 14)
			icon.texture:SetTexCoord(.12, .88, .12, .88)
		end

		F.ReskinCheck(roleButton.checkButton)
	end

	for _, roleButton in pairs({LFDRoleCheckPopupRoleButtonTank, LFDRoleCheckPopupRoleButtonHealer, LFDRoleCheckPopupRoleButtonDPS, LFGInvitePopupRoleButtonTank, LFGInvitePopupRoleButtonHealer, LFGInvitePopupRoleButtonDPS}) do
		roleButton.cover:SetTexture(C.media.roleIcons)
		roleButton:SetNormalTexture(C.media.roleIcons)

		roleButton.checkButton:SetFrameLevel(roleButton:GetFrameLevel() + 2)

		for i = 1, 2 do
			local left = roleButton:CreateTexture(nil, "OVERLAY")
			left:SetWidth(1)
			left:SetTexture(C.media.backdrop)
			left:SetVertexColor(0, 0, 0)
			left:SetPoint("TOPLEFT", roleButton, 9, -7)
			left:SetPoint("BOTTOMLEFT", roleButton, 9, 11)
			roleButton["leftLine"..i] = left

			local right = roleButton:CreateTexture(nil, "OVERLAY")
			right:SetWidth(1)
			right:SetTexture(C.media.backdrop)
			right:SetVertexColor(0, 0, 0)
			right:SetPoint("TOPRIGHT", roleButton, -9, -7)
			right:SetPoint("BOTTOMRIGHT", roleButton, -9, 11)
			roleButton["rightLine"..i] = right

			local top = roleButton:CreateTexture(nil, "OVERLAY")
			top:SetHeight(1)
			top:SetTexture(C.media.backdrop)
			top:SetVertexColor(0, 0, 0)
			top:SetPoint("TOPLEFT", roleButton, 9, -7)
			top:SetPoint("TOPRIGHT", roleButton, -9, -7)
			roleButton["topLine"..i] = top

			local bottom = roleButton:CreateTexture(nil, "OVERLAY")
			bottom:SetHeight(1)
			bottom:SetTexture(C.media.backdrop)
			bottom:SetVertexColor(0, 0, 0)
			bottom:SetPoint("BOTTOMLEFT", roleButton, 9, 11)
			bottom:SetPoint("BOTTOMRIGHT", roleButton, -9, 11)
			roleButton["bottomLine"..i] = bottom
		end

		F.ReskinCheck(roleButton.checkButton)
	end

	do
		local roleButtons = {LFGDungeonReadyStatusGroupedTank, LFGDungeonReadyStatusGroupedHealer, LFGDungeonReadyStatusGroupedDamager, LFGDungeonReadyStatusRolelessReady}

		for i = 1, 5 do
			tinsert(roleButtons, _G["LFGDungeonReadyStatusIndividualPlayer"..i])
		end

		for _, roleButton in pairs(roleButtons) do
			roleButton.texture:SetTexture(C.media.roleIcons)

			local left = roleButton:CreateTexture(nil, "OVERLAY")
			left:SetWidth(1)
			left:SetTexture(C.media.backdrop)
			left:SetVertexColor(0, 0, 0)
			left:SetPoint("TOPLEFT", 7, -6)
			left:SetPoint("BOTTOMLEFT", 7, 8)

			local right = roleButton:CreateTexture(nil, "OVERLAY")
			right:SetWidth(1)
			right:SetTexture(C.media.backdrop)
			right:SetVertexColor(0, 0, 0)
			right:SetPoint("TOPRIGHT", -7, -6)
			right:SetPoint("BOTTOMRIGHT", -7, 8)

			local top = roleButton:CreateTexture(nil, "OVERLAY")
			top:SetHeight(1)
			top:SetTexture(C.media.backdrop)
			top:SetVertexColor(0, 0, 0)
			top:SetPoint("TOPLEFT", 7, -6)
			top:SetPoint("TOPRIGHT", -7, -6)

			local bottom = roleButton:CreateTexture(nil, "OVERLAY")
			bottom:SetHeight(1)
			bottom:SetTexture(C.media.backdrop)
			bottom:SetVertexColor(0, 0, 0)
			bottom:SetPoint("BOTTOMLEFT", 7, 8)
			bottom:SetPoint("BOTTOMRIGHT", -7, 8)
		end
	end

	LFGDungeonReadyStatusRolelessReady.texture:SetTexCoord(0.5234375, 0.78750, 0, 0.25875)

	hooksecurefunc("LFG_SetRoleIconIncentive", function(roleButton, incentiveIndex)
		if incentiveIndex then
			local tex
			if incentiveIndex == LFG_ROLE_SHORTAGE_PLENTIFUL then
				tex = "Interface\\Icons\\INV_Misc_Coin_19"
			elseif incentiveIndex == LFG_ROLE_SHORTAGE_UNCOMMON then
				tex = "Interface\\Icons\\INV_Misc_Coin_18"
			elseif incentiveIndex == LFG_ROLE_SHORTAGE_RARE then
				tex = "Interface\\Icons\\INV_Misc_Coin_17"
			end
			roleButton.incentiveIcon.texture:SetTexture(tex)
			roleButton.leftLine2:Show()
			roleButton.rightLine2:Show()
			roleButton.topLine2:Show()
			roleButton.bottomLine2:Show()
		else
			roleButton.leftLine2:Hide()
			roleButton.rightLine2:Hide()
			roleButton.topLine2:Hide()
			roleButton.bottomLine2:Hide()
		end
	end)

	hooksecurefunc("LFG_PermanentlyDisableRoleButton", function(button)
		if button.shortageBorder then
			button.leftLine2:SetVertexColor(.5, .45, .03)
			button.rightLine2:SetVertexColor(.5, .45, .03)
			button.topLine2:SetVertexColor(.5, .45, .03)
			button.bottomLine2:SetVertexColor(.5, .45, .03)
		end
	end)

	hooksecurefunc("LFG_DisableRoleButton", function(button)
		if button.shortageBorder then
			button.leftLine2:SetVertexColor(.5, .45, .03)
			button.rightLine2:SetVertexColor(.5, .45, .03)
			button.topLine2:SetVertexColor(.5, .45, .03)
			button.bottomLine2:SetVertexColor(.5, .45, .03)
		end
	end)

	hooksecurefunc("LFG_EnableRoleButton", function(button)
		if button.shortageBorder then
			button.leftLine2:SetVertexColor(1, .9, .06)
			button.rightLine2:SetVertexColor(1, .9, .06)
			button.topLine2:SetVertexColor(1, .9, .06)
			button.bottomLine2:SetVertexColor(1, .9, .06)
		end
	end)
end)