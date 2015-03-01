
/* (my variation)
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
color[] palette = {
  #E4B13B, #8AC6A0, #5E964F
};

int numOfObjects;

void setup() {
  size(700, 500);

  numOfObjects = 100;
  initBalls();
  background(0);
}

void draw() {
  //background(0);
  if (frameCount%50==0) {
    fill(0, 15);
    noStroke();
    rect(0, 0, width, height);
  }

  centre.run();
  for (int i=0; i < arounds.length; i++ ) {
    arounds[i].run();
  }
  
  //if (frameCount%2==0 && frameCount<380) saveFrame("image-###.gif");
    
}

void mouseReleased() {
  initBalls();
  background(0);
  
}

void initBalls() {
  centre = new MovingBall(width/2, height/2, palette[int(random(3))]);
  arounds = new MovingBall[numOfObjects];
  for (int i=0; i < arounds.length; i++ ) {
    arounds[i] = new MovingBall(random(width), random(height), palette[i%3] );
  }
}

void keyPressed() {
  saveFrame("image-###.gif");

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
  color col;

  int direction;

  // constructor
  // create a moving ball at the supplied position (x_, y_)
  MovingBall(float _x, float _y, color _col) {
    x = _x;
    y = _y;
    col = _col;

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
    int numDirections = 3;
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
    ellipse(tx, ty, 10, 10);
    fill(col, 60);
    ellipse(x, y, 2, 2);
  }
}



