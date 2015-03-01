
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

int numOfObjects;

void setup() {
  size(600, 600);
  numOfObjects = 100;
  centre = new MovingBall(width/2, height/2);
  arounds = new MovingBall[numOfObjects];
  for (int i=0; i < arounds.length; i++ ) {
    arounds[i] = new MovingBall(mouseX, mouseY );
  }
  background(0);
}

void draw() {
  // background(0);
  centre.run();
  for (int i=0; i < arounds.length; i++ ) {
    arounds[i].run();
  }
}

void mouseReleased(){
  for (int i=0; i < arounds.length; i++ ) {
    arounds[i] = new MovingBall(mouseX, mouseY);
    if (i == arounds.length) {
      i = 0;
    }
  }
}
/*
 * MovingBall class
 *
 * Represents a moving ball that moves in a single direction
 *
 */
class MovingBall {

  float x, y;        // position
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
      x = width/2;
      y = height/2;
      reset();
    }
  }


  void reset() {
    step = 1.01;
    inc = random(0.01);
    radius = random(10, 50);
    int numDirections = 3;
    
    if(key=='1'){numDirections = 1;}
    else if(key=='2'){numDirections = 2;}
    else if(key=='3'){numDirections = 3;}
    else if(key=='4'){numDirections = 4;}
    else if(key=='5'){numDirections = 5;}
    else if(key=='6'){numDirections = 6;}
    
    float angleUnit = TWO_PI/numDirections; 
    direction = (int) random(numDirections);

    tx = x + radius*cos(direction * angleUnit);
    ty = y + radius*sin(direction * angleUnit);
  }

  // display method
  //
  //
  void display() {
    noStroke();
    rectMode(CENTER);
    //fill(0, 30);
    //rect(tx, ty, 10, 10);
    fill(255, 60);
    stroke(0,60);
    ellipse(x, y, 3, 3);
  }
}



