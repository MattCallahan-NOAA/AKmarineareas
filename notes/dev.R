library(devtools)
library(usethis)

#don't incorporate notes into the package
use_build_ignore("notes")


#these packages are required for functions to work
use_package("sf")
use_package("dplyr")
use_pipe()

#re-run as needed
document()

#create r scripts containing functions
use_r("AK_marine_area")
use_r("AK_basemap")
use_r("remove_dateline")
#use_r("data")

#code>insert roxygen skeleton
#build>install and restart

#create read me for package
use_readme_rmd()

#use git to post package on github
use_git()

#Jordan said this package wouldn't install :(
# I tested it in a blank R project and it worked...

#devtools::install_github("MattCallahan-NOAA/AKmarineareas")





