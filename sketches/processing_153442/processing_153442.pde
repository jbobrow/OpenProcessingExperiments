
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
 
 /* @pjs font="Arial.ttf"; */
 
 
// 's' = speed is displayed as text
// 'l' = Speed and direction are displayed as line
// 'd' = Direction is displayed as text
// 'b' = Display trail

// declare array of Balls
Ball theBalls[];
int numBalls = 30;
PFont myFont = createFont("Arial",8,true);
boolean blackBg = true;

void setup() {
  size(500, 500);
  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = constrain(20 + (random() * 4), 1, 100); // randomGaussian doesn't work on OpenProcessing
    ellipse(20*i,height/2,80,80);
    theBalls[i] = new Ball(random(width), random(height), ballSize);
    theBalls[i].randomiseDirection();
  }
  fill(255,0,0);
  ellipse(width/2,height/2,80,80);
  background(0);
  textFont(myFont,8); 
}

void draw() {
  noStroke();
  if (blackBg) background(0);
  else {
      fill(0,2);
      rect(0,0,width,height);
  }
  for (int i = 0; i < numBalls; ++i) {
    theBalls[i].move();
    // If Ball hits another ball, the direction and speed of both are changed 
    /*for (int u=i+1; u< numBalls; ++u){
      if (theBalls[i].intersect(theBalls[u])) theBalls[i].calcNewDir(theBalls[u]);
    }*/
    theBalls[i].display();
  }
}  
void keyPressed(){
  switch(key) {
    case 's':
      Ball.toggleSpeed();
      break;
    case 'l':
      Ball.toggleLine();
      break;
    case 'd':
      Ball.toggleDirection();
      break;
    case 'c':
      Ball.toggleColor();
      break;
    case 'b':
      blackBg = !blackBg;
      break;
  }
}


/*
 * declaration of the class "Ball"
 * Which represents the concept of a moving ball with a direction, speed
 * and rate of change in direction.
 *
 */

static class Bal {
  static boolean dirB = false;      //  Boolean for showing direction as text
  static boolean speedB = false;    //  Boolean for showing speed as text
  static boolean lineB = false;     //  Boolean for showing direction and speed as line
  static boolean colorB = false;    //  Boolean for showing colors on ball
    // Methods
  static void toggleSpeed() {
    speedB = !speedB;
  }
  static void toggleDirection() {
    dirB = !dirB;
  }
  static void toggleLine() {
    lineB = !lineB;
  }
  static void toggleColor() {
    colorB = !colorB;
  }
}


class Ball extends Bal {

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
    omega = random(.6)-.3; //Gaussian() * 0.3;
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
    if (x <= 0 || x >= width) {
      direction = 180 - direction;
    } else if (y <= 0 || y >= height) {
      direction = 360 - direction;
    }
    if (direction < 0) direction += 360;
    direction = direction % 360;
  }

  // Check if two balls intersect
  boolean intersect(Ball anotherBall) {
    return dist(x, y, anotherBall.x, anotherBall.y) < (size + anotherBall.size);
  }
  // Calculate new values for both
  void calcNewDir(Ball anotherBall){
    //float momentum1 = speed*size;
    //float momentum2 = anotherBall.speed*anotherBall.size;
    float ratio1 = map(size / anotherBall.size,1,100,.95,1.05);  // momentum1 / momentum2;
    float ratio2 = map(anotherBall.size / size,1,100,.95,1.05);  //momentum2 / momentum1;
    println(ratio1+" "+ratio2);
    float dirChange = direction - anotherBall.direction;
    direction += (ratio1-1.0)*dirChange;
    anotherBall.direction -= (ratio2-1.0)*dirChange;
    speed *= ratio1;
    anotherBall.speed *=ratio2;
    
  }

  // display method
  // draws the ball as a transparent circle with a red point at the centre
  //
  void display() {
    pushMatrix();
    translate(x, y);
    noStroke();
    if (colorB) {
      colorMode(HSB,360.0,1.0,.6);
      fill(direction,speed,omega+.3);
    }
    else fill(200, 100);
    ellipse(0, 0, size, size);
    colorMode(RGB,255,255,255);
    fill(255);
    if (speedB) text(speed, 0, 0);
    if (dirB) text(direction, 0, textAscent());
    
    stroke(255, 0, 0);
    if (lineB) {
      rotate(radians(direction));
      line(0, 0, speed*25, 0);
    } else point(0, 0);
    popMatrix();
  }
}
