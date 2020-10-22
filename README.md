# ASL RVL SR
Sounding rockets launch sequence

## Launch Parameters
Launch parameters are configured as attributes of ```env:init:prm``` object:
- ```aps```: target apoapsis altitude (m);
- ```arc```: coefficient of target apoapsis;
- ```azm```: launch direction azimuth;
- ```cdp```: chute deployment pressure (kPa);
- ```clamps```: launch clamps mechanism (```true``` | ```false```);
- ```faa```: flight angle at apoapsis;
- ```npd```: nose protection deployment (kPa | ```false```);
- ```psn```: the number of rocket power stages;
- ```trt```: throttle reduction threshold;
- ```xaps```: cutoff apoapsis altitude (m);
- ```xvel```: cutoff velocity (m/s).

## Other Configuration
Script also expects ```env:init:chk``` parameter to be set.