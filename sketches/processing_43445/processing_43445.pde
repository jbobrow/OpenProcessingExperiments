
/*
Project 02 | Computational Methods | Allison Etheredge

This simulation is looking at the interation between an "exploding" comet and
smaller red comets randomly filling the field. As the white comet hits the vertical 
wall (along the x-axis) the comet explodes - creating an interaction with the red 
comets by erasing their trails.

Next step is to utilize an image to inform the system

Modified Borrowed Code - by Nick Senske imgWalker for dispersal of red mini comets
Modified Borrowed Code - 
*/




// -------------- Declare Comet Variables --------------------------------------
int xPos;
int yPos;
int speed;
boolean xDirection;
boolean yDirection;

float xHit;
float yHit;
float xTotal;
float yTotal;

int cometSize;

// -------------- Declare Bouncy Balls ----------------------------------------- 
PImage img; 
int num = 100;
Ball [] Balls = new Ball[num];




void setup() {
  frameRate(30);
  size(500, 500);
  smooth();

  // ------------- Set Comet Variables ----------------------------------------
  xPos = 1;
  yPos = 1;
  speed = 1;
  xDirection = true;
  yDirection = true;
  cometSize = 10;  
  xTotal = (width/10) + 10;
  yTotal = (height/10) + 10;

  // ------------- Load Image / Setup Bouncy Balls -----------------------------
  img = loadImage("maze.jpg");
  background(img);
  img.loadPixels();

  for (int i=0;i<num;i++) {
    float x = random(width);
    float y = random(height);
    if (img.get(int(x), int(y)) == color(0, 0, 0)) {
      i--;
    }
    else {
      Balls[i] = new Ball(x, y);
    }
  }
}




void draw() {

  // -------------- Draws the Background --------------------------------------
  noStroke();
  fill(100, 20);
  rect(0, 0, width, height);

  // -------------- Draws the Comet -------------------------------------------
  fill(255);
  ellipse(xPos, yPos, cometSize, cometSize);

  // -------------- Conditional Statements for the Comet ----------------------
  if (xDirection) {
    xPos = xPos + speed+2;
  } 
  else {
    xPos = xPos - speed-2;
  }

  if (yDirection) {
    yPos = yPos + speed+1;
  } 
  else {
    yPos = yPos - speed-1;
  }

  // ------ Tells comet to reverse direction upon hitting vertical wall --------- 
  if (xPos > (width - (cometSize/2))) {
    xDirection = false;
    xHit = xTotal;
  } 
  else if (xPos < (cometSize/2)) {
    xDirection = true;
    xHit = xTotal;
  }

  // ------ Tells comet to reverse direction upon hitting horizontal wall --------  
  if (yPos > (height - (cometSize/2))) {
    yDirection = false;
    yHit = yTotal;
  } 
  else if (yPos < (cometSize/2)) {
    yDirection = true;
    yHit = yTotal;
  }

  // -------------- Comet explodes and changes direction on x axis -------------
  if (xHit > 0) {     
    strokeWeight(5); 
    fill(255, 25);
    ellipse(xPos, yPos, (xTotal - xHit)*15, (xTotal - xHit)*15);
    noStroke();
    xHit--;
  }

  //background(img); 
  for (int i=0; i<num; i++) {
    Balls [i].bounce();
  }
}









// ------------------------- Class Ball ---------------------------------------

class Ball {
  float x;
  float y;
  float xv = random(1);
  float yv = random(1);

  Ball(float x_, float y_) {
    x=x_;
    y=y_;
  }

  void bounce() {
    x+=xv;
    y+=yv;
    
    stroke(255, 0, 0);
    fill(255, 0, 0); 
    ellipse(x, y, 5, 5);

    if (x>width) x = 0;
    if (x<0) x = width;
    if (y>height) y = 0;
    if (y<0) y = height;

    if (img.get(int(x), int(y)) != color(255, 255, 255)) {
      if (random(2)>1) {      
        yv = -yv;
      }
      else {
        xv = -xv;
      }
    }
  }
}

