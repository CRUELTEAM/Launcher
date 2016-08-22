package.path = package.path .. ';.luarocks/share/lua/5.2/?.lua'
  ..';.luarocks/share/lua/5.2/?/init.lua'
package.cpath = package.cpath .. ';.luarocks/lib/lua/5.2/?.so'
URL = require('socket.url')
JSON = require('dkjson')
HTTPS = require('ssl.https')
dofile('utilities.lua')
----config----
local bot_api_key = "266744247:AAEWzWC7P03ll1KGridXMQmLOZYKtCRs4VI" --BOT TOKEN تو کن ربات خود را در اینجا قرار دهید
local BASE_URL = "https://api.telegram.org/bot"..bot_api_key
function sendRequest(url)
  local dat, res = HTTPS.request(url)
  local tab = JSON.decode(dat)
  if res ~= 200 then
    return false, res
  end
  if not tab.ok then
    return false, tab.description
  end
  return tab
end
function getMe()
    local url = BASE_URL .. '/getMe'
  return sendRequest(url)
end
function getUpdates(offset)
  local url = BASE_URL .. '/getUpdates?timeout=20'
  if offset then
    url = url .. '&offset=' .. offset
  end
  return sendRequest(url)
end
function sendMessage(chat_id, text, disable_web_page_preview, reply_to_message_id, use_markdown)
	local url = BASE_URL .. '/sendMessage?chat_id=' .. chat_id .. '&text=' .. URL.escape(text)
	if disable_web_page_preview == true then
		url = url .. '&disable_web_page_preview=true'
	end
	if reply_to_message_id then
		url = url .. '&reply_to_message_id=' .. reply_to_message_id
	end
	if use_markdown then
		url = url .. '&parse_mode=Markdown'
	end
	return sendRequest(url)
end
function bot_run()
	bot = nil
	while not bot do 
		bot = getMe()
	end
	bot = bot.result
  if not add then
		add = load_data('mico.db')
	end
	if not ban then
		ban = load_data('ban.db')
	end
	local bot_info = "Username = @"..bot.username.."\nName = "..bot.first_name.."\nID = "..bot.id.." \nLauncher bot \n\nCreate by CRUEL TEAM\nsudo : @IT_MKH"
	print(bot_info)
	last_update = last_update or 0
 currect_folder = ""
 is_running = true
	math.randomseed(os.time())
	math.random()
	last_cron = last_cron or os.date('%M', os.time())
	is_started = true 
  add.id = add.id or {} 
  ban.id = ban.id or {}
  add.broadcast = add.broadcast or {} 
end
function msg_processor(msg)
if msg.text == '/start' then
sendMessage(msg.chat.id,'bot running ...',true)
local oo = io.popen('cd .. ; cd TeleSeed ; killall screen ; killall tmux ; killall telegram-cli ; tmux new-session -s script "bash steady.sh -t" ')
		end
	end


bot_run() 
while is_running do 
	local response = getUpdates(last_update+1) 
	if response then
		for i,v in ipairs(response.result) do
			last_update = v.update_id
			msg_processor(v.message)
		end
	else
		print("Conection failed")
	end
if last_cron ~= os.date('%M', os.time()) then 
		last_cron = os.date('%M', os.time())
		save_data('mico.db', add)
		save_data('ban.db', ban)
			end
end
save_data('mico.db', add)
save_data('ban.db', ban)
print("Bot halted")
