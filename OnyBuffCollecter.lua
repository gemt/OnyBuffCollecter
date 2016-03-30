local Frame 	= CreateFrame("FRAME");
Frame:RegisterEvent("CHAT_MSG_MONSTER_YELL");
Frame:RegisterEvent("ADDON_LOADED");

Frame:SetScript("OnEvent", function () OnyBuffCollecter_EventHandler(event, arg1, arg2) end)

--where we store data, hopefully
--OnyBuffCollector_data = nil


local start_str = "People of the Horde, citizens of Orgrimmar, come, gather round and celebrate heroes of the Horde. On this day, "
local end_str = ", under the auspices of our glorious Warchief, laid a mortal blow against the Black Dragonflight. The brood mother, Onyxia, has been slain!"

--local buff_table_index = 1

--OnyBuffCollector_buff_table = {}

function OnyBuffCollecter_EventHandler(event, text, player)
	--[[
	if event == "ADDON_LOADED" then
		if OnyBuffCollector_buff_table == nil then
			OnyBuffCollector_buff_table = {}
			--buff_table_index = 1
			_print("fresh savedVariables, initializing empty table")
		else
			_print("got some savedVariables, loading them!")
			while OnyBuffCollector_buff_table[i] ~= nil do
				--buff_table_index = buff_table_index + 1
			end		
		end
		return
	end
	]]--
	
	if event ~= "CHAT_MSG_MONSTER_YELL" then 
		return
	end
	
	if player ~= "Overlord Runthak" then
		return
	end
	
	local first10 = string.sub(text,1,6)
	if first10 ~= "People" then 
		return 
	end
	
	local without_start = string.gsub(text,start_str, "")
	local player_name = string.gsub(without_start, end_str, "")
	
	--announce in gchat because why not
	SendChatMessage("Automatic message: "..player_name.." just used an onyxia buff, buff incoming in 15 seconds!", "GUILD",nil, nil);
	
	save_buff(player_name)
	
end

function save_buff(player_name)
	--local hours,minutes=GetGameTime()
	local date_time_str = date()
	
	--just prepending instead, makes the savedVariables list nicer anyway
	table.insert(OnyBuffCollector_buff_table, 1, date_time_str);
	table.insert(OnyBuffCollector_buff_table, 1, player_name);
	
	--buff_table_index = buff_table_index + 1	
	--buff_table_index = buff_table_index + 1
		
	_print(player_name.." used ony buff at "..date_time_str)
end

function print_index()
	_print(buff_table_index)
end

function print_table()
	local i = 1
	while OnyBuffCollector_buff_table[i] ~= nil do
		_print(OnyBuffCollector_buff_table[i])
		i = i + 1
	end
end

function print_table_formatted()
	
	--[[
	if buff_table_index == 1 then 
		_print("no recorded buffs")
		return
	end
	local exclusive = buff_table_index - 1
	local remainder = exclusive - math.floor(exclusive / 2) * 2 --buff_table_index % 2, silly lua with no modulo
	if remainder ~= 0 then
		_print("bufftable index not dividable by 2, something has gone wrong! ("..exclusive..")")
		return
	end
	]]--
	
	_print("== start of print ==")
	local i = 1
	while OnyBuffCollector_buff_table[i] ~= nil and OnyBuffCollector_buff_table[i+1] ~= nil do
		_print(OnyBuffCollector_buff_table[i].." - "..OnyBuffCollector_buff_table[i+1])
		i = i + 2	
	end
	_print("== end of print ==")
	
end


--Prints a message in the default chatframe.
--Only visible to you.
local function _print( msg )
    if not DEFAULT_CHAT_FRAME then return end
    DEFAULT_CHAT_FRAME:AddMessage ( msg )
    ChatFrame3:AddMessage ( msg )
    ChatFrame4:AddMessage ( msg )
end