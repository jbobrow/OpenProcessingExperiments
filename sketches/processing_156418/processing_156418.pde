
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

// declare array of Balls
Ball theBalls[];
int numBalls = 20;
PFont myFont;
float textSize;
void setup() {
  size(500, 500); 
  myFont = loadFont("ArabicTypesetting-48.vlw"); 
 
  // STEP 3: use myFont at size 24
  float ballSize = constrain(20 + (randomGaussian() * 4), 80, 100);
  textSize = ballSize/4;
  textFont(myFont, textSize);

  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    //float ballSize = constrain(20 + (randomGaussian() * 4), 50, 100);
    theBalls[i] = new Ball(random(width), random(height), ballSize);
    theBalls[i].randomiseDirection();
  }
  background(0);
}

void draw() {
  background(0);
  for (int i = 0; i < numBalls; ++i) {
    theBalls[i].move();
    theBalls[i].display();
    theBalls[i].showSpeed();
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
  float size;     // ball size
  float speed;    // how fast the ball is moving
  float direction;// direction of travel
  float omega;    // rotational speed
  float LineX;
  float LineY;

  // constructor: called when a new Ball is created
  // Note that the constructor is a special function that
  // does have a return type (not even a void) and can't
  // return any value
  Ball(float x_, float y_, float size_) {
    // store supplied values in the instance variables
    x = x_;
    y = y_;
    size = size_;
    
    // set speed and directions to 0
    speed = 0;
    direction = 0;
    omega = 0;
    LineX = 0;
    LineY = 0;
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
  void move() {
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
  }
  
  // checkBounds
  // checks that the ball is within the display window.
  // If it reaches the edge, move in the opposite direction
  void checkBounds() {
    if (x <= 0 || x >= width || y <= 0 || y >= height) {
      direction += 180;
      direction = direction % 360;
      //direction = constrain(direction, 0, 360);
  }
  }
      

  // display method
  // draws the ball as a transparent circle with a red point at the centre
  //
  void display() {
    noStroke();
    fill(200,100);
    ellipse(x, y, size, size);
    stroke(255,0,0);
    point(x,y);
    stroke(0,0,255);
    LineX = x + cos(radians(direction)) * (speed*size);
    LineY = y + sin(radians(direction)) * (speed*size);
    //dx = cos(radians(direction)) * speed;
    //dy = sin(radians(direction)) * speed;
    
    line(x,y,LineX,LineY);  
  }
  void showSpeed(){
    String numOfSpeed = str(speed);
    String numOfDirection = str(direction);
    int textWidthS = (int)textWidth(numOfSpeed);
    int textWidthD = (int)textWidth(numOfDirection);
    stroke(0,255,0);
    text(numOfSpeed,x-textWidthS/2,y-size/4,textWidthS,size/4);
    text(numOfDirection,x-textWidthS/2,y+size/4,textWidthS,size/4);
    
  }
}

