
/*
 * Creative Coding
 * Week 5, 03 - Moving balls
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows the basics of classes and objects in Processing
 * It defines a class called "Ball" with member functions that move and display
 *
 * Modified 2/7/2014 by Mike Smith
 * Balls kept within space and bounce properly off edges.
 * Added controls to show vector lines, speed and direction text,
 * colour, and hits
 */

// declare array of Balls
Ball theBalls[];
int numBalls = 100;
// declare controls
boolean vector = false;
boolean text = false;
boolean colour = false;
boolean hits = false;

void setup() {
  size(500, 500);

  // initialise array and fill it with balls within display
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; i++) {
    float ballSize = constrain(20 + (randomGaussian() * 4), 1, 100);
    theBalls[i] = new Ball(random(ballSize/2, width - ballSize/2),
                           random(ballSize/2, height - ballSize/2),
                           ballSize);
    theBalls[i].randomiseDirection();
  }
  // background(0); not required?
}

void draw() {
  background(0);
  for (int i = 0; i < numBalls; i++) {
    theBalls[i].move();
    theBalls[i].display();
    // check for hits
    if(hits == true) {
      for(int j = 0; j< numBalls; j++) {
        if(dist(theBalls[i].x, theBalls[i].y,
                theBalls[j].x, theBalls[j].y) <
           theBalls[i].size/2 + theBalls[j].size/2
           && i != j) {
           float bisectAngle = abs(theBalls[i].direction -  theBalls[j].direction) / 2;
           if(theBalls[i].direction < theBalls[j].direction) {
             theBalls[i].direction += (bisectAngle + 180);
             theBalls[j].direction += (bisectAngle - 180);
           } else {
             theBalls[i].direction -= (bisectAngle + 180);
             theBalls[j].direction -= (bisectAngle - 180);
           }
           float speedDiff = abs(theBalls[i].speed -  theBalls[j].speed) / 2;
           if(theBalls[i].speed < theBalls[j].speed) {
             theBalls[i].speed += speedDiff;
             theBalls[j].speed -= speedDiff;
           } else if(theBalls[i].speed > theBalls[j].speed) {
             theBalls[i].speed -= speedDiff;
             theBalls[j].speed += speedDiff;
           } 
        }
      }
    }
  }
}

void keyPressed()
{
  if(key == 'v') vector = !vector;
  if(key == 't') text = !text;
  if(key == 'c') colour = !colour;
  if(key == 'h') hits = !hits;
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
    if(direction < 0) direction += 360;
    if(direction >360) direction -= 360;
    checkBounds();
  }
  
  // checkBounds
  // checks that the ball is within the display window.
  // If it reaches the edge, bounce in the opposite direction
  void checkBounds() {
    if (x <= size/2 || x >= width - size/2) {
      direction = 180 - direction;
    }
    if (y <= size/2 || y >= height - size/2) {
      direction = 360 - direction;
    }
      direction = direction % 360;
      // direction = constrain(direction, 0, 360); seems the same?
  }
      

  // display method
  // draws the ball as a transparent circle with a red point at the centre
  // or a solid colour determined by direction, speed, and turning.
  // 
  void display() {
    noStroke();
    if(colour == true) {
      colorMode(HSB, 360, 100, 100);
      fill(direction, speed*100, 100 - omega*100);
    } else {
      colorMode(RGB, 255, 255, 255);
      fill(200,100);
    }
    ellipse(x, y, size, size);
    colorMode(RGB, 255, 255, 255);
    stroke(255,0,0);
    if(colour != true) point(x,y);
    if(vector == true) {
      line(x, y, x + cos(radians(direction)) * speed * 50,
                 y + sin(radians(direction)) * speed * 50);
    }
   if(text == true) {
     colorMode(RGB);
     fill(0, 255, 0);
     textAlign(CENTER, CENTER);
     text(nf(speed, 1, 2)  + "  " + nf(int(direction), 3, 0), x, y);
   }
     
  }
}



