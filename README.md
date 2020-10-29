# ASL RVL SR
Suborbital rocket launch sequence

## Launch Parameters
Launch parameters are configured as attributes of ```env:init:prm``` object:
- ```alt```: apoapsis altitude of horizontal flight alignment (m);
- ```azm```: launch direction azimuth (degrees);
- ```cdp```: chute deployment pressure (kPa, 0 = no chutes deployment);
- ```hmd```: head module deployment (```true``` | ```false```);
- ```psn```: the number of rocket power stages;
- ```tro```: range of allowed throttle levels (0.0 - 1.0);
- ```xaps```: cutoff apoapsis altitude (m);
- ```xvel```: cutoff orbital velocity (m/s).

## Changelog

### v7.0
- Target apoapsis parameter ```aps``` renamed to ```alt```;
- Head module deployment parameter ```head``` renamed to ```hmd```;
- Throttle reduction threshold parameter ```trt``` changed to throttle range ```tro```.

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
- Launch clamping mechanism control restored.

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

#### v3.3
- Nose protection deployment support added.

#### v3.2
- Cutoff by velocity and apoapsis altitude added.

#### v3.1
- Support of free-fly orientation mode added (only PRO mode now supported).

### v3.0
- Flight pitch control and target apoapsis support;
- Launch azimuth control.

#### v2.2
- Acceleration logging added;
- Chute deployment re-implemented with hardware cycle loop.

#### v2.1
- Throttle lock added to support liquid fuel rocket engines operation.

### v2.0
- Chutes deployment delay ```cdd``` is replaced by pressure trigger ```cdp```.

#### v1.2
- Flight logging improved.

#### v1.1
- Multiple power stages support added.

### v1.0
- Initial launch sequence version.