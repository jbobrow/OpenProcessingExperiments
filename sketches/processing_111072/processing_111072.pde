
//Grabby Cloud: fixed coordinates
//Viirj kan, 2013



size(500, 500);
background(255);
smooth();
 

int cloudSizeX = width/3;
int cloudSizeY = height/3;

//YellowCircle
fill(251, 237, 33);
noStroke();
ellipse(0, 0, 18, 18);


//CloudBODY//////////////////////////////////////////////////////////

fill(208, 236, 245);
strokeWeight(0);
noStroke();
ellipseMode(CENTER);


ellipse(90+110, 284, cloudSizeX-50, cloudSizeY-50);
//leftCircle: bottom
ellipse(156+110, 340, cloudSizeX, cloudSizeY);
//BigCircle
ellipse(225, 278, cloudSizeX*1.25, cloudSizeY*1.25);
//smallAboveBigCircle
ellipse(156, 231, cloudSizeX/1.6, cloudSizeY/1.6);
//smallUnderBigCircle
ellipse(255, 332, cloudSizeX-30, cloudSizeY-30);
//smallCircleAboveBig
ellipse(203, 175, cloudSizeX/1.7, cloudSizeY/1.7);
//CircleBump-rightOf
ellipse(238, 213, cloudSizeX-40, cloudSizeY-40);
//CircleBig_rightSide
ellipse(320, 200, cloudSizeX, cloudSizeY);
//CircleBig_BottomSide
ellipse(379, 304, cloudSizeX, cloudSizeY);
//CircleBig_RightMost
ellipse(420, 212, cloudSizeX/1.5, cloudSizeY/1.5);




//FACE///////////////////////////////////////////////////////////
translate(0, -15);

//RIGHT EYE
//eye(brown)
beginShape();
fill(135, 81, 75);
arc(276, 290, 6, 6, 0, PI+QUARTER_PI+2);

//eye(black)
fill(0);
arc(276, 290, 5.5, 5.5, 0, PI+QUARTER_PI+2);


//LEFT EYE
//eye(brown)
beginShape();
fill(135, 81, 75);

translate(-74, 0);
arc(276, 290, 6, 6, 0, PI+QUARTER_PI+2);
//eye(black)
fill(0);
arc(276, 290, 5.5, 5.5, 0, PI+QUARTER_PI+2);


//face:smile
noFill();
stroke(3);
strokeWeight(3.5);
 
arc(276+37, 290+35, 5, 7, 0.5, 2.5);

 

 





