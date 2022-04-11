library(devtools)
library(usethis)

use_build_ignore("notes")

use_package("sf")
use_package("dplyr")
use_pipe()


document()

use_r("AK_marine_areas")
use_r("AK_basemap")
use_r("remove_dateline")
use_r("data")

#code>insert roxygen skeleton
#build>install and restart
