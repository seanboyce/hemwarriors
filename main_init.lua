wifi.setmode(wifi.SOFTAP)
wifi.setphymode(wifi.PHYMODE_B)
cfg={}
cfg.ssid="HEM"
cfg.pwd="toong126ntmk"
cfg.auth="3"
wifi.ap.config(cfg)

pwm.setup(1, 700, 0)
pwm.start(1)
pwm.setup(5, 700, 0)
pwm.start(5)

gpio.mode(0, gpio.OUTPUT)
gpio.mode(2, gpio.OUTPUT)

gpio.write(0, gpio.LOW)
gpio.write(2, gpio.LOW)



tmr.alarm(1,1000, 1, function() tmr.stop(1)  dofile('robot.lua') end)