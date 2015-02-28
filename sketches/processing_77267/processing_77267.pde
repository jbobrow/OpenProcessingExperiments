
float pY = 0; // variable that controls y coordinate of pacman
float pX = 0; // variable that controls x coordinate of pacman

float bY = 0; // variable that controls y coordinate of blue ghost
float bX = 0; // variable that controls x coordinate of blue ghost

float rY = 0; // variable that controls y coordinate of red ghost
float rX = 0; // variable that controls x coordinate of red ghost

float kY = 0; // variable that controls y coordinate of pink ghost
float kX = 0;// variable that controls x coordinate of pink ghost

float oY = 0;// variable that controls y coordinate of orange ghost
float oX = 0;// variable that controls x coordinate of orange ghost

int numFrames=13;
int frame=0;

PImage[] images=new PImage[numFrames];

PImage Pn;
PImage B;
PImage R;
PImage O;
PImage Pa;
PImage lv;

float pMoveY; // variable that changes in the y to move the pacman
float pMoveX; // variable that changes in the x to move the pacman

float oMoveY; // variable that changes in the y to move the orange
float oMoveX; // variable that changes in the y to move the orange

float kMoveY; // variable that changes in the y to move the orange
float kMoveX; // variable that changes in the y to move the orange

float bMoveY; // variable that changes in the y to move the blue
float bMoveX; // variable that changes in the x to move the blue

float rMoveY; // variable that changes in the y to move the red 
float rMoveX; // variable that changes in the x to move the red 

float maxSpeed = 5.0; // variable that sets the maximum speed at which creatures can move

float radius = 20.0; // variable that sets the size of the ellipses

boolean pScared = false; // boolean variable that lets pacman to remain scared 
boolean attract = false;// bootlean to let ghost remain attracted

import ddf.minim.*;

AudioPlayer player;
Minim minim;


void setup () {
  size(602, 451); // sets the size of the sketch
  minim = new Minim(this);
    player = minim.loadFile("PacMan.mp3", 2048);
    player.play();

  Pn= loadImage("pink_ghost.png");
  B= loadImage ("blue_ghost.png");
  R=loadImage ("red_ghost.png");
  O=loadImage("orange_ghost.png");
  Pa=loadImage ("pacman.png");
  lv=loadImage ("level_pm.jpg");
  images [0]=loadImage("p1.png");
  images [1]=loadImage("p1.png");
  images [2]=loadImage("p2.png");
  images [3]=loadImage("p2.png");
  images [4]=loadImage("p3.png");
  images [5]=loadImage("p3.png");
  images [6]=loadImage("p4.png");
  images [7]=loadImage("p4.png");
  images [8]=loadImage("p5.png");
  images [9]=loadImage("p5.png");
  images [8]=loadImage("p6.png");
  images [10]=loadImage("p6.png");
  images [11]=loadImage("p7.png");
  images [12]=loadImage("p7.png");
  
  pMoveX=random(-maxSpeed, maxSpeed); // sets the white ellipse speed in the x
  pMoveY=random(-maxSpeed, maxSpeed); // sets the white ellipse speed in the y
  oMoveX=random(-maxSpeed, maxSpeed); // sets the orange ghost speed in the x
  oMoveY=random(-maxSpeed, maxSpeed); // sets the orange ghost speed in the y
  kMoveX=random(-maxSpeed, maxSpeed); // sets the pink ghost speed in the x
  kMoveY=random(-maxSpeed, maxSpeed); // sets the pink ghost speed in the y
  bMoveX=random(-maxSpeed, maxSpeed); // sets the blue ghost speed in the x
  bMoveY=random(-maxSpeed, maxSpeed); // sets the blue ghost speed in the y
  rMoveX=random(-maxSpeed, maxSpeed); // sets the red ghost speed in the x
  rMoveY=random(-maxSpeed, maxSpeed); // sets the red ghost speed in the y
  
  rX=random(width-radius); // sets the starting position of the red ghost in the x
  rY=random(height-radius); // sets the starting position of the red ghost in the y

  oX=random(width-radius); // sets the starting position of the orange ghost in the x
  oY=random(height-radius); // sets the starting position of the orange ghost in the y

  kX=random(width-radius); // sets the starting position of the pink ghost in the x
  kY=random(height-radius); // sets the starting position of the pink ghost in the y

  bX=random(width-radius); // sets the starting position of the blue ghost in the x
  bY=random(height-radius); // sets the starting position of the blue ghost in the y

  pX=random(radius*2, width-radius*2);  // sets the starting position of the white ellipse in the x
  pY=random(radius*2, height-radius*2);  // sets the starting position of the white ellipse in the y

  smooth();  // sets all 2D primitives to draw smoothly

  noStroke();  // sets all 2D primitives to draw without outlines

  //ellipseMode(RADIUS); // sets ellipses to draw using the last two numbers as radius width and radius heigh
}



void draw () {
  background(lv); // draws the background level



  //////////RED "PREDATOR" ghost LOGIC
  rX+=rMoveX; // these 2 lines move the red ghost
  rY+=rMoveY;
  if (rX>width-radius || rX<radius) { // these two if statements check to see if the red ghost is still on screen and if not, then reverses the direction in which it is moving
    rMoveX=-rMoveX;
  }
  if (rY>width-radius*8 || rY<radius) {
    rMoveY=-rMoveY;
  }
  if (dist(bX, bY, rX, rY)<radius*7)// checks to see if red ghost is near blue and become attacted
  {
    rX-=bMoveX;
    rY-=bMoveY;
  }
  if (rY > 460 ||rY< -10)
  {
  rY=random(100,200);
  }
  if (rX>610 || rX<-10)
  {
    rX=random(100,200);
  }
  image(R, rX, rY, radius*2, radius*2);

  
  //////////pink "PREDATOR" ghost LOGIC
  kX+=kMoveX; // these 2 lines move the pink ghost
  kY+=kMoveY;
  if (kX>width-radius || kX<radius) { // these two if statements check to see if the pink ghost is still on screen and if not, then reverses the direction in which it is moving
    kMoveX=-kMoveX;
  }
  if (kY>width-radius*8 || kY<radius) {
    kMoveY=-kMoveY;
  }
  image(Pn, kX, kY, radius*2, radius*2);


  //////////blue "PREDATOR" ghost LOGIC
  bX+=bMoveX; // these 2 lines move the blue ghost
  bY+=bMoveY;
  if (bX>width-radius || bX<radius) { // these two if statements check to see if the blue ghost is still on screen and if not, then reverses the direction in which it is moving
    bMoveX=-bMoveX;
  }
  if (bY>width-radius*8 || bY<radius) {
    bMoveY=-bMoveY;
  }
  image (B, bX, bY, radius*2, radius*2);


  //////////orange "PREDATOR" ghost LOGIC
  oX+=oMoveX; // these 2 lines move the orange ghost
  oY+=oMoveY;
  if (oX>width-radius || oX<radius) { // these two if statements check to see if the orange is still on screen and if not, then reverses the direction in which it is moving
    oMoveX=-oMoveX;
  }
  if (oY>width-radius*8 || oY<radius) {
    oMoveY=-oMoveY;
  }
  
  if (oY > 470 ||oY< -10)
  {
  oY=random(200,300);
  }
  if (oX > 610 || oX<-10)
  {
    oX=random(200,300);
  }
  
  if (dist(kX, kY, oX, oY)<radius*7)// checks to see if oragnge ghost is near pink and become attacted
  {
    oX-=kMoveX;
    oY-=kMoveY;
  }
  
 
 image (O, oX, oY, radius*2, radius*2);




  //////////pacman "PREY"  LOGIC
  pX+=pMoveX;  // these 2 lines move the white "prey" ellipse
  pY+=pMoveY;
  if (pX>width-radius || pX<radius/2) { // these two if statements check to see if the pacman is still on screen and if not, then reverses the direction in which it is moving
    pMoveX=-pMoveX;
  }
  if (pY>width-radius*8 || pY<radius) {
    pMoveY=-pMoveY;
  }
  if (dist(rX, rY, pX, pY)<radius*2 || dist(bX, bY, pX, pY)<radius*2 || dist(oX, oY, pX, pY)<radius*2) { // this if statement checks to see if the pacman is near either of the predator ellipses
    if (pScared==false) {
      pMoveY=-pMoveY; // if the pacman is close to a predator, then it reverses direction in the y
      pMoveX=-pMoveX; // if the pacman is close to a predator, then it reverses direction in the x
      pScared=true;
    }
  }
  else {
    pScared=false; // if the pacman will remain "scared" until it is not near either predator
  }
  if (pScared==true) { // if the pacman is "scared" then it remains yellow
    //image(images[frame], pX,pY,radius*2,radius*2);
    frame=frame +1;
  }
  else { // // if the pacman is not "scared" then it is white
    image (Pa, pX, pY, radius*2, radius*2);
  }


  if (frame>=numFrames) {
    frame=0;
  }
}


//tweaked and alterted code of:
//"2 Predator and 1 Prey Example"
//by Brian Schrank, October 2012


