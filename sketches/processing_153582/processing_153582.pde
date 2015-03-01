
/* (my variation)
 * Creative Coding
 * Week 5, 04 - Moving balls 2
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows the basics of classes and objects in Processing
 * It defines a class called "Ball" with one member function: "display()"
 *
 * Changes by hoxxep:
 * - Added option to spread or center the matrix
 *
 * Fixes by hoxxep:
 * - Improved efficiency (slightly)
 * - Fixed dots becoming stationary by stopping (very) low inc values
 * - Fixed the fade only fading the top left of the matrix
 */
MovingBall centre;
MovingBall[] arounds;
color[] palette = {
  #E4B13B, #8AC6A0, #5E964F
};

int numOfObjects;
boolean centering;

int numDirections;
float angleUnit;

void setup() {
  size(700, 500);

  numOfObjects = 100;
  centering = true;
  
  //FIX: improving efficiency by not repeating unnecessary variable creation, assigns, and calculations
  numDirections = 3;
  angleUnit = TWO_PI/numDirections;
  
  initBalls();
  background(0);
}

void draw() {
  //background(0);
  if (frameCount%50==0) {
    //CHANGE: Make the lines fade slower. 15 alpha still nevessary to make old lines fade completely.
    if (frameCount%150==0) {
      fill(0, 20);
    } else {
      fill(0, 05);
    }
    noStroke();
    //FIX: bug with only the top-left corner fading width and heigh are *2
    //no idea why this is necessary though?
    rect(0, 0, width * 2, height * 2);
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
  if (centering) {
    for (int i=0; i < arounds.length; i++ ) {
      arounds[i] = new MovingBall(width/2, height/2, palette[i%3] );
    }
  } else {
    for (int i=0; i < arounds.length; i++ ) {
      arounds[i] = new MovingBall(random(width), random(height), palette[i%3] );
    }
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
      //CHANGE: instead of centering ball, place randomly in screen
      if (!centering) {
        x = random(width);
        y = random(height);
      } else {
        x = width/2;
        y = height/2;
      }
      
      reset();
    }
  }


  void reset() {
    step = 1;
    //FIX: fix certain balls becoming stationary for along time
    inc = random(0.001, 0.01);
    radius = random(10, 50);
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
