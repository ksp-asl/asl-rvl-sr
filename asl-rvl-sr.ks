parameter env.
local prm is env:init:prm.
print "ASL RVL SR v3.5 @ " + prm.
local started is false. local mst is 0. local psc is 0.
local azmc is prm:azm. local pitc is 90.0. local troc is 1.0.
local function halt {parameter m is "STOP". logc("HALT:" + m). until false {wait 999.}}
local function logc {parameter m. print "[T+" + r2(met()) + "] " + m.}
local function met {return choose time:seconds - mst if started else 0.}
local function nothr {list engines in el. for e in el {if (e:thrust > 0) {return false.}} return true.}
local function pres {return ship:sensors:pres.}
local function r2 {parameter v. return round(v, 2).}
local function str {parameter vf. lock steering to lookdirup(vf(), facing:topvector).}
local function vels {return velocity:surface:mag.}
if env:init:chk {list files. halt("CHECK").}
str({return heading(azmc, pitc):vector.}). lock throttle to troc. logc("INIT").
local t is 9. until (t = 0) {logc("CNTD " + t). set t to t - 1. wait 1.}
set mst to time:seconds. set started to true. logc("IGNITION").
until false {
	if (nothr()) {
		if (psc = prm:psn) {unlock steering. logc("FREEFLY"). break.}
		stage. set psc to psc + 1. logc("STAGE #" + psc). wait 0.5.
	}
	if (apoapsis > prm:xaps or vels > prm:xvel) {
		logc("CUTOFF | APS " + r2(apoapsis) + " | VEL " + r2(vels())).
		set troc to 0.
	}
	set pitc to 90.0 - 80.0 * min(apoapsis / (0.9 * prm:aps), 1.0).
	wait 0.1.
}
if (prm:fom = "PRO") {str({return srfprograde:vector.}).}
local presp is pres(). until (presp < 0.01 or presp < pres()) {set presp to pres().}
if (prm:npd) {wait 3. stage. logc("NPD").}
wait until (pres() > prm:cdp). unlock steering. chutes on. logc("CHUTES").
wait until (vels() < 0.3). logc("LANDED").
halt("COMPLETE").