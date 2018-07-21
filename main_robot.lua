function stop()
gpio.write(0, gpio.LOW)
gpio.write(2, gpio.LOW)
pwm.setduty(1, 0)
pwm.setduty(5, 0)
end

pwm.setup(1, 700, 0)
pwm.start(1)
pwm.setup(5, 700, 0)
pwm.start(5)

gpio.mode(0, gpio.OUTPUT)
gpio.mode(2, gpio.OUTPUT)

gpio.write(0, gpio.LOW)
gpio.write(2, gpio.LOW)
port=10001
srv=net.createServer(net.UDP)
srv:on("receive", function(srv, pl)
   print("Command Received")
      if pl == '0' then
        print('FULL STOP')
        gpio.write(0, gpio.LOW)
		gpio.write(2, gpio.LOW)
        pwm.setduty(1, 0)
		pwm.setduty(5, 0)
			
	elseif pl == '1' then
        print('fwd')
        gpio.write(0, gpio.HIGH)
		gpio.write(2, gpio.HIGH)
        pwm.setduty(1, 205)
		pwm.setduty(5, 205)
	
	elseif pl == '12' then
        print('fwd2')
        gpio.write(0, gpio.HIGH)
		gpio.write(2, gpio.HIGH)
        pwm.setduty(1, 512)
		pwm.setduty(5, 512)
	
	elseif pl == '13' then
        print('fwd3')
        gpio.write(0, gpio.HIGH)
		gpio.write(2, gpio.HIGH)
        pwm.setduty(1, 718)
		pwm.setduty(5, 718)
						
	elseif pl == '2' then
        print('Back')
        gpio.write(0, gpio.LOW)
		gpio.write(2, gpio.LOW)
        pwm.setduty(1, 205)	
		pwm.setduty(5, 205)
	
	elseif pl == '22' then
        print('Back2')
        gpio.write(0, gpio.LOW)
		gpio.write(2, gpio.LOW)
        pwm.setduty(1, 512)	
		pwm.setduty(5, 512)
			
	elseif pl == '3' then
        print('Turn')
		gpio.write(0, gpio.LOW)
		gpio.write(2, gpio.HIGH)
        pwm.setduty(5, 150)	
		pwm.setduty(1, 150)
			
	elseif pl == '4' then
        print('Turn2')
		gpio.write(0, gpio.HIGH)
		gpio.write(2, gpio.LOW)
        pwm.setduty(5, 150)
		pwm.setduty(1, 150)
    else
        print('invalid data')
gpio.write(0, gpio.LOW)
gpio.write(2, gpio.LOW)
pwm.setduty(1, 0)
pwm.setduty(5, 0)
	end
		tmr.alarm(1,200, 1, stop)
   end)
srv:listen(port)



