
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
float qx, qy; // other side arrow head
 float nx, ny; // main lines
float px, py; // one side arrow head
  // constructor:

  Arrow() {
    // store supplied values in the instance variables
x=0;
y=0;

  
  } 

void setPosition(float x_, float y_, float direction_, float speed_){
 
float direction; 
float speed;

speed=speed_;
direction=direction_;
x=x_;
y=y_;


nx = cos(radians(direction))* speed*30;
ny = sin(radians(direction))* speed*30;

px = cos(radians(direction - 45))* speed*15;
py = sin(radians(direction - 45))* speed*15;
    
qx = cos(radians(direction + 45))* speed*15;
qy = sin(radians(direction + 45))* speed*15;


  
}

   // display method

  void display() {
    noStroke();
    stroke(255,0,0);
    //main
     line(x, y, x + nx, y + ny );
     
     //left arrow
     line(x + nx, y + ny, x + px, y + py );
    
     //right arrow
    
    line(x + nx, y + ny, x + qx, y + qy );
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

 
  float size;     // ball size
  float speed;    // how fast the ball is moving
  float direction;// direction of travel
  float omega;    // rotational speed
  color[] palette = {#5C4B51, #8CBEB2, #F2EBBF, #F3B562, #F06060};
 Arrow theArrows; 

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
    theArrows = new Arrow();
  
    

    
  }
  
  
  // randomiseDirection
  // randomise the speed and direction of the ball
  void randomiseDirection() {
    speed = random(1);
    direction = random(360);
    omega = randomGaussian() * 0.3;
  }
  

  void setColor(){
  int r = int(random(palette.length));
  fill(palette[r]);
  
    
  }
  
  // move method
  // moves the ball in the current direction
  void move() {
  float dx, dy;

   dx = cos(radians(direction)) * speed;
    dy = sin(radians(direction)) * speed;


    /*
     * direction is an angle that represents the current
     * direction of travel.
     * speed is the current speed in units/frame
     */

    x += dx;
    y += dy;
    direction += omega;
    checkBounds();
    theArrows.setPosition(x,y,direction,speed);
 
   
 

    
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
    theArrows.display();
    
  
  }
}

