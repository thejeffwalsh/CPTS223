#! /usr/bin/awk -f

	#used for the highest population density
BEGIN {
	FS = "\t"
	maxPopulation = 0
	maxPopCounty = "Addams"
	#used for the highest percentage of land
	maxLand = 0
	maxLandCounty = "Addams"
	#used for lowest population density
	minPopulation = 1000000000
	minPopCounty = "Addams"
	#used for lowest percentage of land
	minLand = 10000000
	minLandCounty = "Addams"

	}
	{

	landPercentage = $2 / ($4 + $3)
	waterPercentage = $3 / ($3 + $4)

	print $1 " " $2 " population density " landPercentage " people/square mile and " waterPercentage " percent land that is covered by water"

	if ( maxPopulation < landPercentage ){
				maxPopulation = landPercentage
				maxPopCounty = $1
		 	         }
	if ( maxLand < waterPercentage ){
				maxLand = waterPercentage
				maxLandCounty = $1
	 			        }
	if (minPopulation > landPercentage ){
				minPopulation = landPercentage
				minPopCounty = $1
				}
	if (minLand > waterPercentage){
				minLand = waterPercentage
				minLandCounty = $1
				      }

	}

END {
	print "Highest population density: " maxPopCounty " County , " maxPopulation " people/square mile"

	print "Lowest population density: " minPopCounty " County , " minPopulation " people/square mile"

	print "Highest water percentage of land: " maxLandCounty " County , " maxLand " percent water"

	print "Lowest water percentage of land: " minLandCounty " County , " minLand " percent water"
    }
