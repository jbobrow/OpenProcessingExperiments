
size(300,300); //sets canvas size
background(254,249,229); // sets background to offwhite
smooth();  //antialias

// BOXES
noStroke();

fill(233,73, 51);  //sets red fill
rect(74,0, 226,222); //draws red rectangle

fill(57,148,192); //sets blue fill
rect(0,228,67,228); //rect(x, y, width, height)

fill(240,212,1); //sets yellow fill
rect(280,273,20,27);



//LINES
stroke(68,56,56); //stroke color for lines
strokeWeight(8);  //weight of ver
strokeCap(SQUARE);

line(70,0,70,300); //large vertcle line

line(0,224,300,224); //large horizontal line

strokeWeight(12); //resets strokeWeight
line(0,96,70,96); //draws short chubby line in upper left

strokeWeight(10);
line(275,268,300,268);

strokeWeight(7);
line(278,224,278,300);
