parameter env.
local prm is env:init:prm.
print "ASL RVL SR v2.2 @ " + prm.
local started is false. local mst is 0. local psc is 0. local pvels is 0. 
local function halt {parameter m is "STOP". logc("HALT:" + m). until false {wait 999.}}
local function logc {parameter m. print "[T+" + round(met(), 2) + "] " + m.}
local function met {return choose time:seconds - mst if started else 0.}
local function nothr {list engines in el. for e in el {if (e:thrust > 0) {return false.}} return true.}
local function vels {return velocity:surface:mag.}
if env:init:chk {list files. halt("CHECK").}
local t is 9. until (t = 0) {logc("CNTD " + t). set t to t - 1. wait 1.}
set mst to time:seconds. set started to true. lock throttle to 1. logc("IGNITION").
until false {
	if (nothr()) {
		if (psc = prm:psn) {logc("FREEFLY"). break.}
		stage. set psc to psc + 1. logc("STAGE #" + psc).
	}
	logc("ACCL " + round((vels() - pvels) / 0.1, 2)). set pvels to vels().
	wait 0.1.
}
wait until (ship:sensors:pres > prm:cdp). chutes on. logc("CHUTES").
wait until (vels() < 0.3). logc("LANDED").
halt("COMPLETE").