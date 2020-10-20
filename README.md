# ASL RVL SR
Sounding rockets launch sequence

## Launch Parameters
Launch parameters are configured as attributes of ```env:init:prm``` object:
- ```aps```: target apoapsis altitude (m);
- ```azm```: launch direction azimuth;
- ```cdp```: chute deployment pressure (kPa);
- ```npd```: nose protection deployment (```true``` | ```false```);
- ```psn```: the number of rocket power stages;
- ```xaps```: cutoff apoapsis altitude (m);
- ```xvel```: cutoff velocity (m/s).

## Other Configuration
Script also expects ```env:init:chk``` parameter to be set.