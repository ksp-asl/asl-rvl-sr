parameter env.
local prm is env:init:prm.
print "ASL RVL SR v1.0 @ " + prm.
local function halt {parameter m is "STOP". print "HALT:" + m. until false {wait 999.}}
local function vels {return velocity:surface:mag.}
if env:init:chk {list files. halt("CHECK").}
local t is 9. until (t = 0) {print "CNTD " + t. set t to t - 1. wait 1.}
print "IGNITION". stage. local vsp is 0.
until (vsp > vels()) {set vsp to vels(). wait 1.} print "STANDBY " + prm:cdd.
wait prm:cdd. chutes on. print "CHUTES".
wait until (vels() < 0.3). print "LANDED".
halt("COMPLETE").