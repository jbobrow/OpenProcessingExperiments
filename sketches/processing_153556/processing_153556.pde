
/*
 * Creative Coding
 * Week 5, 03 - Moving balls
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows the basics of classes and objects in Processing
 * It defines a class called "Ball" with member functions that move and display
 *
 * Twk: Draw lines between the balls if they come close
 * color depending on distance 
 * click canvas to stop/restart sketch 
 * 
 */

// declare array of Balls
Ball theBalls[];
int numBalls = 25;
boolean looping = true; 

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
  //background(0); 

  for (int i = 0; i < numBalls; i++) {
    for (int j = i+1; j < numBalls; j++) {
      if (theBalls[i].intersect(theBalls[j])) {
        theBalls[i].display(theBalls[j]);
        theBalls[i].direction += .5;
        theBalls[j].direction -= .5;
      }
    }
    theBalls[i].move();
  }
}  

void mouseReleased() {
  looping = !looping; 
  if (looping) {    
    loop();
  } else {
    noLoop();
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
    speed = random(0.1, 1);
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
      direction += 90; //180;      
      direction = direction % 360;
    }
  }


  // display method
  // draws the ball as a transparent circle with a red point at the centre
  //
  void display(Ball anotherBall) {
    float c;     
    float d = dist(x, y, anotherBall.x, anotherBall.y);
    c = map(d, 0, size*2 + anotherBall.size*2, 255, 0); 
    stroke(c);  
    line(x, y, anotherBall.x, anotherBall.y); 
  }

  boolean intersect(Ball anotherBall) {
    return dist(x, y, anotherBall.x, anotherBall.y) < (size*2 + anotherBall.size*2);
  }
  
}



