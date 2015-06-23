-- Slash Command Handler
function HCUBB_SlashCmdHandler( msg )
	if not HCUBB_SAVEDVARIABLES then
		HCUBB_SAVEDVARIABLES = {}; -- Initialize SavedVariables
	end
	--
	if msg == "bank hide" or msg == "bank show" then
		-- Hide or Show - Bank/Reagent Bank "Clean Up" button
		if msg == "bank hide" then
			HCUBB_SAVEDVARIABLES["bank"] = "hide";
		else
			HCUBB_SAVEDVARIABLES["bank"] = "show";
		end
		BankItemAutoSortButton:Hide(); -- Hide and Show to force OnShow script to fire
		BankItemAutoSortButton:Show(); -- ^
	else
		-- Print slash commands
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
	BagItemSearchBox:SetWidth( 124 ); -- Hide: SearchBox extended to cover where "Clean Up" button would normally appear
	self:Hide();
end );

-- Clean Up Bank/Reagent Bank Button
BankItemAutoSortButton:HookScript( "OnShow", function( self )
	if not HCUBB_SAVEDVARIABLES or HCUBB_SAVEDVARIABLES["bank"] == "hide" then
		BankItemSearchBox:SetPoint( "TOPRIGHT", "$parent", "TOPRIGHT", -15, -33 ); -- Hide: SearchBox moved to the right where "Clean Up" button would normally appear
		self:Hide();
	else
		BankItemSearchBox:SetPoint( "TOPRIGHT", "$parent", "TOPRIGHT", -44, -33 ); -- Show: SearchBox moved back to the left, into original position
	end
end );
