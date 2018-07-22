wifi.setmode(wifi.STATION)
wifi.setphymode(wifi.PHYMODE_B)
station_cfg={}
station_cfg.ssid="presence"
station_cfg.pwd="solfatara"
station_cfg.save=true
wifi.sta.config(station_cfg)

tmr.alarm(1,1000, 1, function() if wifi.sta.getip()==nil then print(" Wait for IP address!") else print("New IP address is "..wifi.sta.getip()) tmr.stop(1)  dofile('iot.lua') end end)