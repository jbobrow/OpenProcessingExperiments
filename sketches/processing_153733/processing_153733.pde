
/*
 * Creative Coding
 * Week 5, 03 - Moving balls
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows the basics of classes and objects in Processing
 * It defines a class called "Ball" with member functions that move and display
 * Tried to get it to work in javascript 
 * now works, thanks to Pierre Marzin!
 */
 
 PFont myFont;    // font data
 
  boolean arrow = false;  // arrows showing?
  boolean dstext = false;  // text showing?
  boolean instructions = true;  // instructions showing?

// declare array of Balls
Ball theBalls[];
int numBalls = 100;

void setup() {
  size(500, 500);
  
  colorMode(HSB,360,255, 255);
  
  myFont = createFont("Arial", 12, true);  // load the font from computer
  textFont(myFont);  // set the current font to myFont


  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = constrain(20 + random(4), 1, 100);
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
// key pressed toggle views
  void  keyPressed() {
    if (key == 't' || key == 'T')
    {
      dstext = !dstext;
    }
    if (key == 'a' || key == 'A')
    {
      arrow = !arrow;
    }
   if (key == 'i' || key == 'I')
    {
      instructions = !instructions;
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

  }
  
  
  // randomiseDirection
  // randomise the speed and direction of the ball
  void randomiseDirection() {
    speed = random(1);
    direction = random(360);
    omega = random(1);
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
    }
  }
      

  // display method
  // draws the ball as a transparent circle with a red point at the centre
  //
  void display() {
    noStroke();
    fill(map(direction, -360, 360, 0, 360), map(speed, 0.0, 1.0, 100, 255), map(omega,0.0, 0.3, 200, 255) , 120);
    ellipse(x, y, size, size);
    stroke(255,0,0);
    point(x,y);
    
    
    //fill(255);
    if (arrow == true){
      stroke(0, 0, 255);
    // where is the ball going?
     float nx, ny; // main lines
     nx = cos(radians(direction))* speed*30;
     ny = sin(radians(direction))* speed*30;
     line(x, y, x + nx, y + ny );
     
     float px, py; // one side arrow head
     px = cos(radians(direction - 45))* speed*15;
     py = sin(radians(direction - 45))* speed*15;
     line(x + nx, y + ny, x + px, y + py );
     
     
     float qx, qy; // other side arrow head
     qx = cos(radians(direction + 45))* speed*15;
     qy = sin(radians(direction + 45))* speed*15;
     line(x + nx, y + ny, x + qx, y + qy );
    }
         
    if (dstext == true){
     fill(60, 255, 255);
     
     text(str(round(direction  % 360)) + ", " + nf(speed, 0, 2), x, y-10);
    }
   
     if (instructions == true){
     fill(0, 0, 255);
     
     text("Press ' i ' to hide instructions, \n ' t ' to show direction and speed,\n ' a ' to show direction arrows.", 150, 300 );
    }
     
     
  }



  }

