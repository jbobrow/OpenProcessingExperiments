
/*
 * Creative Coding
 * Week 5, 03 - Moving balls
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows the basics of classes and objects in Processing
 * It defines a class called "Ball" with member functions that move and display
 *
 * My version is adapted from a modification by John Field
 */
 
// declare array of Balls
Ball theBalls[];
int numBalls = 100;
Tiles myTiles;
 
void setup() {
  size(600, 600);  
  colorMode(HSB, 360, 100, 100, 100);
  
  myTiles = new Tiles();
 
  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = random(15,35); //15,30
    theBalls[i] = new Ball(random(width), random(height), ballSize);
    theBalls[i].randomiseDirection();
  }
  
  background(250, 80, 40);
}
 
void draw() {
  background(250, 80, 40);
  
  myTiles.display();
 
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
        firstBall.bounce(secondBall);
        secondBall.bounce(firstBall);
      }
    }
  }
} // end of draw


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
  float dx, dy;
  float size;     // ball size
  float speed;    // how fast the ball is moving
  float direction;// direction of travel
  float omega;    // rotational speed
  PFont myFont;
  boolean arrowVisible;
  boolean textVisible;
  boolean ballVisible;
  boolean pointVisible;
  // Note: colorMode is HSB, 360, 100, 100, 100alpha
  float myHue, mySat, myBri, myAlpha;
  boolean hueSpeed;
  boolean hueDirection;
   
 
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
    arrowVisible = true;
    textVisible = false;
    ballVisible = true;
    pointVisible = false;
    myHue = 0;
    mySat = 0;
    myBri = 100;
    myAlpha = 100;
    hueSpeed = true;
    hueDirection = false;
  }
   
   
  // randomiseDirection
  // randomise the speed and direction of the ball
  void randomiseDirection() {
    speed = random(0.5, 1.5);
    direction = random(360);
    omega = random(1) * 0.3;
  }
   
  // move method
  // moves the ball in the current direction
  void move() {
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
    // change colour effects
    changeCols();
    if (hueSpeed) {
      myHue = 240 * speed;
      mySat = constrain((100 * speed), 50, 100);
      myBri = 100 / (omega*8);
      myAlpha = constrain((100 * speed), 60, 90);
    }
    if (hueDirection) {
      myHue = constrain(direction, 0, 360);
      mySat = constrain((100 * speed), 50, 100);
      myBri = 100 / (omega*8);
      myAlpha = constrain((100 * speed), 60, 90);
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
 
  
  // display method
  // draws the ball as a transparent circle with a red point at the centre
  //
  void display() {
    ellipseMode(RADIUS);
    noStroke();
    if (ballVisible) {
      fill(myHue, mySat, myBri, myAlpha);
//      fill(0,0,80, 50);
      ellipse(x, y, size, size);
    }
    if (pointVisible) {
      stroke(0, 100, 100,100);
      point(x,y);
    }
    displayInfo();
    if (textVisible) {
    showText();
    }
    if (arrowVisible) {
    drawArrow();
    }
  }

  // draw an arrow in the current direction of travel
  void drawArrow() {
    stroke(0,0,100, 80);
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
    // font 16 point with anti-aliasing (smoothing)
    myFont = createFont("Arial", 16, true); 
    textFont(myFont, 12); //use at size 12
    fill(120,100,100, 100);
    String mySpeed = str(speed);
    String myInfo = mySpeed.substring(1,4) + "  " + str((int)direction) + "º";
    text(myInfo, x-textWidth(myInfo)/2, y);   
  }
  
  void displayInfo() {
     if (keyPressed) {
      if (keyCode == UP) {
        arrowVisible = true;
      } else if (keyCode == DOWN) {
        arrowVisible = false;
      } else if ((keyCode == SHIFT) || (key == 't')) {
        textVisible = true;
      } else if (key == 'b') {
        ballVisible = false;
      } else if (key == 'p') {
        pointVisible = true;
      } else if (key == 32) { // spacebar
        arrowVisible = true;
        textVisible = false;
        ballVisible = true;
        pointVisible = false;
      }
    }
  }
  
  void changeCols() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        hueDirection = true;
        hueSpeed = false;
      } else if (keyCode == RIGHT) {
        hueDirection = false;
        hueSpeed = true;       
      }
    }
  }
  
} // end of class


// my new Tiles class based on w2_03_02
// Note: colorMode is HSB, 360, 100, 100, 100alpha

class Tiles {
  
  // instance variables
  int num;
  int gap;
  float cellsize;
  float offsetX;
  float offsetY;
  
  // constructor
  Tiles() {
    
    rectMode(CORNER);
    noStroke();
    num = 5;
    gap = (int) random(10, 15); // 10,20
    // calculate the size of each square for the given number of squares and gap between them
    cellsize = ( width - (num + 1) * gap ) / (float)num;
    // calculate shadow offset
    offsetX = cellsize/16.0;
    offsetY = cellsize/16.0;
  }
  
  // methods etc.
  void display() {
    for (int i=0; i<num; i++) {
        for (int j=0; j<num; j++) {
          float rani = random(1);
          float ranj = random(1);
  
          fill(0,0,50, 60); // shadow
          rect(gap * (i+rani) + cellsize * i + offsetX, gap * (j+ranj) + cellsize * j + offsetY, cellsize, cellsize);
  
          fill(random(200, 250), 60, 60, 80); // rectangle
          rect(gap * (i+rani) + cellsize * i, gap * (j+ranj) + cellsize * j, cellsize, cellsize);
        }
      }
  }
  
} // end of class


