parameter env.
local prm is env:init:prm.
print "ASL RVL SR v1.1 @ " + prm.
local function halt {parameter m is "STOP". print "HALT:" + m. until false {wait 999.}}
local function nothr {list engines in el. for e in el {if (e:thrust > 0) {return false.}} return true.}
local function vels {return velocity:surface:mag.}
if env:init:chk {list files. halt("CHECK").}
local t is 9. until (t = 0) {print "CNTD " + t. set t to t - 1. wait 1.}
local psc is 0. print "IGNITION".
until false {
	if (nothr()) {
	if (psc = prm:psn) {print "FREEFLY". break.}
		stage. set psc to psc + 1. print "STAGE #" + psc.
	}
	wait 0.1.
}
print "STANDBY " + prm:cdd.
wait prm:cdd. chutes on. print "CHUTES".
wait until (vels() < 0.3). print "LANDED".
halt("COMPLETE").