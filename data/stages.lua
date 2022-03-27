-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 24,
		multiplier = 1
	}, {
		minlevel = 25,
		maxlevel = 49,
		multiplier = 2
	}, {
		minlevel = 50,
		maxlevel = 99,
		multiplier = 3
	}, {
		minlevel = 100,
		maxlevel = 149,
		multiplier = 4
	}, {
		minlevel = 150,
		maxlevel = 199,
		multiplier = 5
	}, {
		minlevel = 200,
		multiplier = 6
	}
}

skillsStages = {
	{
		minlevel = 1,
		multiplier = 1
	}
}

magicLevelStages = {
	{
		minlevel = 0,
		multiplier = 1
	}
}
