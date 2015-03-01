
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

void setup() {
  size(500, 500);

  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = random(15,30);
//    float ballSize = constrain(20 + (randomGaussian() * 4), 1, 100);
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
 * declaration of the class "Ball"
 * Which represents the concept of a moving ball with a direction, speed
 * and rate of change in direction.
 *
 */
class Ball {

  // instance variables
  float x;        // x position
  float y;        // y position
  float dx;
  float dy;
  float size;     // ball size
  float speed;    // how fast the ball is moving
  float direction;// direction of travel
  float omega;    // rotational speed
  PFont myFont;
  boolean arrowOn = false;
  boolean textOn = false;
  

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
    omega = random(1) * 0.3;
  }
  
  // move method
  // moves the ball in the current direction
  void move() {
//    float dx, dy; 
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
    fill(200,100);
    ellipse(x, y, size, size);
    stroke(255,0,0);
    point(x,y);
    displayInfo();
    if (textOn) {
    showText();
    }
    if (arrowOn) {
    drawArrow();
    }
  }
  
  // draw an arrow in the current direction of travel
  void drawArrow() {
    stroke(255, 180);
    float endX = x - (dx*40);
    float endY = y - (dy*40);
    float arX = x - (dx*10);
    float arY = y - (dy*10);
    line(x, y, endX, endY);
    line(x, y, arX + (dy * 5), arY - (dx * 5));
    line(x, y, arX - (dy * 5), arY + (dx * 5));
  }
  
  // show speed & direction as text
  void showText() {
    // Arial font, 16 point with anti-aliasing (smoothing)
    myFont = createFont("Arial", 16, true); 
    textFont(myFont, 12); //use at size 12
    fill(0,255,0);
    String mySpeed = str(speed);
    String myInfo = mySpeed.substring(1,4) + "  " + str((int)direction) + "º";
    text(myInfo, x-textWidth(myInfo)/2, y);
    
  }
  
  void displayInfo() {
     if (keyPressed) {
      if ((keyCode == UP) || (keyCode == DOWN) || (keyCode == LEFT) || (keyCode == RIGHT)) {
        arrowOn = true;
//        println("arrow ON");
      } else if (keyCode == SHIFT) {
        textOn = true;
//        println("text ON");
      } else {
        arrowOn = false;
        textOn = false;
//        println("OFF");
      }
    }
  }
   
} //end of class



