# ASL RVL SR
Sounding rockets launch sequence

## Launch Parameters
Launch parameters are configured as attributes of ```env:init:prm``` object:
- ```aps```: target apoapsis altitude (m);
- ```arc```: coefficient of target apoapsis;
- ```asp```: airstream protection deployment (```true``` | ```false```);
- ```azm```: launch direction azimuth;
- ```cdp```: chute deployment pressure (kPa);
- ```clamps```: launch clamps mechanism (```true``` | ```false```);
- ```faa```: flight angle at apoapsis;
- ```head```: head module deployment (```true``` | ```false```);
- ```psn```: the number of rocket power stages;
- ```trt```: throttle reduction threshold;
- ```xaps```: cutoff apoapsis altitude (m);
- ```xvel```: cutoff velocity (m/s).

## Changelog

### V6.0
- Standby key launch command added;
- Flight steering simplified and revised;
- Logging style improved;
- Launch check ```env:init:chk``` parameter deprecated.