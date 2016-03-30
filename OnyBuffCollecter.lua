local Frame = CreateFrame("FRAME");
--Frame:RegisterEvent("CHAT_MSG_YELL");
Frame:RegisterEvent("CHAT_MSG_MONSTER_EMOTE");
Frame:RegisterEvent("CHAT_MSG_MONSTER_PARTY");
Frame:RegisterEvent("CHAT_MSG_MONSTER_SAY");
Frame:RegisterEvent("CHAT_MSG_MONSTER_WHISPER");
Frame:RegisterEvent("CHAT_MSG_MONSTER_YELL");

Frame:SetScript("OnEvent", function () OnyBuffCollecter_EventHandler(event, arg1, arg2) end)

local start_str = "People of the Horde, citizens of Orgrimmar, come, gather round and celebrate heroes of the Horde. On this day, "
local end_str = ", under the auspices of our glorious Warchief, laid a mortal blow against the Black Dragonflight. The brood mother, Onyxia, has been slain!"

function OnyBuffCollecter_EventHandler(event, text, player)
	_print(event)
	if player ~= "Overlord Runthak" then
		_print("not overlord, returning")
		return
	end
	
	local first10 = string.sub(text,1,6)
	_print(first10)
	if first10 ~= "People" then 
		_print("notmatch")
		return 
	end
	
	local without_start = string.gsub(text,start_str, "")
	local without_all = string.gsub(without_start, end_str, "")
	
	_print("wo all: "..without_all)
	_print("time: "..GetTime())
	local hours,minutes=GetGameTime()
	_print(hours..":"..minutes)
	_print(without_all.." used ony buff at "..hours..":"..minutes)
end

function ony_buff_collector_test()
	_print("test success")
end

--Prints a message in the default chatframe.
--Only visible to you.
local function _print( msg )
    if not DEFAULT_CHAT_FRAME then return end
    DEFAULT_CHAT_FRAME:AddMessage ( msg )
    ChatFrame3:AddMessage ( msg )
    ChatFrame4:AddMessage ( msg )
end