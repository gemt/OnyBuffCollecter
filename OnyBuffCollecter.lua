local Frame = CreateFrame("FRAME");
Frame:RegisterEvent("CHAT_MSG_YELL");
Frame:SetScript("OnEvent", function () ChatParse_EventHandler(event, arg1, arg2) end)

local start_str = "People of the Horde, citizens of Orgrimmar, come, gather round and celebrate heroes of the Horde. On this day, "
local end_str = ", under the auspicies of our glorious Warchief, laid a mortal blow against the Black Dragonflight. The brood mother. Onyxia, has been slain!"
function ChatParse_EventHandler(event, text, player)

	if event != "CHAT_MSG_YELL" then return
	
	if player != "Overlord Runthak" then return
	
	_print("Got yell from Overlord Runthak!")
	_print(text)
	
	local without_start = string.gsub(text,start_str, "")
	local without_all = string.gsub(without_start, end_str, "")
	_print(without_all)
	
end

--Prints a message in the default chatframe.
--Only visible to you.
local function _print( msg )
    if not DEFAULT_CHAT_FRAME then return end
    DEFAULT_CHAT_FRAME:AddMessage ( msg )
    ChatFrame3:AddMessage ( msg )
    ChatFrame4:AddMessage ( msg )
end