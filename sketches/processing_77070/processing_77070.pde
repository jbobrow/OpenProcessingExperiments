
//tweaked and alterted code of:
//"2 Predator and 1 Prey Example"
//by Brian Schrank, October 2012

PImage img;
PImage img1;
PImage img2;
PImage img3;


float pY = 0; // variable that controls y coordinate of prey ellipse
float pX = 0; // variable that controls x coordinate of prey ellipse

float gY = 0; // variable that controls y coordinate of green predator ellipse
float gX = 0; // variable that controls x coordinate of green predator ellipse

float rY = 0; // variable that controls y coordinate of red predator ellipse
float rX = 0; // variable that controls x coordinate of red predator ellipse

float pMoveY; // variable that changes in the y to move the prey ellipse 
float pMoveX; // variable that changes in the x to move the prey ellipse 

float gMoveY; // variable that changes in the y to move the green predator ellipse 
float gMoveX; // variable that changes in the x to move the green predator ellipse 

float rMoveY; // variable that changes in the y to move the red predator ellipse 
float rMoveX; // variable that changes in the x to move the red predator ellipse 

float maxSpeed = random (2.0,5.0); // variable that sets the maximum speed at which creatures can move
float radius = random(30.0,80.0); // variable that sets the size of the ellipses
boolean pScared = false; // boolean variable that lets the white ellipse to remain scared



void setup() { 
  
  img = loadImage("kitchen.jpg");
  img1 = loadImage("nyan.png");
  img2 = loadImage("mouse.png");
  img3 = loadImage ("cheese.png");
  
  
  size(500, 341); // sets the size of the sketch
 
  
  
  pMoveX=random(-maxSpeed, maxSpeed); // sets the white ellipse speed in the x
  pMoveY=random(-maxSpeed, maxSpeed); // sets the white ellipse speed in the y
  
  gMoveX=random(-maxSpeed, maxSpeed); // sets the green ellipse speed in the x
  gMoveY=random(-maxSpeed, maxSpeed); // sets the green ellipse speed in the y
  
  rMoveX=random(-maxSpeed, maxSpeed); // sets the red ellipse speed in the x
  rMoveY=random(-maxSpeed, maxSpeed); // sets the red ellipse speed in the y
  
  rX=random(height-radius); // sets the starting position of the red ellipse in the x
  rY=random(height-radius); // sets the starting position of the red ellipse in the y
  
  gX=random(height-radius); // sets the starting position of the green ellipse in the x
  gY=random(height-radius); // sets the starting position of the green ellipse in the y
  
  pX=random(radius*2, height-radius*2);  // sets the starting position of the white ellipse in the x
  pY=random(radius*2, height-radius*2);  // sets the starting position of the white ellipse in the y
  
  ellipseMode(RADIUS); // sets ellipses to draw using the last two numbers as radius  and radius height
}



void draw() {
  
   background(img);
  
  
  ////////// "PREDATOR" LOGIC(NYAN)
  
  rX+=rMoveX; // these 2 lines move the red ellipse
  rY+=rMoveY;
  if (rX>height-radius || rX<radius) { // these two if statements check to see if the red ellipse is still on screen and if not, then reverses the direction in which it is moving
    rMoveX=-rMoveX;
  }
  if (rY>height-radius || rY<radius) {
    rMoveY=-rMoveY;
  }
  image(img1, rX, rY, radius, radius); // draws red ellipse
  
  
  ////////// "PREDATOR" LOGIC(CHEESE)
  
  
  gX+=gMoveX; // these 2 lines move the green ellipse
  gY+=gMoveY;
  if (gX>height-radius || gX<radius) { // these two if statements check to see if the green ellipse is still on screen and if not, then reverses the direction in which it is moving
    gMoveX=-gMoveX;
  }
  if (gY>height-radius || gY<radius) {
    gMoveY=-gMoveY;
  }
  image(img3, gX, gY, radius, radius);
  
    
  ////////// "PREY" LOGIC(MOUSE)
  
  
  pX+=pMoveX;  // these 2 lines move the white "prey" ellipse
  pY+=pMoveY;
  if (pX>height-radius*2 || pX<radius*2) { // these two if statements check to see if the white ellipse is still on screen and if not, then reverses the direction in which it is moving
    pMoveX=-pMoveX;
  }
  if (pY>height-radius*2 || pY<radius*2) {
    pMoveY=-pMoveY;
  }
  if (dist(rX, rY, pX, pY)<radius*2 || dist(gX, gY, pX, pY)<radius*2) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (pScared==false) {
      pMoveY=-pMoveY; // if the white ellipse is close to a predator, then it reverses direction in the y
      pMoveX=-pMoveX; // if the white ellipse is close to a predator, then it reverses direction in the x
      pScared=true;
    }
  }
  else {
    pScared=false; // if the white ellipse will remain "scared" until it is not near either predator
  }
  image(img2, pX, pY, radius*2, radius*2); // draw the white ellipse
}
  


