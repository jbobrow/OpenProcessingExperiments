
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
int numDirections;

void setup() {
  size(600, 600);

  numOfObjects = 100;

  centre = new MovingBall(width/2, height/2);

  arounds = new MovingBall[numOfObjects];

  for (int i=0; i < arounds.length; i++ ) {
    arounds[i] = new MovingBall(random(width), random(height) );
  }

  background(0);
}

void keyReleased(){
  int keyNumber = key-48;
  numDirections = key-48;
  // next line of code to check which key pressed
  //println (" keyNumber" + "=" + key); 
  }
  

void draw() {
    
  // background(0);
  // next bit of code to check if numDirections act
  /*if( numDirections ==6){
    background(255,0,0);
  }*/

  centre.run();

  for (int i=0; i < arounds.length; i++ ) {
    arounds[i].run();
    
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
    this.move();    // this refers to the current object
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
    step = 1;
    inc = random(0.01);
    radius = random(10, 50);
    int keyNumber = 3;     
    int numDirections = keyNumber;
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
    fill(0, 30);
    rect(tx, ty, 10, 10);
    fill(255, 60);
    ellipse(x, y, 2, 2);
           
  }
}



