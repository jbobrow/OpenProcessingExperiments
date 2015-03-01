
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
int numBalls = 60;
boolean displayDetails=false;
boolean displayArrows=false;
boolean showHelp=true;
PGraphics pg;
 
void setup() {
  size(800, 800);
  imageMode(CENTER);
  colorMode(HSB,360,255,255);
  PFont pf=createFont("arial.ttf",10);
  textFont(pf);
  textAlign(CENTER);
  pg=createGraphics(width*.5,height*.2,HSB);
  pg.beginDraw();
  pg.textSize(24);
  pg.textAlign(CENTER);
  pg.fill(0);
  pg.background(255,150);
  pg.text("Hit 'd' for seeing each ball's\n speed and direction values.\n"+
  "Hit 's' to see speed vectors \nrepresented by arrows.\nClick to hide/show this help pannel...",width/4,35);
  pg.endDraw();
  textSize(10);
  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = constrain(50 + (random(50)), 50, 200);
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
  if(showHelp)image(pg,width/2,height/2);
} 
void keyReleased(){
  if(key=='d')displayDetails=!displayDetails;
  if(key=='s')displayArrows=!displayArrows;
}
void mouseReleased(){
 showHelp=!showHelp;
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
    speed = random(2);
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
    direction = direction % 360;
    noStroke();
    fill(255);
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
    
    strokeWeight(size/30);
    stroke(map(direction,-360,360,0,360),map(omega,0,.3,0,255),map(speed,0,2,50,255));
    fill(map(direction,-360,360,0,360),map(omega,0,.3,0,255),map(speed,0,2,50,255), 150);
    ellipse(x, y, size, size);
    fill(255,150);
    fill(map(direction,-360,360,360,0),map(omega,0,.3,0,255),map(speed,0,2,50,255), 100);
    noStroke();
    ellipse(x,y,.8*size,.8*size);
    stroke(0, 255,255);
    strokeWeight(.5);
    point(x, y);
    if (displayArrows) {
      pushMatrix();
      translate(x, y);
      rotate(radians(direction));
      line(0, 0, 50*speed, 0);
      float arrowdim=speed*8;
      beginShape(TRIANGLES);
      fill(255, 255, 255, 100);
      vertex(50*speed, 0);
      vertex(50*speed-arrowdim, -arrowdim);
      vertex(50*speed-arrowdim, arrowdim);
      endShape();
      popMatrix();
    }
    if (displayDetails) {
      fill(255,0,255);
      noStroke();
      String speedText="S:"+nf(speed, 0, 2)+"\n\n"+"A:"+nf(direction % 360, 0, 2);
      text(speedText, x, y-textAscent());
    }
  }
}

