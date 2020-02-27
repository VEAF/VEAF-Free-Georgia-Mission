# VEAF Free Georgia Mission

## Abstract

Georgia has been invaded by Russia.

The USA will free Georgia.

## SITAC

When the campain begin...

Batumi:
- 4x A-10C (Enfield 1)
- 2x M-2000C (Ford 1)
- 2x F-16C (Dodge 1)
- 2x JF-17 (Chevy 1)

Stennis:
- 4x F/A-18C (Uzi 1)
- 4x F-14B (Pontiac 1)
- 2x UH-1H (Springfield 1+2)

Tarawa:
- 4x AV-8B (Colt 1)

FARP London (KM65 Zomleti):
- 4x Mi-8
- 4x SA342L
- 4x SA342M
- 4x SA342Minigun
- 4x Ka50
- 4x UH-1H

FARP Paris (GH03 Ochamchira):
- n/a

FARP Moscow (FH57 Adzigezh):
- n/a

Slots Rewards:

Kobuleti:
- 4x F-16C (Dodge 2)
- 4x M-2000C (Ford 2)
- 4x JF-17 (Chevy 2)

Senaki:
- 4x A-10C (Enfield 2)

Primary objectives
------------------

1 Capture Kobuleti

Reward: 
- blue SAM on Kobuleti
- unlock Kobuleti slots

2 Capture Senaki

Reward:
- blue SAM on Senaki
- unlock Senaki slots

3 Capture Kutaisi

Reward:
- blue SAM on on Kutaisi
- new slots on FARP Paris (GH03):
  - 4x Mi-8
  - 4x SA342L
  - 4x SA342M
  - 4x SA342Minigun
  - 4x Ka50
  - 4x UH-1H

4 Capture Sukhumi

Reward:
- blue SAM on Sukhumi

5 Capture Gudauta

Reward:
- victory when all primary objectives are complete

Secondary objectives
--------------------

to be determined

## Prerequisites (to work on this mission)

* 7za from the [7-Zip Extra: standalone console version](https://www.7-zip.org/a/7z1900-extra.7z)
* lua from [Lua for Windows](https://github.com/rjpcomputing/luaforwindows)
* npm from [NodeJS](https://nodejs.org/en/)

Note: it is easier to install all the prerequisites with [Chocolatey](https://chocolatey.org)

We created some scripts that you can use (in the folder named *setup*) :
1. run *install-chocolatey.cmd* in an **elevated** shell (as administrator)
2. restart your shell (**important**)
3. run *install-requirements.cmd* in an **elevated** shell (as administrator)
4. (optional) run *install-optionals.cmd* in an **elevated** shell (as administrator)

## Workflow

### Build the mission

Simply execute **build** in order to build the mission.

For developpement purpose you way want to use some special flags.

* *VERBOSE_LOG_FLAG* if set to "true", will create a mission with tracing enabled (meaning that, when run, it will log a lot of details in the dcs log file); defaults to "false"
* *LUA_SCRIPTS_DEBUG_PARAMETER* can be set to "-debug" or "-trace" (or not set) ; this will be passed to the lua helper scripts (e.g. veafMissionRadioPresetsEditor and veafMissionNormalizer); defaults to not set
* *SECURITY_DISABLED_FLAG* if set to "true", will create a mission with security disabled (meaning that no password is ever required); defaults to "false"
* *MISSION_FILE_SUFFIX* (a string) will be appended to the mission file name to make it more unique; defaults to the current iso date
* *SEVENZIP* (a string) points to the 7za executable; defaults "7za", so it needs to be in the path
* *LUA* (a string) points to the lua executable; defaults "lua", so it needs to be in the path

### Edit the mission

Use the DCS World Mission Editor to make whatever change you want to the .miz file you built in the previous step

### Test the mission

Within DCS World; you can have a look in the dcs.log file (specially if you set the *VERBOSE_LOG_FLAG* to "true")

### Save your changes

Copy the built .miz file (the one you edited and tested) to the root directory of this project and run **extract**.
This will :

* explode the mission into its constituing files
* copy these files in the *src* folder
* clean up everything that is not needed (i.e. lua scripts)
* normalize the mission files so they can easily be compared with the previous version (see the [normalizer tool](https://github.com/VEAF/VEAF-Mission-Creation-Tools/tree/master/mission-editor-tools/normalizer))
* commit the changes to your source control system
