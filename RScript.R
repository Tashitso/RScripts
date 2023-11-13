
#----------Capstone 4 R Script---------------
# read the data and remove District of Columbia
dat <-read.csv("DeathData.csv", na.strings="(S)")[-9,]

# remove NAs
dat <-na.omit(dat)

# create a new vector for major regions
dat$Region=" "

dat$Region=ifelse(dat$X=="Alabama" | dat$X=="Arkansas " | dat$X=="Florida" | dat$X=="Georgia " |
				     dat$X=="Louisiana" | dat$X=="Mississippi" | dat$X=="Oklahoma" |
				     dat$X=="Tennessee" | dat$X=="Texas" |  dat$X=="Kentucky" |
				     dat$X=="South Dakota" |  dat$X=="North Carolina" | 
				      dat$X=="Virginia" |  dat$X=="Delaware" | dat$X== "Maryland" |
				      dat$X=="South Carolina" |
				      dat$X=="West Virginia" , "South", 

ifelse(dat$X=="Arizona" | dat$X=="Alaska" | dat$X=="Hawaii" | dat$X=="California" |
			dat$X=="Colorado"| dat$X=="Washington" |
			  dat$X=="Oregon"| dat$X=="Nevada"| dat$X=="New Mexico " |
			  dat$X=="Utah "| dat$X=="Wyoming"|
			  dat$X=="Idaho"| dat$X=="Montana " ,  "West", 

ifelse(dat$X=="Vermont" | dat$X=="Pennsylvania " | dat$X=="New York " | dat$X=="New Jersey " |
	 	dat$X=="Connecticut" | dat$X=="Maine " | dat$X=="New Hampshire" |
		dat$X=="Massachusetts " |
		dat$X=="Rhode Island" , "Northeast", 

ifelse(dat$X=="Illinois" | dat$X=="Indiana" | dat$X=="Kansas" |  dat$X=="Iowa" | dat$X=="Michigan" |
			   dat$X== "Minnesota" |  dat$X=="Missouri" |
			   dat$X=="Minnesota" |
			   dat$X=="North Dakota" | dat$X=="Nebraska" |
			   dat$X=="South Dakota" | dat$X== "Ohio"|
			   dat$X=="Wisconsin" |
			   dat$X=="North Dakota" , "Midwest" , "error"))))
# check for errors
dat[dat$Region == "error", ]

#print(dat)

# Sebset data based on 4 major regions
south <-subset(dat, Region=="South")
print(nrow(south))

west <-subset(dat, Region=="West")
print(nrow(west))

midwest <-subset(dat, Region=="Midwest")
print(nrow(midwest))

ne <-subset(dat, Region=="Northeast")
print(nrow(ne))

# calculate mean death rate per region
