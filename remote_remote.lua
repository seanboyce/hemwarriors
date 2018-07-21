port = 10001
udpSocket = net.createUDPSocket()
function poll()
pl = 0
a = 0
b = 0
c = 0
d = 0
e = 0
f = 0
g = 0
h = 0
i = 0
a = gpio.read(0)
b = gpio.read(1)
c = gpio.read(5)
d = gpio.read(6)
e = gpio.read(7)
f = gpio.read(2)
i = a+b+c+d+e+f
j = a..b..c..d..e..f

if i == 0 then 

elseif a == 1 then 
pl = '1'
print("1")

elseif b == 1 then 
pl = '12'
print("12")

elseif c == 1 then 
pl = '22'
print("22")

elseif d == 1 then 
pl = '2'
print("2")

elseif e == 1 then 
pl = '3'
print("3")

elseif f == 1 then 
pl = '4'
print("4")

else 
end
udpSocket:send(port,"192.168.4.255",pl)
tmr.alarm(1, 75, tmr.ALARM_SINGLE, function() poll(0) end)
	end
		
tmr.create():alarm(500, tmr.ALARM_SINGLE, function() poll(0)
end)