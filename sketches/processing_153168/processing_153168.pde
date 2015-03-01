
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
ArrayList <MovingBall> arounds;

color[] palette = { 
  #E9E2EB, #FA7E6E, #90529E, #6E8394, #B8E63A, #E0F39E
};
int colour=0;
int chosenNumDirections =3;
int maxNumObjects = 100;


void setup() {
  size(600, 600);
  background(0);

  //
  arounds = new ArrayList<MovingBall>();
  arounds.add(new MovingBall( width/2, height/2, palette[colour%palette.length], chosenNumDirections ) );
}


void draw() {
  for (int i=0; i < arounds.size (); i++ ) {
    arounds.get(i).run();
  }
}


void mouseDragged() {
  colour++;
  limitArraySize();
  arounds.add(new MovingBall( mouseX, mouseY, palette[colour%palette.length], chosenNumDirections ) );
}


void limitArraySize() {
  if (arounds.size() == maxNumObjects) {
    arounds.remove(0);
  }
}


void keyPressed() {
  switch(key) {
  case '1':
    chosenNumDirections = 1;
    break;
  case '2':
    chosenNumDirections = 2;
    break;
  case '3':
    chosenNumDirections = 3;
    break;
  case '4':
    chosenNumDirections = 4;
    break;
  case '5':
    chosenNumDirections = 5;
    break;
  case '6':
    chosenNumDirections = 6;
    break;
  case '7':
    chosenNumDirections = 7;
    break;
  case '8':
    chosenNumDirections = 8;
    break;
  case '9':
    chosenNumDirections = 9;
    break;
  case '0':
    chosenNumDirections = 10;
    break;
  case 'c':
    background(0);
    arounds.clear();
    break;
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
  color c;
  int n;

  int direction;

  // constructor
  // create a moving ball at the supplied position (x_, y_)
  MovingBall(float x_, float y_, color c_, int n_) {
    x = x_;
    y = y_;
    c = c_;
    n = n_;
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
    step = 1;
    inc = random(0.01);
    radius = random(10, 50);

    float angleUnit = TWO_PI/n; 
    direction = (int) random(n);

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
    fill(c, 60);
    ellipse(x, y, 2, 2);
  }
}



