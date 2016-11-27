#! usr/bin/awk -f

	#used for the highest population density
BEGIN { maxPopulation = 0
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
	waterPercentage = 0
	{
	
	print $1 $2 $3 $4 "\t"

	
	if ( maxPopulation < $2 ){
				maxPopulation = $2
				maxPopCounty = $1
		 	         }
	if ( maxLand < waterPercentage ){
				maxLand = landPercentage
				maxLandCounty = $1
	 			        }
	if (minPopulation > $2 ){
				minPopulation = $2
				minPopCounty = $1
				}
	if (minLand > waterPercentage){
				minLand = waterPercentage
				minLandCounty = $1
				      }

	}
	}
END {
	print "Highest population density: " maxPopCounty " County , " maxPopulation " people/square mile"

	print "Lowest population desnsity: " minPopCounty " County , " minPopulation " people/square mile"
	
	print "Highest water percentage of land: " maxLandCounty " County , " maxLand " percent water"

	print "Lowest water percentage of land: " minLandCounty " County , " minLand " percent water"
    }
