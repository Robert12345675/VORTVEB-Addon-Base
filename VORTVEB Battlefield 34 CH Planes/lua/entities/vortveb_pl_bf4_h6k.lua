
-------------------------------------------------------
--	Battlefield 3/4 CH Planes Addon by V92
--	Profile Link:	http://steamcommunity.com/id/JesseVanover/
--	Workshop Link:	http://steamcommunity.com/sharedfiles/filedetails/?id=752027286
-------------------------------------------------------

AddCSLuaFile()

ENT.PrintName			= "H-6K (BF4)"			--	Printed name
	
if not VNTCB or not vortveb then
	Error( "ERROR :: VEHICLE BASES NOT MOUNTED :: Removing Entity: " .. ENT.PrintName .. "\n" )
	return false
end

if CLIENT then
	language.Add( "vortveb_pl_bf4_h6k", "H-6K" )
	ENT.Category			= VNTCB.Category.BFCH		--	Category
	ENT.Author				= VNTCB.author					--	Author
	ENT.Purpose				= VNTCB.purpose	--	Purpose
	ENT.Instructions		= VNTCB.instructions	--	Instructions for use
elseif SERVER then
	resource.AddWorkshop( "752027286" ) --	VORTVEB Battlefield CH Planes
end

ENT.Base				= "vortveb_pl_base"
ENT.Type				= "anim"
ENT.SpawnHeight			= 128
ENT.Spawnable			= true
ENT.AdminOnly			= true

ENT.Model				= Model("models/jessev92/bf4/vehicles/h6k_hull.mdl")
ENT.Weight				= 5000--empty weight in kg -engine
ENT.FuselageHealth		= 5000 --idk make it non retarded, based off size and or armor
ENT.Deatheffect			= "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult			= 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist			= 128 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance	= 512 -- idk

ENT.HasGear				= true			--	Does the helicopter have gear/gear animations?
ENT.GearUpAnim			= "gearup"		--	Name of the gear going up animations
ENT.GearDownAnim		= "geardown"	--	Name of the gear going down animation
ENT.GearBodygroup		= 1				--	Bodygroup number of the model's tyres

ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 3 -- overall fuel consumption multiplier

ENT.CenterOfMass = Vector(-100,0,0)

ENT.MaxSpeed = 1024
ENT.CruiseSpeed = 512
ENT.MinSpeed = 256

ENT.Engines = {
	{
		pos = Vector(-100,78,7),	
		radius = 70, -- max dist damage to engine to daweal damage, closer means more dmg 
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-32,0,0),-- exhaust, relative to pos
			SmokeEffect = "vortveb_smoke_trail", -- smokes effect
			EngineEffect = "vortveb_jet", -- exhaust effect
			engineHealth = 256, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 256, -- base health of engine
			Power = 8500,-- engine power in kW --x2 for single engine  858
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},
	{
				
		pos = Vector(-100,-78,7),
		radius = 70, -- max dist damage to engine to deal damage, closer means more dmg 
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-32,0,0),-- exhaust, relative to pos
			SmokeEffect = "vortveb_smoke_trail", -- smokes effect
			EngineEffect = "vortveb_jet", -- exhaust effect
			engineHealth = 256, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 256, -- base health of engine
			Power = 8500,-- engine power in kW --x2 for single engine  858
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},
}

ENT.Rotors = {
	{
		pos = Vector(175,52,7),
		ang = Angle(0, 0, 0),
		model = "models/props_junk/PopCan01a.mdl",
		info = {
			Dir = 1,
			Mass = 16, --effects how shaky the aircraft is
			RotHealth = -1,--initial rotor health should be same as BaseHealth
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	},
	{
		pos = Vector(175,-52,7),
		ang = Angle(0, 0, 0),
		model = "models/props_junk/PopCan01a.mdl",
		info = {
			Dir = -1,
			Mass = 16, --effects how shaky the aircraft is
			RotHealth = -1,--initial rotor health should be same as BaseHealth
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	},
}

ENT.thirdPerson = {
	distance = 1100,
	angle = 15,
	position = Vector(0,0,0)
}

ENT.Seats = {
	{
		pos = Vector(575, 16.5, 15),
		ang = Angle(0,0,0),
		exit = Vector(575, 128, 15),
		weapons = {"500 KG Bombs"},	--	Table of weapons for Primary on seat
	},
	{
		pos = Vector(575, -16.5, 15),
		ang = Angle(0,0,0),
		exit = Vector(575, -128, 15),
		weapons = {"500 KG Bombs"},	--	Table of weapons for Primary on seat
	},
	{
		pos = Vector(521, 16.5, 21),
		ang = Angle(0,0,0),
		exit = Vector(500, 128, 15),
		weapons = {"500 KG Bombs"},	--	Table of weapons for Primary on seat
		Turret = "BombGuy",
		CamPod = "camera",
		Cam = "camera"
	},
	{
		pos = Vector(521, -16.5, 21),
		ang = Angle(0,0,0),
		exit = Vector(500, -128, 15),
		weapons = {"CJ-20"},	--	Table of weapons for Primary on seat
		Turret = "MissleGuy",
		CamPod = "camera",
		Cam = "camera"
	},
}

ENT.Weapons = {
	["500 KG Bombs"] = {
		class = "vortveb_pod_bomb_500",
		info = {
			Pods = {
				-- Bay 1
				{--1
					pos = Vector(85,14,-12),
					ang = Angle(-1,0,0)
				},
				{--2
					pos = Vector(85,-14,-12),
					ang = Angle(-1,0,0)
				},
				{--3
					pos = Vector(-85,14,-12),
					ang = Angle(-1,0,0)
				},
				{--4
					pos = Vector(-85,-14,-12),
					ang = Angle(-1,0,0)
				},
			},
			Sequential = true,--fire all simultaneously?
			Belt = 1,
		},
	},
	["CJ-20"] = {
		class = "vortveb_pod_rkt_hellfire",
		info = {
			Pods = {
				Vector(25,303,-25),
				Vector(25,-303,-25),
				Vector(-75,450,-35),
				Vector(-75,-450,-35),
			},
			Sequential = true,
			Ammo = 4,
			IsAimed = false,
			Turret = "MissleGuy",
			CamPod = "camera",
			Cam = "camera"
		}
	},
}

ENT.Turrets = {
	["BombGuy"] = {
		pods = {
			["camera"] = {
				["camera"] = {
					model = Model( "models/props_junk/garbage_metalcan001a.mdl" ),
					pos = Vector(0,0,25),
					offset = Vector(0,0,0),
					angle = Angle(0,0,0),
					pitch = false,
					yaw = false,
					limit = false
				},
			},
		},
		info = {
			viewPos = Vector(155,0,-37),
			viewOffset = Vector(20,0,0),
			maxAng = Angle(75, 360, 0),--maxdown, max left
			minAng = Angle(-10, -360, 0),--maxup, max right
			seat = 3
		}
	},
	["MissleGuy"] = {
		pods = {
			["camera"] = {
				["camera"] = {
					model = Model( "models/props_junk/garbage_metalcan001a.mdl" ),
					pos = Vector(600,0,25),
					offset = Vector(0,0,0),
					angle = Angle(0,0,0),
					pitch = false,
					yaw = false,
					limit = false
				},
			},
		},
		info = {
			viewPos = Vector(700,0,50),
			viewOffset = Vector(20,0,0),
			maxAng = Angle(75, 360, 0),--maxdown, max left
			minAng = Angle(-10, -360, 0),--maxup, max right
			seat = 4
		}
	}
}

ENT.CounterMeasures = {
	["Flares"] = {
		class = "vortveb_pod_cm_flares2",
		info = {
			Pods = {
				Vector(-200,0,-25),	
				Vector(-200,-0,-25),
			},
			Angles = {
				Angle(-15,-90,0),
				Angle(-15,90,0),
			},
		}
	}
}

ENT.Wheels = {

	--front
	{
		mdl = Model("models/jessev92/acah/vehicles/b1lancer_tyres_front.mdl"),
		pos = Vector(403,0,-68),
		friction = 50,
		mass = 500,	
	},
	{
		mdl = Model("models/jessev92/acah/vehicles/b1lancer_tyres_rear.mdl"),
		pos = Vector(-20,193,-68),
		friction = 50,
		mass = 500,
	},
	{
		mdl = Model("models/jessev92/acah/vehicles/b1lancer_tyres_rear.mdl"),
		pos = Vector(-20,-196,-68),
		friction = 50,
		mass = 500,
	},
	{
		mdl = Model("models/jessev92/acah/vehicles/b1lancer_tyres_rear.mdl"),
		pos = Vector(22,193,-68),
		friction = 50,
		mass = 500,
	},
	{
		mdl = Model("models/jessev92/acah/vehicles/b1lancer_tyres_rear.mdl"),
		pos = Vector(22,-196,-68),
		friction = 50,
		mass = 500,
	},
}

ENT.Aerodynamics = {
	Rotation = {
		Forwards = Vector(0, -1, 0),-- rotate aircraft for (left)R (down)P (right)Y when moving forwards | 0,0.5,0 |
		Right = Vector(0.1, 0, 0.128), -- rotate aircraft for (left)R (up)P (right)Y when moving right | 0,-5,0 |
		Up = Vector(0, 0, 0) -- rotate aircraft for (right) (down) (left) when moving up | 0,-8,0 |
	},
	Movement = {
		Forwards = Vector(0, 0, 110), -- move aircraft for (forwards) (right) (up) when moving forwards | 0,0,-4 | lift
		Right = Vector(6, -4, 0), -- move aircraft for (backwards) (right) (down) when moving right | 0,0,0 |
		Up = Vector(-10, 0, 0) -- move aircraft for (forwards) (right) (up) whem moving up | -5.12,0,0 | 
	},
	Rail = Vector(20, 10, 15), -- resist s left/right up/down
	RailRotor = 0.1, -- like Z rail but only active when moving and the rotor is turning
	AngleDrag = Vector(0.095, 0.16, 0.128),
	Rotate = Vector(4, 4, 2),-- rotation multipliers (roll) (pitch) (yaw)
}

ENT.Sounds = {
	Start = "BF3.Vehicle.Jet.External.Engine.Start",
	Stop = "BF3.Vehicle.Jet.External.Engine.Stop", 

	ext1 = "BF3.Vehicle.Jet.External.Engine.RPM.Low",
	ext2 = "BF3.Vehicle.Jet.External.Engine.RPM.Mid", 
	ext3 = "BF3.Vehicle.Jet.External.Engine.RPM.High",
	
	int1 = "BF3.Vehicle.Jet.Internal.Low", 
	int2 = "BF3.Vehicle.Jet.Internal.Medium", 
	int3 = "BF3.Vehicle.Jet.Internal.High",	
}
