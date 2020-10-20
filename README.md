# ASL RVL SR
Sounding rockets launch sequence

## Launch Parameters
Sounding rocket launch is configured by a single parameter ```cdd``` - chute deployment delay.
This is a time interval in seconds which would be passed since acceleration drop until chutes deployment.
The parameter is required and must be available as an attribute of ```env:init:prm``` configuration object.

## Other Configuration
Script also expects ```env:init:chk``` parameter to be set.
