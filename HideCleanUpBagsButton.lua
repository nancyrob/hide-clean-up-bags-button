-- Slash Command Handler
function HCUBB_SlashCmdHandler( msg )
	if not HCUBB_SAVEDVARIABLES then
		HCUBB_SAVEDVARIABLES = {};
	end
	--
	if msg == "bank hide" then
		HCUBB_SAVEDVARIABLES["bank"] = "hide";
		BankItemAutoSortButton:Hide();
		BankItemAutoSortButton:Show();
		print( "Hiding clean up bank/reagent bank button" );
	elseif msg == "bank show" then
		HCUBB_SAVEDVARIABLES["bank"] = "show";
		BankItemSearchBox:SetWidth( 124 );
		BankItemSearchBox:SetPoint( "TOPRIGHT", "$parent", "TOPRIGHT", -44, -33 );
		BankItemAutoSortButton:Show();
		print( "Showing clean up bank/reagent bank button" );
	else
		print( NORMAL_FONT_COLOR_CODE .. "Hide Clean Up Bags Button" .. FONT_COLOR_CODE_CLOSE );
		print( NORMAL_FONT_COLOR_CODE .. "- /hcubb bank hide" .. FONT_COLOR_CODE_CLOSE );
		print( NORMAL_FONT_COLOR_CODE .. "- /hcubb bank show" .. FONT_COLOR_CODE_CLOSE );
	end
end

-- Slash Command List
SLASH_HCUBB1 = "/hidecleanupbagsbutton";
SLASH_HCUBB2 = "/hcubb";
SlashCmdList["HCUBB"] = HCUBB_SlashCmdHandler;

-- Clean Up Bags Button
BagItemAutoSortButton:HookScript( "OnShow", function( self )
	BagItemSearchBox:SetWidth( 124 );
	self:Hide();
end );

-- Clean Up Bank/Reagent Bank Button
BankItemAutoSortButton:HookScript( "OnShow", function( self )
	if not HCUBB_SAVEDVARIABLES or HCUBB_SAVEDVARIABLES["bank"] == "hide" then
		BankItemSearchBox:SetWidth( 124 );
		BankItemSearchBox:SetPoint( "TOPRIGHT", "$parent", "TOPRIGHT", -15, -33 );
		self:Hide();
	end
end );
