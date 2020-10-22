parameter env.
local prm is env:init:prm.
print "ASL RVL SR v5.0 @ " + prm.
local mst is 0. local started is false.
local lft is false. local psc is 0. local ras is false.
local azmc is prm:azm. local pitc is 90.0. local troc is 1.0.
local function halt {parameter m is "STOP". logc("HALT:" + m). until false {wait 999.}}
local function lm {parameter v, a, b. return max(min(v, b), a).}
local function logc {parameter m. print "[T+" + r2(met()) + "] " + m.}
local function met {return choose time:seconds - mst if started else 0.}
local function nothr {list engines in el. for e in el {if (e:thrust > 0) {return false.}} return true.}
local function pres {return ship:sensors:pres.}
local function r2 {parameter v. return round(v, 2).}
local function stg {parameter d is 0.1. wait d. stage. wait 0.5.}
local function str {parameter vf. unlock steering. lock steering to lookdirup(vf(), upv()).}
local function upv {return choose up:vector if ras else facing:topvector.}
local function vels {return velocity:surface.}
if (env:init:chk) {list files. halt("CHECK").}
str({return heading(azmc, pitc):vector.}). lock throttle to troc. logc("INIT").
logc("STANDBY 10"). wait 10.
set mst to time:seconds. set started to true. logc("IGNITION").
until false {
	if (nothr()) {
		if (psc = prm:psn) {str({return srfprograde:vector.}). logc("FREEFLY"). break.}
		stg(). set psc to psc + 1. logc("STAGE #" + psc).
	}
	if (not lft) {
		wait until (not nothr()).
		if (prm:clamps) {logc("CLAMPS"). stg(0.2).}
		set lft to true. logc("LIFTOFF").
	}
	if (not ras and met() > 15.0) {
		set ras to true. logc("RAS:ON").
	}
	local x1 is lm(apoapsis / (prm:arc * prm:aps), 0, 1.0).
	local x2 is lm(90.0 - vang(up:vector, vels()), 0, 90.0).
	local x3 is 15.0 - 10.0 * lm((pres() / 0.5) ^ 0.5, 0, 1.0).
	local x4 is lm(30 / eta:apoapsis, 0, 1.0).
	set pitc to lm(90.0 - (90.0 - prm:faa) * x1, x2 - x3, x2 + x3).
	set troc to 1.0 - (1.0 - prm:trt) * lm(x1 ^ 1.7 - x4 ^ 2, 0, 1.0).
	if (apoapsis > prm:xaps or vels():mag > prm:xvel) {
		logc("CUTOFF | APS " + r2(apoapsis) + " | VEL " + r2(vels():mag)).
		set troc to 0.
	}
	wait 0.1.
}
local presp is pres(). until (presp < 0.005 or presp < pres()) {set presp to pres().}
if (prm:npd) {stg(3). logc("NPD").}
wait until (pres() > prm:cdp). unlock steering. chutes on. logc("CHUTES").
wait until (vels():mag < 0.3). logc("LANDED").
halt("COMPLETE").