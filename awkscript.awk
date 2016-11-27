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



	print $1 "\t" $2 "\t" $3 "\t" $4

	waterPercentage = $3 / ($3 + $4)

	if ( maxPopulation < $3 ){
				maxPopulation = $3
				maxPopCounty = $1
		 	         }
	if ( maxLand < waterPercentage ){
				maxLand = landPercentage
				maxLandCounty = $1
	 			        }
	if (minPopulation > $3 ){
				minPopulation = $3
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
