
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
boolean displayDetails=false;
boolean displayArrows=false;
boolean showHelp=true;
PGraphics pg;

void setup() {
  size(800, 800);
  imageMode(CENTER);
  colorMode(HSB, 360, 255, 255);
  PFont pf=loadFont("arial.ttf");
  textFont(pf);
  textAlign(CENTER);
  pg=createGraphics(int(width*.5), int(height*.2), "HSB");
  pg.beginDraw();
  pg.textSize(24);
  pg.textAlign(CENTER);
  pg.fill(0);
  pg.background(255, 150);
  pg.text("Hit 'd' for seeing each ball's\n speed and direction values.\n"+
    "Hit 's' to see speed vectors \nrepresented by arrows.\nClick to hide/show this help pannel...", width/4, 35);
  pg.endDraw();
  textSize(10);
  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = int(constrain(20 + (random(60)), 20, 80));
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
  if (showHelp)image(pg, width/2, height/2);
} 
void keyReleased() {
  if (key=='d')displayDetails=!displayDetails;
  if (key=='s')displayArrows=!displayArrows;
}
void mouseReleased() {
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
  int size;     // ball size
  float speed;    // how fast the ball is moving
  float direction;// direction of travel
  float omega;    // rotational speed
  float s,b;
  PImage img;

  // constructor: called when a new Ball is created
  // Note that the constructor is a special function that
  // does have a return type (not even a void) and can't
  // return any value
  Ball(float x_, float y_, int size_) {
    // store supplied values in the instance variables
    x = x_;
    y = y_;
    size = size_;
    img=createImage(size, size, "HSB");

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
    omega = randomGaussian() * 0.8;
    s=map(omega, 0, .8, 0, 255);
    b=map(speed, 0, 2, 50, 255);
    float distance=0;
    img.loadPixels();
    for (int j=0; j<size; j++) {
      for (int k=0; k<size; k++) {
        distance=dist(j, k, size/2, size/2);
        if (distance<=size/2) {
          img.pixels[j*size+k]=color(abs(direction), s, b, map(distance, 0, size/2, 255, 0));
        } else img.pixels[j*size+k]=color(0, 0);
      }
    }
    img.updatePixels();
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
    
    tint(abs(direction),255,255,255);
    image(img, x, y);
    noTint();
    stroke(0, 255, 255);
    strokeWeight(.5);
    //point(x, y);
    if (displayArrows) {
      pushMatrix();
      translate(x, y);
      rotate(radians(direction));
      line(0, 0, 30*speed, 0);
      float arrowdim=5;
      beginShape(TRIANGLES);
      fill(255, 255, 255, 100);
      vertex(30*speed, 0);
      vertex(30*speed-arrowdim, -arrowdim);
      vertex(30*speed-arrowdim, arrowdim);
      endShape();
      popMatrix();
    }


    if (displayDetails) {
      fill(255, 0, 255);
      noStroke();
      String speedText="S:"+nf(speed, 0, 2)+"\n\n"+"A:"+nf(direction % 360, 0, 2);
      text(speedText, x, y-textAscent());
    }
  }

}

