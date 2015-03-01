
/*
 * Creative Coding
 * Week 5, 03 - Moving balls
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows the basics of classes and objects in Processing
 * It defines a class called "Ball" with member functions that move and display
 *
 */

/* @pjs preload="CourierNewPSMT-48.vlw"; */

// declare array of Balls
Ball theBalls[];
int numBalls = 100;

//0001(1) = draw balls
//0010(2) = vector arrow
//0100(4) = vector text
//1000(8) = draw to image
int iDisplayType = 11;

PFont myFont;
PGraphics myImage;

void setup() {
  size(500, 500);
  
  //load the font
  myFont = loadFont("CourierNewPSMT-48.vlw");
  textFont(myFont);
  textSize(15);
  
  //prepare the image
  myImage = createGraphics(width, height);
  myImage.beginDraw();
  myImage.background(0);
  myImage.stroke(255,20);
  myImage.endDraw();
  
  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = constrain(20 + (randomGaussian() * 4), 1, 100);
    theBalls[i] = new Ball(random(width), random(height), ballSize, myImage);
    theBalls[i].randomiseDirection();
  }
  background(0);
}

void draw() {
  //background(0);
  myImage.beginDraw();
  for (int i = 0; i < numBalls; ++i) {
    theBalls[i].move(iDisplayType);
  }
  myImage.endDraw();
  
  image(myImage, 0, 0);
  
  for (int i = 0; i < numBalls; ++i) { 
    theBalls[i].display(iDisplayType);
  }
}  

void keyPressed() {
  switch(key) {
    case '1':
      if ((iDisplayType&1)>0) {
        //unset 1
        iDisplayType -= 1;
      } else {
        //set 1
        iDisplayType += 1;
      }
      break;
    case '2':
      if ((iDisplayType&2)>0) {
        //unset 1
        iDisplayType -= 2;
      } else {
        //set 1
        iDisplayType += 2;
      }
      break;
    case '3':
      if ((iDisplayType&4)>0) {
        //unset 1
        iDisplayType -= 4;
      } else {
        //set 1
        iDisplayType += 4;
      }
      break;
    case '4':
      if ((iDisplayType&8)>0) {
        //unset 1
        iDisplayType -= 8;
      } else {
        //set 1
        iDisplayType += 8;
      }
      break;
  }
}

/*
 * declaration of the class "Ball"
 * Which represents the concept of a moving ball with a direction, speed
 * and rate of change in direction.
 *
 */
class Ball {

  // instance variables
  float x;        // x position
  float y;        // y position
  float xOld;     // previous x position
  float yOld;     // previous y position
  float fSize;     // ball size
  float speed;    // how fast the ball is moving
  float direction;// direction of travel
  float omega;    // rotational speed
  PGraphics image;// reference to image buffer

  // constructor: called when a new Ball is created
  // Note that the constructor is a special function that
  // does have a return type (not even a void) and can't
  // return any value
  Ball(float x_, float y_, float size_,PGraphics image_) {
    // store supplied values in the instance variables
    xOld = x = x_;
    yOld = y = y_;
    fSize = size_;
    image = image_;
    
    // set speed and directions to 0
    speed = 0;
    direction = 0;
    omega = 0;
  }
  
  
  // randomiseDirection
  // randomise the speed and direction of the ball
  void randomiseDirection() {
    speed = random(1);
    direction = random(360);
    omega = randomGaussian() * 0.3;
  }
  
  // move method
  // moves the ball in the current direction
  void move(int nType) {
    xOld = x;
    yOld = y;
    float dx, dy; 
    /*
     * direction is an angle that represents the current
     * direction of travel.
     * speed is the current speed in units/frame
     */
    dx = cos(radians(direction)) * speed;
    dy = sin(radians(direction)) * speed;
    x += dx;
    y += dy;
    direction += omega;
    checkBounds();
    
    //draw to the buffered image
    if((nType&8)>0) {
      //draw to image
      image.line(xOld,yOld,x,y);
    }
    
  }
  
  // checkBounds
  // checks that the ball is within the display window.
  // If it reaches the edge, move in the opposite direction
  void checkBounds() {
    if (x <= 0 || x >= width || y <= 0 || y >= height) {
      direction += 180;
      direction = direction % 360;
    }
  }
      

  // display method
  // draws the ball as a transparent circle with a red point at the centre
  //
  void display(int nType) {
    if((nType&1)>0) {
      //draw balls
      noStroke();
      fill(200,100);
      ellipse(x, y, fSize, fSize);
      stroke(255,0,0);
      point(x,y);
    }
    if((nType&2)>0) {
      //draw vector
      float dx = cos(radians(direction)) * speed * 10;
      float dy = sin(radians(direction)) * speed * 10;
      float dxL = cos((PI+HALF_PI/2)+radians(direction)) * speed * 5;
      float dyL = sin((PI+HALF_PI/2)+radians(direction)) * speed * 5;
      float dxR = cos((PI-HALF_PI/2)+radians(direction)) * speed * 5;
      float dyR = sin((PI-HALF_PI/2)+radians(direction)) * speed * 5;
      stroke(255,0,0);
      line(x,y,x+dx,y+dy);
      line(x+dx,y+dy,x+dx+dxL,y+dy+dyL);
      line(x+dx,y+dy,x+dx+dxR,y+dy+dyR);
    }
    if((nType&4)>0) {
      //write vector
      fill(255,255);
      text("(r:"+nf(speed,1,2)+",a:"+nf(round(direction%360),3,0)+")",x,y); 
    }    
  }
}



