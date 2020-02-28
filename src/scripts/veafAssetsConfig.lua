-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VEAF ASSETS configuration script
-- By zip (2019)
--
-- Features:
-- ---------
-- Contains all the Caucasus mission-specific configuration for the ASSETS module
-- 
-- Prerequisite:
-- ------------
-- * This script requires DCS 2.5.1 or higher and MIST 4.3.74 or higher.
-- * It also requires veafAssets.lua
-- 
-- Load the script:
-- ----------------
-- load it in a trigger after loading veafAssets
-------------------------------------------------------------------------------------------------------------------------------------------------------------
veafAssets.logInfo("Loading configuration")

veafAssets.Assets = {
    -- list the assets common to all missions below
    {sort=1, name="CSG-01 Tarawa", description="Tarawa (LHA)", information="Tacan 1X\nDatalink 310 Mhz\nVHF 304 Mhz"},  
    {sort=2, name="CSG-74 Stennis", description="Stennis (CVN)", information="Tacan 74X\nDatalink 321 Mhz\nICLS 1\nVHF 305 Mhz"},  
    {sort=3, name="Arco", description="Arco (KC-135)", information="Tacan 11Y\nVHF 130.4 Mhz\nZone OUEST", linked="Arco escort"}, 
    {sort=4, name="Texaco", description="Texaco (KC-135 MPRS)", information="Tacan 13Y\nVHF 130.2 Mhz\nZone OUEST", linked="Texaco escort"},  
    {sort=5, name="Shell", description="Shell (KC-135 MPRS)", information="Tacan 12Y\nVHF 130.3 Mhz\nZone EST", linked="Shell escort"},  
    {sort=6, name="A1-Overlord", description="Overlord (E-2D)", information="Datalink 315.3 Mhz\nUHF 111.11 Mhz"},  
    -- {sort=6, name="T5-Petrolsky", description="900 (IL-78M, RED)", information="VHF 267 Mhz", linked="T5-Petrolsky escort"},  
    -- {sort=7, name="CVN-74 Stennis S3B-Tanker", description="Texaco-7 (S3-B)", information="Tacan 75Y\nVHF 133.750 Mhz\nZone PA"},  
    -- {sort=8, name="D1-Reaper", description="Colt-1 FAC (MQ-9)", information="VHF 253 Mhz", jtac=1688},  
    -- {sort=9, name="D2-Reaper", description="Dodge-1 FAC (MQ-9)", information="VHF 254 Mhz", jtac=1687},  
    -- {sort=11, name="A2-Overlordsky", description="Overlordsky (A-50, RED)", information="UHF 112.12 Mhz"},  
}

veafAssets.logInfo("Loading configuration")

veafAssets.logInfo("Setting move tanker radio menus")
table.insert(veafMove.Tankers, "Arco")
table.insert(veafMove.Tankers, "Shell")
table.insert(veafMove.Tankers, "Texaco")
-- table.insert(veafMove.Tankers, "Petrolsky")
