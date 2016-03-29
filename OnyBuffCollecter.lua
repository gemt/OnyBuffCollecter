local Frame = CreateFrame("FRAME");
Frame:RegisterEvent("CHAT_MSG_YELL");
Frame:SetScript("OnEvent", function () ChatParse_EventHandler(event, arg1, arg2) end)


function ChatParse_EventHandler(event, text, player)

	if event != "CHAT_MSG_YELL" then return
	
	if player != "Overlord Runthak" then return
	
	_print("Got yell from Overlord Runthak!")
	_print(text)
	
end

--Prints a message in the default chatframe.
--Only visible to you.
local function _print( msg )
    if not DEFAULT_CHAT_FRAME then return end
    DEFAULT_CHAT_FRAME:AddMessage ( msg )
    ChatFrame3:AddMessage ( msg )
    ChatFrame4:AddMessage ( msg )
end