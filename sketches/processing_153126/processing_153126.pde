
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
PFont myFont;
boolean linesVisible = false;
int bgOpacity = 255;

void setup() {
  size(500, 500);

  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
//    float ballSize = constrain(20 + (randomGaussian() * 4), 1, 100);
    float ballSize = constrain((asin(random(-1,1))/HALF_PI)*8+20, 1, 100);
    theBalls[i] = new Ball(random(width), random(height), ballSize);
    theBalls[i].randomiseDirection();
  }

  myFont = createFont("Arial", 16, true); 
  textFont(myFont, 10);

  background(0);
}

void draw() {
  fill(0, bgOpacity);
  rect(0, 0, width, height);

  for (int i = 0; i < numBalls; ++i) {
    Ball moveBall = theBalls[i];
    moveBall.move();
    moveBall.display();
  }

  for (int i=0; i<numBalls-1; i++) {
    Ball firstBall = theBalls[i];

    for (int j = i+1; j<numBalls; j++) {
      Ball secondBall = theBalls[j];

      if (firstBall.intersect(secondBall)) {
        if (linesVisible) {
          stroke(255, 255, 0, 255);
          line(firstBall.x, firstBall.y, secondBall.x, secondBall.y);
        }
        firstBall.bounce(secondBall);
        secondBall.bounce(firstBall);
      }
    }
  }
}  

void keyReleased() {
  if (key == 'a') {
    for (int i = 0; i < numBalls; ++i) {
      theBalls[i].toggleArrow();
    }
  }
  if (key == 't') {
    for (int i = 0; i < numBalls; ++i) {
      theBalls[i].toggleText();
    }
  }
  if (key == 'b') {
    for (int i = 0; i < numBalls; ++i) {
      theBalls[i].toggleBall();
    }
  }
  if (key == 'p') {
    for (int i = 0; i < numBalls; ++i) {
      theBalls[i].togglePoint();
    }
  }
  if (key == 'l') {
    linesVisible = !linesVisible;
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    bgOpacity = constrain(--bgOpacity, 1, 255);
  }
  if (keyCode == RIGHT) {
    bgOpacity = constrain(++bgOpacity, 1, 255);
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
  boolean arrowVisible;
  boolean textVisible;
  boolean ballVisible;
  boolean pointVisible;
  

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
    arrowVisible = false;
    textVisible = false;
    ballVisible = true;
    pointVisible = true;
  }
  
  
  // randomiseDirection
  // randomise the speed and direction of the ball
  void randomiseDirection() {
    speed = random(1);
    direction = random(360);
//    omega = randomGaussian() * 0.3;
    omega = (asin(random(-1,1))/HALF_PI)*0.6;
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
    }
    direction = direction % 360;
  }
  
  boolean intersect(Ball anotherBall) {
    return dist(x,y, anotherBall.x, anotherBall.y) < (size + anotherBall.size);
  }
  
  void bounce(Ball anotherBall) {
    float relativeX = x - anotherBall.x;
    float relativeY = y - anotherBall.y;
    float angleAttempt = atan(relativeY/relativeX);
    if (relativeX < 0) {
      angleAttempt = angleAttempt + PI;
    }
    direction = degrees(angleAttempt);
    checkBounds();
  }

  void toggleArrow() {
    arrowVisible = !arrowVisible;
  }
  
  void toggleText() {
    textVisible = !textVisible;
  }
  
  void toggleBall() {
    ballVisible = !ballVisible;
  }      
  
  void togglePoint() {
    pointVisible = !pointVisible;
  }      

  // display method
  // draws the ball as a transparent circle with a red point at the centre
  //
  void display() {
    ellipseMode(RADIUS);
    noStroke();
    if (ballVisible) {
      fill(192, 128);
      ellipse(x, y, size, size);
    }
    if (pointVisible) {
      stroke(255, 0, 0);
      point(x,y);
      displayVelocity();
    }
  }

  private void displayVelocity() {
    if (arrowVisible) {
      float aLen = 20*speed;
      pushMatrix();
      translate(x,y);
      rotate(radians(direction));
      translate(size+4,0);
      noStroke();
      fill(255, 0, 0, 192);
      rect(0, -size/8, aLen, size/4);
      triangle(aLen, size/4, aLen+size/4, 0, aLen, -size/4);
      popMatrix();
    }
    if (textVisible) {
      String ballText;
      fill(255, 192);
      ballText = nf(speed,1,2) + "\n" + nf(int(direction),3,0);
      text(ballText,x-textWidth(ballText)/2,y-textAscent()/2);
    }
  }
}



