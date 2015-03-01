
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
 
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
 
  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = random(10,30);
    theBalls[i] = new Ball(random(width), random(height), ballSize);
    theBalls[i].randomiseDirection();
  }
  
  background(0);
}
 
void draw() {
  background(0);
 
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
    arrowVisible = false;
    textVisible = false;
    ballVisible = true;
    pointVisible = false;
    myHue = 0;
    mySat = 0;
    myBri = 100;
    myAlpha = 100;
    hueSpeed = false;
    hueDirection = true;
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
      myHue = 360 * speed;
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
      if ((keyCode == UP) || (keyCode == DOWN)) {
        arrowVisible = true;
      } else if ((keyCode == SHIFT) || (key == 't')) {
        textVisible = true;
      } else if (key == 'b') {
        ballVisible = false;
      } else if (key == 'p') {
        pointVisible = true;
      } else if (key == 32) { // spacebar
        arrowVisible = false;
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




