
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

int maxObjects = 100;
int numOfObjects;
int num;
int index;

void setup() {
  size(600, 600);
  background(0);
  num = 3;
  numOfObjects = 0;
  index = 0;

  centre = new MovingBall(width/2, height/2);

  arounds = new MovingBall[maxObjects];



  for (int i=0; i < numOfObjects; i++ ) {
    arounds[i] = new MovingBall(random(width), random(height));
  }
}

void draw() {
  // background(0);
  centre.run();
  for (int i=0; i < numOfObjects; i++ ) {
    arounds[i].run();
  }
}

void mouseDragged() {
  arounds[index] = new MovingBall(mouseX, mouseY);
  
  if (numOfObjects < maxObjects ) {
    numOfObjects++;
  }
  
  index++;
  
  if (index >= maxObjects) {
    index = 0;
  }
}

void keyReleased() {
  if (key >= '1' && key <= '9') {

    switch (key) {
    case '1':
      num = 1;
      break;
    case '2':
      num = 2;
      break;
    case '3':
      num = 3;
      break;
    case '4':
      num = 4;
      break;
    case '5':
      num = 5;
      break;
    case '6':
      num = 6;
      break;
    case '7':
      num = 7;
      break;
    case '8':
      num = 8;
      break;
    case '9':
      num = 9;
      break;
    default:
      break;
    }
  }
  if (key == 'c' || key == 'C') {
    numOfObjects = 0;
    background(0);
    centre.reset();
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
    int numDirections = num;
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



