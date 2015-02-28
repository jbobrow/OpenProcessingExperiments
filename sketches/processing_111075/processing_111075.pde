
//Grabby Cloud: fixed coordinates: Animated
//Viirj kan, 2013



size(500, 500);
background(255);
smooth();




//CHANGE 5 = Sun Appears+++++++++++++++++++++++++
//YellowCircle
fill(251, 237, 33);
noStroke();
ellipse(0, 0, 1200,1200);
 


 
int cloudSizeX = width/3;
int cloudSizeY = height/3;
  
   


//CloudBODY//////////////////////////////////////////////////////////
 
fill(208, 236, 245);
strokeWeight(0);
noStroke();
ellipseMode(CENTER);


 
//CHANGE = CAT EaRS ++++++++++++++++++++++++
scale(1.05);
translate(-30,0);

triangle(214,33,267,165,161,165);
triangle(304,33,367,145,200,200); 



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
//translate(0, -15);

//CHANGE 2 = FaceMove+++++++++++++++++++++++++
translate(0,-50);


//CHANGE 3 = EyeSmall+++++++++++++++++++++++++

//RIGHT EYE
//eye(brown)
beginShape();
fill(135, 81, 75);
arc(276, 290, 50, 50, 0, PI+QUARTER_PI+2);

//eye(black)
fill(0);
arc(276, 290, 40, 40, 0, PI+QUARTER_PI+2);


//LEFT EYE
//eye(brown)

beginShape();
fill(135, 81, 75);

translate(-74, 0);
arc(276, 290, 50, 50, 0, PI+QUARTER_PI+2);
//eye(black)
fill(0);
arc(276, 290, 40, 40, 0, PI+QUARTER_PI+2);


//CHANGE 4 = Mouth Big+++++++++++++++++++++++++
//face:smile
noFill();
stroke(2);
strokeWeight(3);  
arc(276+37, 290+35, 55, 55,0, 3.1);

 









