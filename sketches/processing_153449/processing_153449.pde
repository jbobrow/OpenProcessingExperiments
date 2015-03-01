
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/153347*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*
 * Creative Coding
 * Week 5, 04 - Moving balls 2
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows the basics of classes and objects in Processing
 * It defines a class called "Ball" with one member function: "display()"
 *
 */
MovingBall centre;
MovingBall[] arounds;
PGraphics pg;
PGraphics mg;
PImage img;

int numOfObjects;
int placedballs;
int numDirections;

void setup() {
  size(800, 800);
  frameRate(200);
  placedballs=0;
  numDirections = 3;
  img=createImage(8, 8, HSB);
  drawFirefly(color(180, 40, 255), img);
  pg=createGraphics(width, height);
  pg.beginDraw();
  pg.background(0, 0);
  pg.stroke(255, 255, 0);
  pg.strokeWeight(.3);
  pg.endDraw();

  mg=createGraphics(width, height);
  mg.beginDraw();
  mg.imageMode(CENTER);
  mg.noStroke();    
  mg.rectMode(CENTER);
  mg.background(0);
  mg.endDraw();
  numOfObjects = 100;
  arounds = new MovingBall[numOfObjects];
  centre = arounds[0];
}

void draw() {
  image(mg, 0, 0);
  pg.beginDraw();
  pg.background(0, 0);
  for (int i=0; i < min (placedballs, numOfObjects); i++ ) {
    try {
      arounds[i].run();
    }
    catch (IOException e) {
      println(i);
    }
    pg.noStroke();  
    float distance=dist(arounds[i].x, arounds[i].y, arounds[i].tx, arounds[i].ty);
    pg.fill(255, 255, 0, map(distance, 0, 50, 0, 155));
    pg.ellipse(arounds[i].x, arounds[i].y, (frameCount+i)%10, (frameCount+i)%10);
    pg.stroke(255, 0, 0, 150);
    //pg.line(arounds[i].x, arounds[i].y, arounds[(i+1)%numOfObjects].x, arounds[(i+1)%numOfObjects].y);
  }
  pg.endDraw();
  image(pg, 0, 0);
}
void mouseDragged() {
  if (placedballs<numOfObjects) {
    arounds[placedballs] = new MovingBall(mouseX, mouseY);
    placedballs++;
  } else {
    MovingBall mb=arounds[placedballs%numOfObjects];
    mb.x=mouseX;
    mb.y=mouseY;
    mb.direction = (int) random(numDirections);
    mb.reset();
    placedballs++;
  }
}
void keyReleased() {
  if (key>'0' && key<='9') {
    numDirections=int(key-48);
  }
  if (key==32) {
    setup();
  }
}
void drawFirefly(color col, PImage img) {
  float distance=0;
  int size=img.width;
  img.loadPixels();
  for (int j=0; j<size; j++) {
    for (int k=0; k<size; k++) {
      distance=dist(j, k, size/2, size/2);
      if (distance<=size/4) {
        img.pixels[j*size+k]=color(col, map(distance, 0, size/4, 255, 100));
      } else if (distance<=size/2) {
        img.pixels[j*size+k]=color(col, map(distance, size/4, size/2, 100, 0));
      } else img.pixels[j*size+k]=color(0, 0);
    }
  }
  img.updatePixels();
}
/*
 * MovingBall class
 *
 * Represents a moving ball that moves in a single direction
 *
 */
class MovingBall {

  float x, y, x0, y0;        // position
  float tx, ty;      // target in x and y
  float step, inc;
  float radius;

  int direction;

  // constructor
  // create a moving ball at the supplied position (x_, y_)
  MovingBall(float x_, float y_) {
    x = x_;
    y = y_;
    direction = (int) random(numDirections);
    reset();
  }

  // run
  // calls move() followed by display()
  // 
  void run() {
    this.move();
    this.display();
  }

  // move
  // move the ball in the desired direction
  //
  void move() {

    step -= inc;
    if (step < 0) {
      x = tx;
      y = ty;
      reset();
    }
    x = lerp(tx, x, step); 
    y = lerp(ty, y, step);

    checkBounds();
  }

  // checkBounds
  // checks that the ball is within the display window.
  // If it reaches the edge, move in the opposite direction
  void checkBounds() {
    if (x <= 0 || x >= width || y <= 0 || y >= height) {
      x = arounds[0].x;
      y =arounds[0].y;
      reset();
    }
  }

  void reset() {
    step = 1;
    inc = random(0.01);
    radius = random(10, 50);
    float angleUnit = TWO_PI/8;//numDirections; 
    mg.beginDraw();
    mg.noStroke();
    mg.fill(0);
    mg.ellipse(tx, ty, 6, 6);
    mg.ellipse(x0, y0, 6, 6);
    mg.tint(100+random(156), 255, 100+random(156));
    mg.image(img, x0, y0);
    mg.endDraw();
    x0=x;
    y0=y;
    tx = x + radius*cos(direction * angleUnit);
    ty = y + radius*sin(direction * angleUnit);
  }

  // display method
  //
  //
  void display() {

    mg.noStroke();
    mg.beginDraw();
    mg.fill(128, 250, 250, 60);
    mg.ellipse(x, y, 2, 2);
    mg.endDraw();
  }
}

