
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

void setup() {
  size(600, 600);
  frameRate(1000);
  img=createImage(12,12,HSB);
  drawFirefly(color(250,14,25),img);
  pg=createGraphics(width, height);
  pg.beginDraw();
  pg.background(0, 0);
  pg.stroke(255, 255, 0);
  pg.strokeWeight(13);
  pg.endDraw();

  mg=createGraphics(width, height);
  mg.beginDraw();
  mg.imageMode(mouseX,mouseY);
  mg.noStroke();    
  mg.rectMode(mouseX,mouseY);
  mg.background(0);
  mg.endDraw();
  numOfObjects = 100;

  centre = new MovingBall(width/2, height/2);

  arounds = new MovingBall[numOfObjects];

  for (int i=0; i < arounds.length; i++ ) {
    arounds[i] = new MovingBall(random(width), random(height) );
  }
}

void draw() {
  image(mg, 0, 0);
  centre.run();
  pg.beginDraw();
  pg.background(0, 0);
  for (int i=0; i < numOfObjects; i++ ) {
    arounds[i].run();
    pg.noStroke();  
    float distance=dist(arounds[i].x, arounds[i].y,arounds[i].tx, arounds[i].ty);
      pg.fill(250,0,0,map(distance,0,50,0,155));
      pg.ellipse(arounds[i].x, arounds[i].y, (frameCount+i)%10, (frameCount+i)%10);
    pg.stroke(355, 250, 0,150);
    //pg.line(arounds[i].x, arounds[i].y, arounds[(i+1)%numOfObjects].x, arounds[(i+1)%numOfObjects].y);
  }
  pg.endDraw();
  image(pg, 0, 0);
}
void drawFirefly(color col,PImage img){
  float distance=0;
  int size=img.width;
    img.loadPixels();
    for (int j=0; j<size; j++) {
      for (int k=0; k<size; k++) {
        distance=dist(j, k, size/2, size/2);
        if (distance<=size/2) {
          img.pixels[j*size+k]=color(col, map(distance, 0, size/2, 50,0));
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

  float x, y,x0,y0;        // position
  float tx, ty;      // target in x and y
  float step, inc;
  float radius;

  int direction;

  // constructor
  // create a moving ball at the supplied position (x_, y_)
  MovingBall(float x_, float y_) {
    x = x_;
    y = y_;

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
      x = random(width);
      y =random(height);
      reset();
    }
  }


  void reset() {
    step = 1;
    inc = random(0.01);
    radius = random(10, 50);
    int numDirections = 3;
    float angleUnit = PI/4;//numDirections; 
    direction = (int) random(numDirections);
    mg.beginDraw();
    mg.noStroke();
    mg.fill(0);
    mg.ellipse(tx, ty,6, 6);
    mg.ellipse(x0,y0,10, 10);
    mg.tint(128+random(128),50,128+random(128));
    mg.image(img,x0,y0);
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
    mg.fill(38,250,250, 60);
    mg.ellipse(x, y, 3,3);
    mg.endDraw();
  }
  
}


