

//nicholas Kiray, "Compass
//Sept. 30 2013
float movement;

float needlePin;
float needleA;
float needleB;

float compassBodyX;
float compassBodyY;
float bodySize;

float compassInner;

float compassRingX;
float compassRingY;
float ringSize;

float leftNeedleX;
float leftNeedleY;
float topNeedleX;
float topNeedleY;
float rightNeedleX;
float rightNeedleY;
float bottomNeedleX;
float bottomNeedleY;

float needlePinX;
float needlePinY;
float pinSizeX;
float pinSizeY;

float centerPin=400;

void setup () {
  size (800, 800);
  frameRate(30);
  stroke (100);
  strokeWeight (15);

  leftNeedleX=380;
  leftNeedleY=400;
  topNeedleX=400;
  topNeedleY=150;
  rightNeedleX=420;
  rightNeedleY=400;
  bottomNeedleX=400;
  bottomNeedleY=650;

  compassBodyX=400;
  compassBodyY=400;
  bodySize=680;

  compassInner=400;

  compassRingX=400;
  compassRingY=50;
  ringSize=80;
  
  needlePinX=400;
  needlePinY=400;
  pinSizeX=30;
  pinSizeY=30;


  background (70, 240, 239);
  smooth();

  //ring on top
  noFill();
  ellipse(compassRingX, compassRingY, ringSize, ringSize); 
  
}

void draw(){
  
  smooth();
  //compass body
  fill (255);
  color (255);
  strokeWeight (10);
  ellipseMode (CENTER);
  ellipse (compassBodyX, compassBodyY, bodySize, bodySize);
  
     //inner circle
  strokeWeight (5);
  noFill();
  ellipse (compassInner,compassInner,compassInner,compassInner);

  //north, south, east, west

  textSize(40);
  fill(200, 0, 50);
  text("N", 388, 130); 
  fill(0, 102, 153, 151);
  text("W", 100, 400); 
  text("E", 670, 400);
  text("S", 388, 700);
  
 // needles of compass
  strokeWeight (5);
  fill (200, 0, 0);
  triangle (leftNeedleX, leftNeedleY, topNeedleX, topNeedleY, leftNeedleX+40, leftNeedleY);
  fill (50);
  triangle (leftNeedleX, leftNeedleY, bottomNeedleX, bottomNeedleY, leftNeedleX+40, leftNeedleY);
    
    //center pin
  fill (255);
  ellipseMode(CENTER);
  ellipse (centerPin,centerPin,35,35);
  
  float distance=random(-3,3);
  constrain(topNeedleX,380,420);
  constrain(bottomNeedleX,380,420);
  topNeedleX=topNeedleX+distance;
  bottomNeedleX = bottomNeedleX-distance;
  }





