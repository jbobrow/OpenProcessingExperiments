
//Grabby Cloud: Variables Animations
//Viirj kan, 2013


float v = 200; 

void setup() {
size(500, 500);
smooth();
}

void draw() {
  background(255);
  v = mouseX;
  
  
int cloudSizeX = width/3;
int cloudSizeY = height/3;



//CHANGE 5 = Sun Appears+++++++++++++++++++++++++
//YellowCircle
fill(251, 237, 33);
noStroke();
float sunAppear = map(v, 0, cloudSizeX, 6, 400);
ellipse(0, 0, sunAppear, sunAppear);

 




//CloudBODY//////////////////////////////////////////////////////////
 
fill(208, 236, 245);
strokeWeight(0);
noStroke();
ellipseMode(CENTER);

//CHANGE 1 = BodyMove+++++++++++++++++++++++++
//leftCircle
 
//CHANGE = CAT EaRS ++++++++++++++++++++++++
scale(1.05);
translate(-30,0);
float ears = map(v,0,9,150,148);
triangle(214,ears,267,165,161,165);
triangle(304,ears,367,145,200,200); 

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
float Face = map(v, -15,-50, 0, 5);
translate(0, Face);



//CHANGE 3 = EyeSmall+++++++++++++++++++++++++
//RIGHT EYE


//eye(brown)
fill(135, 81, 75);
float eyeSize2 = map(v, 18,50, 6, 9);  
arc(276, 290, eyeSize2, eyeSize2, 0, PI+QUARTER_PI+2);

//eye(black)
beginShape();
fill(0);
float eyeSize = map(v, 15,50, 6, 8.5);  
arc(276, 290, eyeSize, eyeSize, 0, PI+QUARTER_PI+2);


//LEFT EYE
//eye(brown)
beginShape();
fill(135, 81, 75);
translate(-74, 0);
arc(276, 290, eyeSize2, eyeSize2, 0, PI+QUARTER_PI+2);

//eye(black)
fill(0);
arc(276, 290, eyeSize, eyeSize, 0, PI+QUARTER_PI+2);


//CHANGE 4 = Mouth Big+++++++++++++++++++++++++
//face:smile
noFill();
stroke(2);
strokeWeight(3);
float smile = map(v, 22,40,5.2,7);
arc(276+37, 290+35, smile,smile, 0, 3.1 );



}






