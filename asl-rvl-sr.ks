parameter env.
local prm is env:init:prm.
print "ASL RVL SR v5.2 @ " + prm.
local mst is 0. local started is false.
local thrc is 0. local thrp is 0.
local lft is false. local psc is 0. local ras is false.
local azmc is prm:azm. local pitc is 90.0. local troc is 1.0.
local function desc {return verticalspeed < -0.5.}
local function halt {parameter m is "COMPLETE". logc("HALT:" + m). until false {wait 999.}}
local function lm {parameter v, h is 0.999, l is 0.001. return max(min(v, h), l).}
local function logc {parameter m. print "[T+" + r2(met()) + "] " + m.}
local function met {return choose time:seconds - mst if started else 0.}
local function pres {return ship:sensors:pres.}
local function r2 {parameter v. return round(v, 2).}
local function stg {parameter d is 0.1. wait d. stage. wait 0.5.}
local function str {parameter vf. unlock steering. lock steering to lookdirup(vf(), upv()).}
local function thr {list engines in el. local v is 0. for e in el {set v to v + e:thrust.} return v.}
local function upv {return choose up:vector if ras else facing:topvector.}
local function vels {return velocity:surface.}
if (env:init:chk) {list files. halt("CHECK").}
logc("INIT").
when (met() > 15) then {set ras to true. logc("RAS:ON").}
when (prm:npd <> false and psc = prm:psn and (pres() < prm:npd or desc())) then {stg().}
str({return heading(azmc, pitc):vector.}). lock throttle to troc.
logc("STANDBY 10"). wait 10.
logc("IGNITION"). set mst to time:seconds. set started to true. 
until false {
	set thrc to thr().
	if ((thrc = 0) or (thrc / (thrp + 0.01) < 0.75)) {
		if (psc = prm:psn) {
			set troc to 0. str({return srfprograde:vector.}). logc("FREEFLY"). break.
		}
		stg(). set psc to psc + 1. logc("STAGE #" + psc).
	}
	set thrp to thrc.
	if (not lft) {
		wait until (thr() > 0).
		if (prm:clamps) {logc("CLAMPS"). stg(0.2).}
		set lft to true. logc("LIFTOFF").
	}
	local x1 is lm(apoapsis / (prm:arc * prm:aps)).
	local x2 is lm(90.0 - vang(up:vector, vels()), 90.0).
	local x3 is 15.0 - 10.0 * lm((pres() / 0.5) ^ 0.5).
	set pitc to lm(90.0 - (90.0 - prm:faa) * x1, x2 + x3, x2 - x3).
	set troc to 1.0 - (1.0 - prm:trt) * lm(x1 ^ 1.7 - lm(30 / eta:apoapsis) ^ 2).
	if (apoapsis > prm:xaps or vels():mag > prm:xvel) {
		set troc to 0. logc("CUTOFF | APS " + r2(apoapsis) + " | VEL " + r2(vels():mag)).
	}
	wait 0.1.
}
wait until (desc() and pres() > prm:cdp).
unlock steering. chutes on. logc("CHUTES").
halt().