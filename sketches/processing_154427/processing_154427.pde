
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
int numBalls = 25;
PFont tagFont;
boolean showTags, showVector;
 
void setup() {
  size(500, 500);
 
  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = constrain(20 + (randomGaussian() * 4), 1, 100);
    theBalls[i] = new Ball(random(width), random(height), ballSize);
      //test that ball does not overlap any existing balls,
      //otherwise, reset x,y
    for(int j = 0; j< i; ++j){
      while(theBalls[i].intersect(theBalls[j])){
          theBalls[i].x = random(width);
          theBalls[i].y = random(height);
        }
    }
    theBalls[i].randomiseDirection();
  }
  background(0);
  
}
 
void draw() {
  background(0);

 for (int i = 0; i < numBalls; ++i) {
    theBalls[i].move(); 
    theBalls[i].display();  
    if(showTags)
      theBalls[i].displayTags();
    if(showVector)
      theBalls[i].displayVector();
  }

}
 
void keyPressed(){
    if (key=='t'){
      if(showTags)
        showTags=false;
      else
        showTags = true;
    }
    if(key=='v'){
       if(showVector)
        showVector=false;
      else
        showVector = true;
    }
}

/* declaration of the class "Ball"
 * Which represents the concept of a moving ball with a direction, speed
 * and rate of change in direction.
 */
class Ball {
  float x;        // x position
  float y;        // y position
  float ballSize;     // ball size
  float speed;    // how fast the ball is moving
  float direction;// direction of travel
  float omega;    // rotational speed
  // constructor: called when a new Ball is created
  // Note that the constructor is a special function that
  // does have a return type (not even a void) and can't
  // return any value
  Ball(float x_, float y_, float ballsize_) {
    // store supplied values in the instance variables
    x = x_;
    y = y_;
    ballSize = ballsize_; 
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
 
  void displayVector(){
      float dx, dy;
      float vect = map(speed, 0, 1, 5, 30);
      dx = x+vect*cos(radians(direction));
      dy = y+vect*sin(radians(direction));
      line(x, y, dx, dy);
      line(dx, dy, dx + 5*cos(radians(direction)+(PI/1.2)), dy + 5*sin(radians(direction)+(PI/1.2)));
      line(dx, dy, dx + 5*cos(radians(direction)-(PI/1.2)), dy + 5*sin(radians(direction)-(PI/1.2)));
    }
 
  void displayTags(){
        text(speed, x, y);
        text(direction, x, y+15);
    }
   
  boolean intersect(Ball anotherBall) {
      return dist(x,y, anotherBall.x, anotherBall.y) < (ballSize/2 + anotherBall.ballSize/2);
  }
 

  void display() {
    noStroke();
    fill(map(speed, 0, 1, 100, 255), map(direction/(speed+1), 0, 720, 0, 255), map(direction, 0, 360, 100, 255));
    ellipse(x, y, ballSize, ballSize);
    stroke(255,0,0);
    point(x,y);
  }
}



