# ASL RVL SR
Sounding rockets launch sequence

## Launch Parameters
Launch parameters are configured as attributes of ```env:init:prm``` object:
- ```aps```: target apoapsis altitude (m);
- ```azm```: launch direction azimuth;
- ```cdp```: chute deployment pressure (kPa);
- ```head```: head module deployment (```true``` | ```false```);
- ```psn```: the number of rocket power stages;
- ```trt```: throttle reduction threshold;
- ```xaps```: cutoff apoapsis altitude (m);
- ```xvel```: cutoff orbital velocity (m/s).

## Changelog

#### v6.3
- Flight angle at apoapsis parameter ```faa``` deprecated;
- Cutoff velocicy is checked against current orbital velocity;
- Interruption check removed.

#### v6.2
- RCS activation added;
- Brakes group control added (primary for clamps release control);
- Airstream protection deployment and launch clamping mechanism control deprecated.

#### v6.1
- Arc launch parameter ```arc``` deprecated;
- Shutdown mechanism implemented.

### v6.0
- Standby key launch command added;
- Flight steering simplified and revised;
- Logging style improved;
- Launch check ```env:init:chk``` parameter deprecated.

#### v5.6
- Launch interruption check added;
- Flight logging style improved.

#### v 5.5
- Nose protection deployment parameter ```npd``` removed;
- Airstream protection deployment parameter ```asp``` (```true``` | ```false```) added;
- Roll alignment activation delay decreased to 30 sec.

#### v5.4
- Partial thrust loss handling improved.

#### v5.3
- Head module deployment supported added.

#### v5.2
- Zero thrust issue fixed for partial thrust loss;
- Overall code quality improvements.

#### v5.1
- Partial thrust loss handling support added for side burners/boosters control.

### v5.0
- More sophisticated flight control implemented.

#### v4.2
- Launch clamping mechanism support added.

#### v4.1
- Roll alignment control system implemented.

### v4.0
- Launch clamp control config made ```true``` implicitly;
- Freefly orientation mode configuration deprecated.

#### v3.6
- Launch clamp mechanism support added.

#### v3.5
- Nose protection deployment improved by pressure trigger.

#### v3.4
- Freefly orientation control added (only for prograde direction).
