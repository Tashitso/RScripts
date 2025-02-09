
# save the image using png function 
png("Anamza_mapA.png", width=2244, height=2244)

# Load the pacakges 
library(maps)

# Read the two files in 
cast <- read.csv("CAST_lat_long.csv")
dom <- read.csv("DOM_lat_long.csv") 

# Get map od the world 
map('world', fill=TRUE, col='grey')

# Get the lakes and add to the previous mape of the world 
map('lakes', add=TRUE, fill=TRUE, col='blue', boundary='black')

# Get the axes for the map 
map.axes(cex.axis=2)

# Plot the points of the subspecies with specified size and colors and also label axes
points(y = cast$X.0.86667, x = cast$X134.08333, col="red", pch=16, xlab = "LON", ylab = "LAT", cex=3) 
points(y = dom$X.0.75, x = dom$X.90.28306, col="purple", pch=16, xlab = "LON", ylab = "LAT", cex=3)

# Adding title and adjust the size of the title 
title("Distributions of two mouse subspecies", cex.main = 4)

# Include legend with specified size and colors 
legend("left", legend =c("CAST", "DOM"), col =c("red", "purple"), pch =c(16, 16), cex=4)

# close the 
dev.off()


