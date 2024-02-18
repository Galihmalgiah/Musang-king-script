

 local proxy = {} 
 local command = {} 
 local user = {} 
 local config = {} 
 proxy.dev = "awa" 
 proxy.name = "pVr.com" 
 proxy.version = "v1.2" 
 proxy.support = "undefined" 
 proxy.password = "awa" 
 proxy.error = "`4[ERROR]`` " 
 proxy.log = "`2[wayaze.com]`` " 
 proxy.logn = "`6[wayaze.com]`` " 
 proxy.errlogin = "Please login to use the proxy. - /login [password]"
 local PlayerList = {}
 local doLogSpin = {}
 local nPlayerList = {}
 local ndoLog = {}
  
  
 -- main user vars 
 user.haslogin = false
 user.ltax = 0
  
  
 -- comamnd vars
 command.var = {} 
 command.var.test = "hello" 
 command.var.invis = false 
 command.var.gforg = false
 command.var.wrenchpull = false
 command.var.savedworld = false
 command.var.rfspin = true
 
  
  
 -- config vars 
 config.lang = "en"
 
 -- checkbox vars
 local gforgg
 local drtitle
 local mod
 local rfspin = true
 local wrenchp
 local wrenchk
 local wrenchb
 local reme
 local qeme
 
 
  
  
 -- custom funcs 
 function errc(str) 
   logToConsole(proxy.error .. str) 
 end 
  
 function plog(str) 
   logToConsole(proxy.log .. str) 
 end 
  
 function plogn(str) 
   logToConsole(proxy.logn .. str) 
 end 
  
 function user_changename(name) 
   sendVariant({ 
           [0] = "OnNameChanged", 
       [1] = name, 
   }, getLocal().netid, 100) 
 end 
  
 function user_oninvis() 
   sendVariant({ 
     [0] = "OnSetClothing", 
     [1] = {0,0,0}, 
     [2] = {0,0,0}, 
     [3] = {0,0,0}, 
     [4] = 2, 
     [5] = {0, 0, 0}, 
   },getLocal().netid,100) 
 end 
  
 function user_deinvis() 
   sendVariant({ 
     [0] = "OnSetClothing", 
     [1] = {0,0,0}, 
     [2] = {0,0,0}, 
     [3] = {0,0,0}, 
     [4] = -1, 
     [5] = {0, 0, 0}, 
   },getLocal().netid,100) 
 end 
  
 function user_skincolor(num) 
   sendVariant({ 
     [0] = "OnSetClothing", 
     [1] = {0,0,0}, 
     [2] = {0,0,0}, 
     [3] = {0,0,0}, 
     [4] = num, 
     [5] = {0, 0, 0}, 
   },getLocal().netid,100) 
 end 
  
 function user_ong4g() 
   sendVariant({ 
     [0] = "OnCountryState", 
     [1] = "id|donor", 
   },getLocal().netid) 
 end 
  
 function user_deg4g() 
   sendVariant({ 
     [0] = "OnCountryState", 
     [1] = "id|tr", 
   },getLocal().netid) 
 end
 
 function dropLock(id, amount) 
     for _,item in pairs(getInventory()) do 
         if item.id == 242 or item.id == 1796 then 
             if item.amount < amount then 
                 if id == 242 then 
                     sendPacketRaw(false,{ 
                         type = 10, 
                         value = 1796, 
                     }) 
                 sleep(200) 
                 elseif id == 1796 then 
                     sendPacketRaw(false,{ 
                         type = 10, 
                         value = 242, 
                     }) 
                 sleep(200) 
                 end 
             end 
         end 
     end 
     sendPacket(2, "action|drop\n|itemID|" .. id) 
     sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. id .. "|\ncount|" .. amount) 
 end 
 
 
 function tr()
        sendVariant({
            [0] = "OnCountryState",
            [1] = "tr|idks",
            },getLocal().netid)
        uidchangedlog = getLocal().userid
end

function fr()
        sendVariant({
            [0] = "OnCountryState",
            [1] = "fr|jobs",
            },getLocal().netid)
        uidchangedlog = getLocal().userid
end

function iq()
        sendVariant({
            [0] = "OnCountryState",
            [1] = "iq|ggs",
            },getLocal().netid)
        uidchangedlog = getLocal().userid
end
function jp()
        sendVariant({
            [0] = "OnCountryState",
            [1] = "jp|idk",
            },getLocal().netid)
        uidchangedlog = getLocal().userid
end

function br()
        sendVariant({
            [0] = "OnCountryState",
            [1] = "br|hhh",
            },getLocal().netid)
        uidchangedlog = getLocal().userid
end

function my()
        sendVariant({
            [0] = "OnCountryState",
            [1] = "my|hhhs",
            },getLocal().netid)
        uidchangedlog = getLocal().userid
end
  
 function showHelp() 
   sendVariant({ 
           [0] = "OnDialogRequest", 
       [1] = help, 
   }, -1, 100) 
 end 
  
 function sendVisualMessage(str) 
   sendVariant({ 
           [0] = "OnTalkBubble", 
       [1] = str, 
   }, -1, 100) 
 end 
  
 function GetRealName(id)
    for _, g in pairs(GetPlayerlist()) do
        if g.netid == id then
            return g.name
        end
    end
end

function GetName(id)
    for _, name in pairs(PlayerList) do
        if name.netid == id then
            return name.name
        end
    end
end
 
 function multiboxChecker(boolean)
    local hasil = ""
    if boolean then
        hasil = "1"
        else
            hasil = "0"
    end
    return hasil
 end
 
 function tOverlay(str)
   sendVariant({
   	[0] = "OnTextOverlay",
       [1] = str,
   }, getLocal().netid)
 end
 
 function qemefunc(number)
    if number >= 10 then
        hasil = string.sub(number, -1)
    else
        hasil = number
    end
    return hasil
end

function getGame(num)
    if reme and not qeme then
        return "`2[R:"..remefunc(tonumber(num)).."]"
    elseif not reme and qeme then
            return "`2[Q:"..qemefunc(tonumber(num)).."]"
    elseif reme and qeme then
            return "`2[R:"..remefunc(num).." and Q:"..qemefunc(num).."]"
            else
                return ""
    end
end

function remefunc(number)
    if number == 19 or number == 28 or number == 0 then
        hasil = 0
    else
        num1 = math.floor(number / 10)
        num2 = number % 10
        hasil = string.sub(tostring(num1 + num2), -1)
    end
    return hasil
end

function checkLock(num)
    bglcheck = math.floor(num / 10000)
    dlcheck = math.floor((num % 10000) / 100)
    wlcheck = num % 100
    result = ""
    if bglcheck > 0 then
        result = bglcheck .. "Blue Gem Lock"
    end
    if dlcheck > 0 then
        result = result .. dlcheck .. "Diamond Lock"
    end
    if wlcheck > 0 or result == "" then
        result = result .. wlcheck .. "World Lock"
    end
    return result
end

function mathss(a,maxvalue)
    if tonumber(a) and tonumber(maxvalue) then
        return (maxvalue*a)/100
    end
    return false
end

function dropWls()
  for b,c in pairs(getInventory()) do
    if c.id == 242 then
      sendPacket(2, "action|drop\n|itemID|242") 
      sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|242|\ncount|".. c.amount) 
    end
  end
end

function dropDls()
  for b,c in pairs(getInventory()) do
    if c.id == 1796 then
      sendPacket(2, "action|drop\n|itemID|1796") 
      sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|1796|\ncount|".. c.amount) 
    end
  end
end

function dropBgls()
  for b,c in pairs(getInventory()) do
    if c.id == 7188 then
      sendPacket(2, "action|drop\n|itemID|7188") 
      sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|7188|\ncount|".. c.amount) 
    end
  end
end

function filterspin(id)
    filterdoLog = {}
    for _,log in pairs(doLogSpin) do
        if log.netid == id then
            table.insert(filterdoLog,"\nadd_label_with_icon|small|"..log.spin.."|left|758|\n")
        end
    end
    sendVariant({
                [0] = "OnDialogRequest",
                [1] = "add_label_with_icon|big|`7"..GetName(id).." Spin: |left|32|\nadd_spacer|small|\n"..table.concat(filterdoLog).."\nadd_quick_exit|||\nend_dialog|spinfilter|Close||",
                },-1,200)
end

function logspin()
    dialogSpin = {}
    for _,spin in pairs(doLogSpin) do
        table.insert(dialogSpin,spin.spin)
    end
    sendVariant({
        [0] = "OnDialogRequest",
        [1] = "add_label_with_icon|big|doLog Spin|left|758|\nadd_spacer|small|\nadd_smalltext|Click The Wheel Button For Filter Player You Need|\n"..table.concat(dialogSpin).."\nadd_quick_exit|||\nend_dialog|world_spin|Close||",
        },-1,200)
end

function AddOrUpdatePlayer(name, netid)
    if PlayerList[netid] == nil or PlayerList[netid].name ~= name then
        PlayerList[netid] = {name = name, netid = netid}
    end
end
 
 
 
 
  
  
 -- DIALOGS 
help = string.format([[ 
set_default_color|`7 
add_label_with_icon|big|`2[wayaze.com]`` Commands Gazette              |left|11816| 
add_spacer|small| 
add_label_with_icon|small|`3Commands:|left|18| 
add_textbox|`6/cname`` [changes your nickname]|| 
add_textbox|`6/invis`` [you become invisible]|| 
add_textbox|`6/scolor`` [you change your skin color]|| 
add_textbox|`6/wd`` [drop wl (if u have)]|| 
add_textbox|`6/dd`` [drop dl (if u have)]|| 
add_textbox|`6/bd`` [drop bgl (if u have)]||
add_textbox|`6/daw`` [drop all wls/dls/bgls (if u have)]||
add_textbox|`6/w`` [warping world]||
add_textbox|`6/save`` [Saves the world name you are in (warping system)]||
add_textbox|`6/back`` [You warp into the world you saved]||
add_textbox|`6/relog`` [re-login]||
add_textbox|`6/cd`` [custom drop locks]||
add_textbox|`6/settax`` [sets `6/cd ``command tax]||
add_textbox|`6/spinlog`` [show roulette spin log]||
add_textbox|`6/gscan`` [Shows world/floating item list]||
add_textbox|`6/addgems`` [adds visual gems]||
add_textbox|`6/fakeban ``[Fake Ban 730 days]||
add_textbox|`6/fakesb ``[Fake `4HIDDEN ``SB]||
add_textbox|`6/cskin ``[changes your skin colour]||
add_spacer|big|
add_label_with_icon|big|`6Other:|left|1660|
add_spacer|small|
add_button_with_icon|proxywrenchm|`wExtra Cheats|staticYellowFrame|7190|
add_button_with_icon|BackToMenu|`w  Growscan  |staticYellowFrame|6016|
add_button_with_icon|proxycredits|`wContributors|staticYellowFrame|11304|
add_button_with_icon|proxylogspin|`w  Spin doLog  |staticYellowFrame|758|
add_button_with_icon|proxyend|`wCountry List|staticYellowFrame|3394|
add_button_with_icon|proxytitle|`w   Titles    |staticYellowFrame|11816|
add_button_with_icon||END_LIST|noflags|0||
add_spacer|big| 
add_smalltext|ı Thanks for using `#Way Proxy``| 
add_smalltext|Coded by `6@secret ``|
add_spacer|big| 
add_quick_exit||| 
end_dialog|proxymenu|Close||
]])

loginp = string.format([[
add_label_with_icon|big|`4wayaze.com   |left|11816|
add_spacer|small|
add_image_button|banner|interface/large/news_banner.rttex|bannerlayout|OPENSURVEY|
add_spacer|small|
add_label_with_icon|small|`2Proxy Version 2.1|left|2376|
add_smalltext|`9This Is The Best Updates :)|left|
add_spacer|small|
add_label_with_icon|small|`9Please Do Not Resell My Script
|left|7786|
add_spacer|small|
add_label_with_icon|small|`cChangelogs And New Patch|left|3524|
add_smalltext|`2[+] `wAdded Dialogs for some command|left|
add_smalltext|`2[+] `wAdded Improvement On fixes|left|
add_smalltext|`2[+] `wAdded /cskin for changing skin colour|left|
add_spacer|small|
add_smalltext|`cHow To doLogin?|
add_spacer|small|
add_smalltext|`c/login `woxe|
add_spacer|small|
add_quick_exit|||
end_dialog|loginpend||Thanks|
]])

cr = string.format([[
set_default_color|`7
add_label_with_icon|big|`2[wayaze.com]`` Contributors          |left|11304|
add_spacer|big|
add_textbox|- oxeway `6[OWN]||
add_spacer|small|
end_dialog|proxycredits|Close|Okay|
]])

ltitle = string.format([[
set_default_color|`7
add_label_with_icon|big|`2[wayaze.com]``Titles          |left|11304|
add_spacer|small|
add_textbox|`6/g4g`` [Grow4good Title]||
add_textbox|`6/doctor`` [Doctor Title]||
add_textbox|`6/max`` [Level Max Title]||
add_textbox|`6/mentor`` [Mentor Title]||
add_spacer|small|
end_dialog|proxytitle|Close|Okay|
]])

lcountry = string.format([[
set_default_color|`7
add_label_with_icon|big|``List Country Gazette                |left|3394|
add_spacer|small|
add_textbox|`0/jp `9(JAPANS)|left|2480
add_textbox|`0/tr `9(TURK)|left|2480
add_textbox|`0/fr `9(FRANCE)|left|2480
add_textbox|`0/iq `9(IQ+?)|left|2480
add_textbox|`0/br `9(BRAZIL)|left|2480
add_textbox|`0/my `9(MALAYSIA)|left|2480
add_quick_exit|
end_dialog|proxyend|Cancel|Okay|
]]) 

    
    
AddHook("onTextPacket","Vartr",function(type,pkt)
if pkt:find("/tr") then
tr(pkt:match("/tr"))
end
end)
AddHook("onTextPacket","Varjp",function(type,pkt)
if pkt:find("/jp") then
jp(pkt:match("/jp"))
end
end)
AddHook("onTextPacket","Varswe",function(type,pkt)
if pkt:find("/br") then
br(pkt:match("/br"))
end
end)
AddHook("onTextPacket","Varmy",function(type,pkt)
if pkt:find("/my") then
my(pkt:match("/my"))
end
end)
AddHook("onTextPacket","Varyou",function(type,pkt)
if pkt:find("/fr") then
fr(pkt:match("/fr"))
end
end)
AddHook("onTextPacket","Varhate",function(type,pkt)
if pkt:find("/iq") then
iq(pkt:match("/iq"))
end
end)
  
 -- PROXY MAIN 
 AddHook("onTextPacket", "on_events", function(type, packet) 
   clog = "action|input\n|text|" 
  
   -- /login command 
   if packet:find("/login") then 
     if user.haslogin == false then 
     str = packet:gsub("action|input\n|text|/login ", "") 
     if str == "" then 
       errc("Please enter the proxy password - /login [password]") 
     else if str == proxy.password then 
       user.haslogin = true 
       plog("You are logged in! welcome "..getLocal().name)

     else 
       errc("Invalid password..") 
     end 
     end 
     else 
       errc("You are already logged in.") 
     end 
     return true 
   end 
  


  
  -- checkboxs
  if user.haslogin == true then
  if packet:find("g4gt|0") then
    gforgg = false
    sendVariant({ 
     [0] = "OnCountryState", 
     [1] = "id|tr", 
   },getLocal().netid) 
  else if packet:find("g4gt|1") then
    gforgg = true
    sendVariant({ 
     [0] = "OnCountryState", 
     [1] = "id|donor", 
   },getLocal().netid) 
    plog("Grow4Good title `2enabled.")
    return true
  end
  end
  if packet:find("drt|1") then
    drtitle = true
    plog("`4Dr. ``title `2enabled.")
    sendVariant({
            [0] = "OnNameChanged",
            [1] = "Dr."..getLocal().name,
        },getLocal().netid)
        sendVariant({
            [0] = "OnCountryState",
            [1] = "jp|doctor",
        },getLocal().netid)
        
  else if packet:find("drt|0") then
    drtitle = false
    nick = getLocal().name
    sendVariant({
            [0] = "OnNameChanged",
            [1] = nick:gsub("Dr%.", ""),
        },getLocal().netid)
        sendVariant({
            [0] = "OnCountryState",
            [1] = "id|tr",
        },getLocal().netid)
  end
  end
  if packet:find("mdetect|1") then
    mod = true
    plog("Invisible moderator detection `2enabled.")
  else if packet:find("mdetect|0") then
    mod = false
  end
  end
  if packet:find("realfakespin|1") then
    rfspin = true
    plog("`2REAL``-`4FAKE`` spin detection `2enabled.")
  else if packet:find("realfakespin|0") then
    rfspin = false
  end
  end
  if packet:find("wrenchpmode|1") then
    wrenchp = true
    plog("Wrench pull `2enabled.")
  else if packet:find("wrenchpmode|0") then
    wrenchp = false
  end
  end
  if packet:find("wrenchkmode|1") then
    wrenchk = true
    plog("Wrench kick `2enabled.")
  else if packet:find("wrenchkmode|0") then
    wrenchk = false
  end
  end
  if packet:find("gamereme|1") then
    reme = true
    plog("Reme checker `2enabled")
  else if packet:find("gamereme|0") then
    reme = false
  end
  end
  if packet:find("gameqeme|1") then
    qeme = true
    plog("Qeme checker `2enabled")
  else if packet:find("gameqeme|0") then
    qeme = false
  end
  end
  if packet:find("wrenchbmode|1") then
    wrenchb = true
    plog("Wrench ban `2enabled.")
  else if packet:find("wrenchbmode|0") then
    wrenchb = false
  end
  end
  if packet:find("dialog_name|world_spin\nbuttonClicked|(%d+)") then
        netid = packet:match("buttonClicked|(%d+)")
        filterspin(tonumber(netid))
    end
  
  
  
  
  end -- user.haslogin
  
  
function pkt(type, str)
  if str:find("/addgems (%d+)") then
        g = str:match("/addgems (%d+)")
        setan = {}
        setan[0] = "OnSetBux"
        setan[1] = tonumber(g)
        sendVariant(setan)
        logToConsole("`$Successfully Added `#"..g.."  `$Gems")
        return true
  end
end
AddHook("onTextPacket", "gem", pkt)

function pkt(type, packet)
if packet:find("/fakeban") then
sendVariant({
  [0] = "OnAddNotification", 
  [1] = "interface/atomic_button.rttex", 
  [2] = "Warning from `4System``: You've been `4BANNED`` from `wGrowtopia`` for 60 days", 
  [3] = "audio/hub_open.wav", 
  [4] = {0}, 
})
sendVariant({
  [0] = "OnReconnect"},-1)
end
end
AddHook("onTextPacket", "Hookied", pkt)


function pkt(type, str)
  if str:find("/fakesb (.+)") then
        a = str:match("/fakesb (.+)")
        logToConsole("CP:0_PL:4_OID:_CT:[SB]_ `5** from `5(```7"..getLocal().name.."`5) `5in [`4HIDDEN`5] ** : ```$`^`0"..a.."``")
        ontext("`3Sending `4Fake Sb")
        return true
  end
end
AddHook("onTextPacket", "fakesb", pkt)
  
  
  function ef(type,packet)
     if packet:find("/g4g") then
     sendVariant({
         [0] = "OnTextOverlay",
         [1] = "`2Enabled title `1Grow `2for `3good"
     })
       nami = getLocal().name:gsub("Dr.", "")
         sendVariant({
            [0] = "OnCountryState",
            [1] = "kr|donor",
         },getLocal().netid)
         sendVariant({
           [0] = "OnNameChanged",
           [1] = nami,           
       },getLocal().netid,
        100)
        return true
     end
     
     if packet:find("/doctor") then
     sendVariant({
         [0] = "OnTextOverlay",
         [1] = "`2Enabled title `4Doctor"
     })
       nami = getLocal().name:gsub("Dr.", "")
         sendVariant({
            [0] = "OnCountryState",
            [1] = "kr|doctor",
         },getLocal().netid)
         sendVariant({
           [0] = "OnNameChanged",
           [1] = "Dr."..nami,           
       },getLocal().netid,
        100)
        return true
     end
     
     if packet:find("/max") then
     sendVariant({
         [0] = "OnTextOverlay",
         [1] = "`2Enabled title `3Max Level"
     })
       nami = getLocal().name:gsub("Dr.", "")
         sendVariant({
            [0] = "OnCountryState",
            [1] = "kr|maxLevel",
         },getLocal().netid)
         sendVariant({
           [0] = "OnNameChanged",
           [1] = nami,           
       },getLocal().netid,
        100)
        return true
     end
     
     if packet:find("/mentor") then
     sendVariant({
         [0] = "OnTextOverlay",
         [1] = "`2Enabled title `8Master"
     })
       nami = getLocal().name:gsub("Dr.", "")
         sendVariant({
            [0] = "OnCountryState",
            [1] = "kr|master",
         },getLocal().netid)
         sendVariant({
           [0] = "OnNameChanged",
           [1] = nami,           
       },getLocal().netid,
        100)
        return true
     end
end
AddHook("onTextPacket","a", ef)


   -- /proxy command 
   if packet:find("/proxy") then 
     if user.haslogin == true then 
       showHelp() 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
   if packet:find("buttonClicked|listcommand") then
         if user.haslogin == true then
         sendVariant({ 
             [0] = "OnDialogRequest", 
             [1] = help, 
         },-1,100)
         else
         errc(proxy.errlogin)
         end
         return true 
   end
   if packet:find("buttonClicked|proxycredits") then
     sendVariant({
     	[0] = "OnDialogRequest",
         [1] = cr,
     }, -1, 100)
   end
   if packet:find("buttonClicked|proxytitle") then
     sendVariant({
     	[0] = "OnDialogRequest",
         [1] = ltitle,
     }, -1, 100)
   end
   if packet:find("buttonClicked|proxyend") then
     sendVariant({
     	[0] = "OnDialogRequest",
         [1] = lcountry,
     }, -1, 100)
   end
   if packet:find("buttonClicked|proxyafw") then
     sendVariant({
     	[0] = "OnDialogRequest",
         [1] = afw,
     }, -1, 100)
   end
   if packet:find("buttonClicked|proxyuserdetail") then
     sendVariant({
     	[0] = "OnDialogRequest",
         [1] = pudetails,
     }, -1, 100)
   end
   if packet:find("buttonClicked|proxylogspin") then
     logspin()
   end
   if packet:find("buttonClicked|proxywrenchm") then
     gforg = multiboxChecker(gforgg)
     drt = multiboxChecker(drtitle)
     modd = multiboxChecker(mod)
     realfakes = multiboxChecker(rfspin)
     wrenchpull = multiboxChecker(wrenchp)
     wrenchkick = multiboxChecker(wrenchk)
     wrenchban = multiboxChecker(wrenchb)
     remeg = multiboxChecker(reme)
     qemeg = multiboxChecker(qeme)
     
     sendVariant({
     	[0] = "OnDialogRequest",
         [1] = [[
add_label_with_icon|big|``Extra Cheats       |left|11816|
add_spacer|big|
add_label_with_icon|small|`6Titles|left|9472|
add_spacer|small|
add_checkbox|g4gt|Grow4Good Title|]]..gforg..[[|
add_checkbox|drt|`4Dr.`` Title|]]..drt..[[|
add_spacer|small|
add_label_with_icon|small|`6Casino|left|758|
add_spacer|small|
add_checkbox|realfakespin|`2REAL``-`4FAKE`` Spin Detection|]]..realfakes..[[|
add_checkbox|gamereme|Reme Checker|]]..remeg..[[|
add_checkbox|gameqeme|Qeme Checker|]]..qemeg..[[|
add_spacer|small|
add_label_with_icon|small|`6Wrench Modes|left|32|
add_spacer|small|
add_checkbox|wrenchpmode|Wrench Pull|]]..wrenchpull..[[|
add_checkbox|wrenchkmode|Wrench Kick|]]..wrenchkick..[[|
add_checkbox|wrenchbmode|Wrench Ban|]]..wrenchban..[[|
add_spacer|small|
add_label_with_icon|small|`6Other|left|2380|
add_checkbox|mdetect|Invisible Moderator Detection|]]..modd..[[|
add_spacer|big|
end_dialog|proxywrenchend|Close|Set|
]],
     }, -1, 500)
   end
  
  
   -- /cname command 
   if packet:find("/cname (.+)") then 
     q = packet:match("/cname (.+)")
     if user.haslogin == true then 
       user_changename(packet:match("/cname (.+)")) 
       logToConsole("`wSuccessfully Changed Name to : ```$`^`0"..q.."``")
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
   
   -- /cskin command 
   if packet:find("/cskin (%d+)") then 
     yu = packet:match("/cskin (%d+)")
     if user.haslogin == true then 
       user_skincolor(packet:match("/cskin (%d+)")) 
       logToConsole("`wSuccessfully Changed Skin Colour to : ```$`^`0"..yu.."``")
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
  
  
   -- /invis command 
   if packet:find("/invis") then 
     if user.haslogin == true then 
       if command.var.invis == false then 
         user_oninvis() 
         command.var.invis = true 
         plog("Invisible mode `2enabled") 
       else if command.var.invis == true then 
         command.var.invis = false 
         user_deinvis() 
         plog("Invisible mode `4disabled") 
       end 
       end 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
  
  
   -- /scolor command 
   if packet:find("/scolor") then 
     if user.haslogin == true then 
       str = packet:gsub("action|input\n|text|/scolor", "") 
       if str == "" then 
         errc("Please enter the skin color - /scolor [number]") 
       else 
         user_skincolor(str) 
         plog("Changed skin color `2ID: "..str) 
       end 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
  
  
   -- /wd command 
   if packet:find("/wd") then 
     if user.haslogin == true then 
       str = packet:gsub("action|input\n|text|/wd", "") 
       if str == "" then 
         errc("Please enter the amount to drop") 
       else 
         sendPacket(2, "action|drop\n|itemID|242") 
         sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|242|\ncount|"..str) 
         plog("dropped `0"..str.." `0World Lock") 
       end 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
  
  
   -- /dd command 
   if packet:find("/dd") then 
     if user.haslogin == true then 
       str = packet:gsub("action|input\n|text|/dd", "") 
       if str == "" then 
         errc("Please enter the amount to drop") 
       else 
         sendPacket(2, "action|drop\n|itemID|1796") 
         sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|1796|\ncount|"..str) 
         plog("dropped `0"..str.." `0Diamond Lock") 
       end 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end 
  
  
   -- /bd command 
   if packet:find("/bd") then 
     if user.haslogin == true then 
       str = packet:gsub("action|input\n|text|/bd", "") 
       if str == "" then 
         errc("Please enter the amount to drop") 
       else 
         sendPacket(2, "action|drop\n|itemID|7188") 
         sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|7188|\ncount|"..str) 
         plog("dropped `0"..str.." `0Blue Gem Lock") 
       end 
     else 
       errc(proxy.errlogin) 
     end 
     return true 
   end
   
   
   -- /w command
   if packet:find("/w (.+)") then
     if user.haslogin == true then
       sendPacket(3, "action|join_request\nname|"..packet:match("/w (.+)").."\ninvitedWorld|0")
       tOverlay("Warping to `2"..packet:match("/w (.+)"))
       plog("Warping to `w"..packet:match("/w (.+)"))
     else
       errc(proxy.errlogin)
     end
     return true
   end
   
   
   -- /save & /back command
   if packet:find("/save") then
     if user.haslogin == true then
       command.var.savedworld = GetWorld().name
       plog("World saved `w"..GetWorld().name)
     else
       err(proxy.errlogin)
     end
     return true
   end
   if packet:find("/back") then
     if user.haslogin == true then
       sendPacket(3, "action|join_request\nname|"..command.var.savedworld.."\ninvitedWorld|0")
       plog("Warping to `w"..command.var.savedworld)
     else
       errc(proxy.errlogin)
     end
     return true
   end
   
   
   -- /relog command 
   if packet:find("/relog") then
     if user.haslogin == true then
       sendPacket(3, "action|quit")
       plog("Reloged.")
     else
       errc(proxy.errlogin)
     end
     return true
   end
   
   
   -- /cd command
   if packet:find("/cd (%d+)") then
     if user.haslogin == true then
       tableLock = {}
       tax = mathss(user.ltax,tonumber(packet:match("/cd (%d+)")))
       amount = tonumber(packet:match("/cd (%d+)")) - tax
       bgl = amount // 10000
       dl = amount % 10000 // 100
       wl = ((amount % 10000) % 100)
       dropLock(7188,bgl)
       dropLock(1796,dl)
       dropLock(242,wl)
       plog("Dropped "..checkLock(amount))
     else
       errc(proxy.errlogin)
     end
     return true
   end
   
   
   -- /settax command
   if packet:find("/settax (%d+)") then
     if user.haslogin == true then
       user.ltax = tonumber(packet:match("/settax (%d+)"))
       plog("Tax has been set successfully: `w"..user.ltax)
     else
       errc(proxy.errlogin)
     end
     return true
   end
   
   
   -- /daw command
   if packet:find("/daw") then
     if user.haslogin == true then
       dropWls()
       dropDls()
       dropBgls()
       plog("Dropped all locks.")
     else
       errc(proxy.errlogin)
     end
     return true
   end
   
   
   -- /spinlog command
   if packet:find("/spinlog") then
     if user.haslogin == true then
       logspin()
     else
       errc(proxy.errlogin)
     end
     return true
   end
   
   

   
   local function tileShit()
    local items = {}
    for _,obj in pairs(getTile()) do
        if items[obj.fg] == nil then
            items[obj.fg] = {id = obj.fg , count = 1}
        else
            items[obj.fg].count = items[obj.fg].count + 1
        end
        if items[obj.bg] == nil then
            items[obj.bg] = {id = obj.bg , count = 1}
        else
            items[obj.bg].count = items[obj.bg].count + 1
        end
    end
    table.remove(items,0)
    local dwi = ""
    for _, item  in pairs(items) do
        dwi = dwi .. item.id .. "," .. item.count .. ","
    end
    return dwi
end

local function objectShit()
    local items = {}
    for _,obj in pairs(getWorldObject()) do
        if items[obj.id] == nil then
            items[obj.id] = {id = obj.id , count = obj.amount}
        else
            items[obj.id].count = items[obj.id].count + obj.amount
        end
    end
    local dwi = ""
    for _, item in pairs(items) do
        dwi = dwi .. item.id .. "," .. item.count .. ","
    end
    return dwi
end

local dialog = {
    menu = [[set_default_color|`o
add_label_with_icon|big|`wWorld Stats``|left|6016|
add_spacer|small|
add_button|tileDwi|World Blocks|noflags|0|0|
add_button|objectDwi|Floating items|noflags|0|0|
add_spacer|small|
end_dialog|statsblock|Cancel||]],
    list = function(itm)
        return [[set_default_color|`o
add_label_with_icon|big|`wItems List``|left|6016|
add_spacer|small|
add_label_with_icon_button_list|small|`w%s : %s|left|findTile_|itemIDseed2tree_itemAmount|]] .. itm .. [[
add_spacer|small|
add_spacer|small|
add_button|BackToMenu|Back|noflags|0|0|
embed_data|DialogDwi|0
end_dialog|statsblock|Cancel||
]]
    end,
}


local function growscan(types,str)
    if str:find("/gscan") or str:find("BackToMenu") then
        sendVariant({[0] = "OnDialogRequest", [1]= dialog.menu}, -1, 100)
    elseif str:find("tileDwi") then
        sendVariant({[0] = "OnDialogRequest", [1]= dialog.list(tileShit())}, -1, 100)
    elseif str:find("objectDwi") then
        sendVariant({[0] = "OnDialogRequest", [1]= dialog.list(objectShit())}, -1, 100)
    elseif str:find("findObject") or str:find("findTile") then
        logToConsole("sadly you cannot do that")
    else
        return false
    end
    return true
end

AddHook("onTextPacket","gs",growscan)
   
   
   
   -- -- -- -- ( WRENCH MODES ) -- -- -- --
   -- pull & kick & ban
   if packet:find("action|wrench\n|netid|(%d+)") then 
     netid = packet:match("action|wrench\n|netid|(%d+)")
     if netid ~= getLocal().netid then
       if wrenchp then
         sendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..netid.."|\nnetID|"..netid.."|\nbuttonClicked|pull")
         return true
       end
     
       if wrenchk then
         sendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..netid.."|\nnetID|"..netid.."|\nbuttonClicked|kick")
         return true
       end
       
       if wrenchb then
         sendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..netid.."|\nnetID|"..netid.."|\nbuttonClicked|worldban")
         return true
       end
     
     end
   end
   
   
   
   return false
end)
  
  
  
  
  
 -- ON_VARIANT 
 AddHook("onVarlist", "variants", function(var) 
   if user.haslogin == true then 
     varcontent = var[1] 
     if var[0] == "OnConsoleMessage" then 
       plogn(varcontent) 
       return true 
     end
   end
  
  
     if var[0] == "OnDialogRequest" and var[1]:find("end_dialog|socialportal") then 
         sendVariant({ 
             [0] = "OnDialogRequest", 
             [1] = var[1]:gsub("(add_button|trade_history|`wTrade History``|noflags|0|0|)", "%1\nadd_button|listcommand|`wCommands Gazette|\nadd_button|proxycredits|`wContributors|\nadd_button|proxyend|`wList Country|\nadd_button|proxylogspin|`wdoLog Spin|0|0|"), 
         },-1,100) 
         return true 
     end
     
     
     if var[0] == "OnDialogRequest" and var[1]:find("drop_item") then
        if var[1]:find("World Lock") or var[1]:find("Diamond Lock") or var[1]:find("Blue Gem Lock") then
            return true
        end
    end
    
    
    if mod == true then
      if var[1] == "OnSpawn" then
        if var[2] == "invis|1" then
          plog("Invisible `#@Moderator`` Joined!!")
          sendVariant({
          	[0] = "OnTextOverlay",
              [1] = "`4[WARNING] `w INVISIBLE `#@MODERATOR `wJOINED",
          }, getLocal().netid)
        end
      end
    end
    
    
    if rfspin == true then
      if var[0] == "OnTalkBubble" then
        if var[2]:find("spun the wheel") then
          local fakem = "CT:"
          if var[2]:find(fakem) then
            sendVariant({
            	[0] = "OnTalkBubble",
                [1] = var[1],
                [2] = "`7[ `4FAKE`` ] " .. var[2]:match("player_chat=(.+)"),
            }, -1)
            table.insert(doLogSpin,{spin = "\nadd_label_with_icon_button|small|`7[`4 FAKE ``] "..var[2].."|left|758|"..var[1].."|\n",netid = var[1]})
            return true
          else
          if var[1] ~= getLocal().netid then
            table.insert(PlayerList, {name = var[2]:match("`7%[``(.+) spun the"), netid = var[1]})
            else
            AddOrUpdatePlayer(getLocal().name:gsub("%[(.+)%]",""),var[1])
          end
            local num = string.gsub(string.gsub(var[2]:match("and got (.+)"), "!%]", ""), "`", "")
            local onlynumber = string.sub(num, 2)
            local clearspace = string.gsub(onlynumber, " ", "")
            local h = string.gsub(string.gsub(clearspace, "!7", ""), "]", "")
            sendVariant({
            	[0] = "OnTalkBubble",
                [1] = var[1],
                [2] = "`7[ `2REAL`` ] " .. var[2].." "..getGame(tonumber(h)),
                [3] = 0,
            }, -1)
            table.insert(doLogSpin,{spin = "\nadd_label_with_icon_button|small|`7[`2REAL``] "..var[2].."|left|758|"..var[1].."|\n",netid = var[1]})
            return true
          end
          return true
        end
      end
      return false
    end
    
    
    
    
    
    
    
 end) 
  
  
 sendVariant({ 
         [0] = "OnDialogRequest", 
         [1] = loginp, 
 }, -1, 100)13
