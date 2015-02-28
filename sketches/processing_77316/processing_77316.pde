
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/77316*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage shoe; 
PImage roach;
PImage floor; 
PImage mouse;

float sX=50, sY=50; //small object coordinates
float mX=300, mY=300; //medium object coordinates
float bX= 100, bY = 100; //large object coordinates

float sMoveX, sMoveY; //small object direction
float mMoveX, mMoveY; //medium object directoin
float bMoveX, bMoveY; //big object direction

float sMaxSpeed = 7.0; // maximum speed of objects
float mMaxSpeed = 5.0;
float bMaxSpeed = 4.0;
float speedBoost = 2.0;

boolean attract = false; //object attraction
boolean avoid = false; //object avoidance

float radius = 30.0; //used to calc the size of ellispe

void setup() {
  size(400,400);
  background(0);
  smooth();
  noStroke();
  sMoveX=random(-sMaxSpeed,sMaxSpeed);
  sMoveY=random(-sMaxSpeed,sMaxSpeed);
  mMoveX=random(-mMaxSpeed,mMaxSpeed);
  mMoveY=random(-mMaxSpeed,mMaxSpeed);
  bMoveX=random(-bMaxSpeed,bMaxSpeed);
  bMoveY=random(-bMaxSpeed,bMaxSpeed);
  ellipseMode(RADIUS);
  shoe = loadImage("shoe.gif");
  roach = loadImage("roach.gif");
  floor = loadImage("floor.jpg");
  mouse = loadImage("mouse.gif");
}

void draw() {
 image(floor,0,0,width,height);
  
  mX+=mMoveX; //medium object behavior
  mY+=mMoveY;
  //checks if med object is in bounds and corrects direction
  if (mX>width-radius || mX<radius) {
      mMoveX=-mMoveX; } 
  if (mY>height-radius || mY<radius) {
      mMoveY=-mMoveY; }   
  //checks if when and how to follow big object
  if(mY>sY && mMoveY>0) {
   mMoveY=-mMoveY; }
  if(mY<sY && mMoveY<0){
    mMoveY=-mMoveY; }
  if(mX>sX && mMoveX>0) {
   mMoveX=-mMoveX; }
  if(mX<sX && mMoveX<0){
    mMoveX=-mMoveX; }
      
  fill(0);
  image(mouse,mX,mY,radius*2,radius*2);
  
  bX+=bMoveX; //big object behavior
  bY+=bMoveY;
  if (bX>width-radius*3 || bX<1) {
      bMoveX=-bMoveX; } 
  if (bY>height-radius*3|| bY<1) {
      bMoveY=-bMoveY; }      
  fill(0,255,0);
  image(shoe,bX,bY,radius*3,radius*3);
  
  sX+=sMoveX; //small object behavior
  sY+=sMoveY;

  if (sX>width-radius || sX<1) {
      sMoveX=-sMoveX; } 
  if (sY>height-radius || sY<1) {
      sMoveY=-sMoveY; } 
  if (dist(bX+100,bY+100,sX+50,sY+50)<radius*3) {
      if (avoid==false){
      sMoveX=-sMoveX;
      sMoveY=-sMoveY;
       avoid = true;
     }
  }
  else {avoid = false;}
    
  if (avoid==true) { // if the white ellipse is "scared" then it remains yellow
    fill(255,255, 0);
  }
  else { // // if the white ellipse is not "scared" then it is white
  fill(255,0,0);
  }
   image(roach,sX,sY,radius*1.5,radius*1.5); 
}


