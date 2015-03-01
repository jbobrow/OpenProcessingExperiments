
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
PFont myFont; 

// declare array of Balls
Ball theBalls[];
int numBalls = 50;

char selected; 

void setup() {
  size(500, 500);

  myFont = createFont("Arial", 16, true);

  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = random(25, 35); //constrain(30 + (randomGaussian() * 4), 1, 100);
    theBalls[i] = new Ball(random(width), random(height), ballSize);
    theBalls[i].randomiseDirection();
  }
  background(0);
}

void draw() {
  background(0);

  for (int i = 0; i < numBalls; i++) {
    theBalls[i].move();
    theBalls[i].display();
  }

  for (int i = 0; i < numBalls; i++) {
    for (int j = i+1; j < numBalls; j++) {   
      if (theBalls[i].intersect(theBalls[j])) {
        if (theBalls[i].loner || theBalls[j].loner) {
          float angle = theBalls[i].getColAngle(theBalls[j]);
          theBalls[i].direction = degrees(angle);                      
          angle = theBalls[j].getColAngle(theBalls[i]);
          theBalls[j].direction = degrees(angle);            
        } else {
          theBalls[i].direction += 1; 
          theBalls[j].direction -= 1;
        }
      }
    }
  }
}

void keyReleased() {
  selected = key;
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
  boolean loner = false; 

  // constructor: called when a new Ball is created
  // Note that the constructor is a special function that
  // does have a return type (not even a void) and can't
  // return any value
  Ball(float x_, float y_, float size_) {
    // store supplied values in the instance variables
    x = x_;
    y = y_;
    size = size_;

    float rand = random(1); 
    if (rand > 0.75) {
      loner = true;
    }

    // set speed and directions to 0
    speed = 0;
    direction = 0;
    omega = 0;
  }


  // randomiseDirection
  // randomise the speed and direction of the ball
  void randomiseDirection() {
    speed = random(.3, 1);
    direction = random(360);
    omega = randomGaussian() * 0.3; //random(-0.35, 0.35); //
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
    if (x <= size/2 || x >= width-size/2 || y <= size/2 || y >= height-size/2) {    
      direction += 90; //180;
      direction = direction % 360;
      if ( x <= size/2) {
        x = size/2;
      }
      if ( x >= width - size/2) {
        x = width - size/2;
      }
      if ( y <= size/2) {
        y = size/2;
      }
      if ( y >= height - size/2) {
        y = height - size/2;
      }
    }    
  }


  // display method
  // draws the ball as a transparent circle with a red point at the centre
  //
  void display() {
    float ldx, ldy; 
    float endX, endY;
    float h, s, b; 
    colorMode(HSB, 360, 100, 100);
    h = constrain(direction, 0, 360);
    b = map(speed, 0, 1, 50, 100);
    s = map(omega, -0.3, 0.3, 50, 100); 

    stroke(0, 0, 100, 50);
    fill(h, s, b, 100);
    ellipse(x, y, size, size);
    stroke(0, 0, 100, 200);    
    point(x, y);
    fill(255); 

    if (selected == 'd' || selected == 'D') {
      ldx = cos(radians(direction)) * size;
      ldy = sin(radians(direction)) * size;  
      endX = x + ldx*speed*1.5;
      endY = y + ldy*speed*1.5; 

      float arX = x + (ldx*speed);
      float arY = y + (ldy*speed);

      line(x, y, endX, endY);
      line(endX, endY, arX + (ldy * .2), arY - (ldx * .2));
      line(endX, endY, arX - (ldy * .2), arY + (ldx * .2));
    }

    if (selected == 't' || selected == 'T') {
      fill(255); 
      textAlign(CENTER, BOTTOM);
      text(nfs(speed, 1, 3), x, y);
      textAlign(CENTER, TOP);
      text(nf(int(direction), 3, 0), x, y);
    }

    if (selected == 'l' || selected == 'L') {
      if (loner) {
        textAlign(CENTER); 
        text("loner", x, y);
      }
    }
  }

  boolean intersect(Ball anotherBall) {
    return dist(x, y, anotherBall.x, anotherBall.y) < (size/2 + anotherBall.size/2);
  }

  float getColAngle(Ball anotherBall) {
    float rx, ry, angle; 
    rx = x - anotherBall.x;
    ry = y - anotherBall.y;
    angle = atan2(ry, rx);
    return angle;
  }
}



