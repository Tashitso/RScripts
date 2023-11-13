# Capstone 4 script

# save the figures into png
png("Final_two_figures.png", width=1063, height=1063)

# read the file in and remove distritct of Columbia 
dat <- read.csv("DeathData.csv", na.strings="(S)")[-9,]
#print(head(dat));

dat <- na.omit(dat)
# Create a new vector for major US regions:

dat$Region=ifelse(dat$X=="Alabama" | dat$X=="Arkansas " | dat$X=="Florida" | dat$X=="Georgia " |
				     dat$X=="Louisiana" | dat$X=="Mississippi" | dat$X=="Oklahoma" |  dat$X=="Tennessee" | 
				     dat$X=="Texas" |  dat$X=="Kentucky" |  dat$X=="South Dakota" |  dat$X=="North Carolina" | 
				      dat$X=="Virginia" |  dat$X=="Delaware" | dat$X== "Maryland" |  dat$X=="South Carolina" |
				      dat$X=="West Virginia" , "South", 

ifelse(dat$X=="Arizona" | dat$X=="Alaska" | dat$X=="Hawaii" | dat$X=="California" | dat$X=="Colorado"| dat$X=="Washington" |
			  dat$X=="Oregon"| dat$X=="Nevada"| dat$X=="New Mexico " | dat$X=="Utah "| dat$X=="Wyoming"|
			  dat$X=="Idaho"| dat$X=="Montana " ,  "West", 

ifelse(dat$X=="Vermont" | dat$X=="Pennsylvania " | dat$X=="New York " | dat$X=="New Jersey " |
	 	dat$X=="Connecticut" | dat$X=="Maine " | dat$X=="New Hampshire" | dat$X=="Massachusetts " |
		dat$X=="Rhode Island" , "Northeast", 

ifelse(dat$X=="Illinois" | dat$X=="Indiana" | dat$X=="Kansas" |  dat$X=="Iowa" | dat$X=="Michigan" |
			   dat$X== "Minnesota" |  dat$X=="Missouri" | dat$X=="Minnesota" |
			  dat$X=="North Dakota" | dat$X=="Nebraska" |
			   dat$X=="South Dakota" | dat$X== "Ohio"| dat$X=="Wisconsin" |
			   dat$X=="North Dakota" , "Midwest" , "error"))))
			 
# check for errors
dat[dat$Region == "error", ]


# Calculate mean death rate per region. First, subset the data into major regions:

south <-subset(dat, Region =="South")
west <-subset(dat, Region =="West")
print(west)
ne <-subset(dat, Region =="Northeast")
print(ne)
midwest <-subset(dat, Region =="Midwest")
print(midwest)

# Calculate the mean death rate per region:
sdr=mean(south$TOTAL)
#print(sdr)
nedr=mean(ne$TOTAL)
#print(nedr)
wdr= mean(west$TOTAL)
#print(wdr)
mdr=mean(midwest$TOTAL)
#print(mdr)

#  Perform an anova to see if region is a significant predictor of death rate
anova <-aov(TOTAL ~ Region, data=dat)
print(summary(anova))

# Calculate the mean death rate via heart attack
sh = mean(south$HEART)
#print(sh)
nehr=mean(ne$HEART)
#print(nehr)
whr=mean(west$HEART)
#print(whr)
mhr=mean(midwest$HEART)
#print(mhr)

# test whether region is a significant predictor of heart attack
h <-aov(HEART ~ Region, data=dat)
print(summary(h))

# divide the panel into 2 rows and one colunmn 
#par(ask=TRUE)
par(mfrow=c(2,1))

# Make a pie chart of the various causes of death within south

msh = mean(south$HEART)
msc = mean(south$CANCER)
mss= mean(south$STROKE)
msr = mean(south$RESPIR)
msa = mean(south$ACCID)
msv = mean(south$VEHICLE)
msd = mean(south$DIABETES)
msal = mean(south$ALZHEIM)
msf = mean(south$FLU)
msn = mean(south$NEPHRITIS)
mss = mean(south$SUICIDE)
msh = mean(south$HOMICIDE)
msai = mean(south$AIDS)
mst = mean(south$TTLPOP.K.)
msp18 = mean(south$ POP.18.K.)
msp65 = mean(south$POP.65.K.)
msrr = mean(south$RRLPOP.K.)

slices <- c(msh, msc, mss, msr, msa, msv, msd, msal, msf, msn, mss, msh, msai, mst,
msp18, msp65, msrr)

pct <- round(slices/sum(slices)*100, 2)
lbls <-c("heart", "cancer", "stroke", "respir", "accid", "vehicle", "diabetes",
"alzheim", "flu", "ne", "suicide", "hoicide", "aids", "TT", "pop18", "pop65", "RR")
lbls <-paste(lbls, pct) 
lbls <- paste(lbls, "%", sep="")
pie(slices, labels= lbls, col = rainbow(length(slices)), main = "Various causes of death in South")
legend("left", lbls, cex=0.6, fill = rainbow(length(slices)))
mtext("A", side =3, cex = 2, adj=0, col = "blue")

# make a boxplot to display the total deaths due to heart attack acress all 4 major regions

bp <-boxplot(dat$HEART ~ dat$Region, col="pink", ylab="Number of heart attacks", xlab="4 Major Regions")
# add sample sizes to the top 
nbGroup <- nlevels(dat$Region)
text(
x=c(1:4),
y=bp$stats[nrow(bp$stats),] + 4,
paste("n = ", table(dat$Region), sep="")
)
title("Total death due to heart attack across four regions")
legend("topright", "p=3.92e-06", text.font = 1, cex = 1, text.col = "red")
mtext("B", side =3, adj=0, cex = 2, col = "blue")

# close the devise 
dev.off()
