
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

int numBalls = 100;
int SpeedOfBall;


void setup() {
  size(500, 500);

  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];

  for (int i = 0; i < numBalls; ++i) {
    float ballSize = constrain(20 + (randomGaussian() * 4), 1, 100);
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
   


  }
}  


/*
 * declaration of the class "Arrow"
 * Which represents the concept of an arrow with a direction
 *
 *
 */
class Arrow {
   // instance variables
  float x;        // x position
  float y;        // y position
  float x2;        // x position
  float y2;        // y position


  // constructor:

  Arrow(float x_, float y_, float x2_, float y2_) {
    // store supplied values in the instance variables
    x = x_;
    y = y_;
    x2 = x2_;
    y2 = y2_;
      
  } 
 

   // display method

  //
  void display() {
    noStroke();
    line(x,y,x2,y2);
    //setColor();
 
  
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
  float x2;        // x position
  float y2;        // y position
  
  float size;     // ball size
  float speed;    // how fast the ball is moving
  float direction;// direction of travel
  float omega;    // rotational speed
  color[] palette = {#5C4B51, #8CBEB2, #F2EBBF, #F3B562, #F06060};
 Arrow theArrows[]; 

  // constructor: called when a new Ball is created
  // Note that the constructor is a special function that
  // does have a return type (not even a void) and can't
  // return any value
  Ball(float x_, float y_, float size_) {
    // store supplied values in the instance variables
    x = x_;
    y = y_;
    size = size_;
    x2=5.0;
    y2=5.0;
    // set speed and directions to 0
    speed = 0;
    direction = 0;
    omega = 0;
    theArrows = new Arrow(x,y,x2,y2);
   
    

    
  }
  
  
  // randomiseDirection
  // randomise the speed and direction of the ball
  void randomiseDirection() {
    speed = random(1);
    direction = random(360);
    omega = randomGaussian() * 0.3;
  }
  
  void displayArrow(){
 
  theArrows[0].display();
  
  
  }  
  void setColor(){
  int r = int(random(palette.length));
  fill(palette[r]);
  
    
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
  
 float getSpeed(){
 return speed; 
  }
  
 float getDirection(){
 return direction;
  }
  
  void setSpdDir(){
    textSize(10);
    text(speed, x, y,-30);   
    text(direction, x, y+10,-40);
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
  void display() {
    noStroke();
    //fill(200,100);
    setColor();
    ellipse(x, y, size, size);
    stroke(255,0,0);
    point(x,y);
    setSpdDir();
    displayArrow();
    
  
  }
}

