clientID = 'hemrobot'
 
Token = 'BBFF-nJtz20fxIUjo5K0JY7xtXgo13EVY8m'
 
Device = 'hemrobot'
pin = 1
m = mqtt.Client(clientID, 120,Token)

function lars()
-- init the ws2812 module
ws2812.init(ws2812.MODE_SINGLE)
-- create a buffer, 60 LEDs with 3 color bytes
strip_buffer = ws2812.newBuffer(8, 3)
-- init the effects module, set color to red and start blinking
ws2812_effects.init(strip_buffer)
ws2812_effects.set_speed(210)
ws2812_effects.set_brightness(70)
ws2812_effects.set_color(0,255,0)
ws2812_effects.set_mode("larson_scanner")
ws2812_effects.start()
end


function read_temp()
status, temp, humi, temp_dec, humi_dec = dht.read(pin)
if status == dht.OK then
    -- Float firmware using this example
    print("DHT Temperature:"..temp..";".."Humidity:"..humi)

elseif status == dht.ERROR_CHECKSUM then
    print( "DHT Checksum error." )
elseif status == dht.ERROR_TIMEOUT then
    print( "DHT timed out." )
end
 
m:connect("things.ubidots.com", 1883, 2, function(client) print("connected") m:publish("/v1.6/devices/"..Device, '{"Temperature":"'..temp..'","Humidity":"'..humi..'"}', 2, 1) m:close() end)
	
end

lars()

tmr.alarm(1, 10000, tmr.ALARM_AUTO, function() read_temp(0) end)

