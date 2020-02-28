-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VEAF QRA configuration script
-- By mitch (2020)
--
-- Features:
-- ---------
-- Work in progress to manage QRA
-- 
-- Prerequisite:
-- ------------
-- * This script requires DCS 2.5.1 or higher and MIST 4.3.74 or higher.
-- * It also requires veafCapture.lua
-- 
-- Load the script:
-- ----------------
-- load it in a trigger (mission start)
-------------------------------------------------------------------------------------------------------------------------------------------------------------


veafQra = {}

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Global settings. Stores the script constants
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--- Identifier. All output in DCS.log will start with this.
veafQra.Id = "QRA - "

--- Version.
veafQra.Version = "0.0.0"

-- trace level, specific to this module
veafQra.Trace = false

veafQra.RadioMenuName = "QRA"

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Utility methods
-------------------------------------------------------------------------------------------------------------------------------------------------------------

function veafQra.logInfo(message)
    veaf.logInfo(veafQra.Id .. message)
end

function veafQra.logDebug(message)
    veaf.logDebug(veafQra.Id .. message)
end

function veafQra.logTrace(message)
    if message and veafQra.Trace then
        veaf.logTrace(veafQra.Id .. message)
    end
end

veafQra.logInfo(string.format("Loading version %s", veafQra.Version))

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- initialisation
-------------------------------------------------------------------------------------------------------------------------------------------------------------
function veafQra.initialize()
    veafQra.logInfo("Initializing module")
    -- veafQra.buildRadioMenu()
	
	
	veafCapture.updateAirports(false)
	veafCapture.displayReport()
	
    for i = 1, #veafQra.groups do
		veafQra.groups[i]:status="ready"
		veafQra.groups[i]:inZone=false

		local group=Group.getByName(veafQra.groups[i]:name)
		if group then
	      trigger.action.deactivateGroup(group)		
		end
	end
	
	-- mist.addEventHandler(veafQra.eventHandler)
end


-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Event Handler (manage QRA logic)
-------------------------------------------------------------------------------------------------------------------------------------------------------------
function veafQra.eventHandler()

    for i = 1, #veafQra.groups do
	
		airbase = Airbase.getByName(veafQra.groups[i]:airbase)
		
		-- todo manage Blue In Zone ...
		-- todo manage Blue Out Zone ...
		
		-- manage QRA spawn		
		-- if QRA is Ready, attached airbase is RED, and BLUE is in zone: POPUP group
		if veafQra.groups[i]:status == "ready" and airbase.getCoalition().side == 1 and veafQra.groups[i]:inZone then
			veafQra.groups[i]:status="doing"
            mist.respawnGroup(veafQra.groups[i]:group,true)
			trigger.action.outTextForCoalition(2, string.format("Overlord: popup group near %s", veafQra.groups[i]:airbase),20)
			trigger.action.outSoundForCoalition("Radar Contact Closing Fast.ogg")
		end

		-- manage QRA dead
		-- if QRA is Ready, attached airbase is RED, and BLUE is in zone: POPUP group
		
		if veafQra.groups[i]:status == "doing" and not Group.getByName(veafQra.groups[i]:group) then
			veafQra.groups[i]:status = "dead"
			trigger.action.outTextForCoalition(2, string.format("Overlord: group %s faded", veafQra.groups[i]:airbase),20)
		end

		local group=Group.getByName(veafQra.groups[i]:name)
		if group then
	      trigger.action.deactivateGroup(group)		
		end
	end
	
end


-- config

veafQra.groups={
  ["Kutaisi"] =
    {   
      zone="Kutaisi",
      -- zoneOut="Kutaisi Outer",
	  group = "RED QRA Kutaisi",
	  airbase = "Kutaisi",
	  status = "ready",
	  inZone = false,
    },
}
