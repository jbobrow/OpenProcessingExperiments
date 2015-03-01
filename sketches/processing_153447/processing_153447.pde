
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
 
 // r - random ball in random point
MovingBall centre;
//MovingBall[] arounds;
ArrayList <MovingBall> arounds;

int numOfObjects;

void setup() {
  size(600, 600);

  numOfObjects = 100;

  centre = new MovingBall(width/2, height/2);
  
  arounds = new ArrayList<MovingBall>();
  
  /*
  for (int i=0; i < arounds.length; i++ ) {
    arounds[i] = new MovingBall(random(width), random(height) );
  }
*/
  background(0);
}

void draw() {
  // background(0);

  centre.run();
  for (int i=0; i < arounds.size(); i++ ) {
    MovingBall ball = arounds.get(i);
    ball.run();
  }
}
void keyPressed() {
  if (key == 's') saveFrame("BouncyBouncy.jpg");
  else if (key == 'r') {
    if (arounds.size()==numOfObjects) arounds.remove(0);
    arounds.add(new MovingBall(random(width),random(height) ));
  } else if (key == 'd')  Moving.alterDirections((int)random(1,9));
  else if ((int)key-48>0 && (int)key-48 < 10) Moving.alterDirections((int)key-48);
  else if (key == CODED) { // Up and Down buttons alter number of possible directions respectively
    if (keyCode == UP)         Moving.alterDirections(0);
    else if (keyCode == DOWN)  Moving.alterDirections(-1);
  }
}
void mouseReleased() {
  if (arounds.size()==numOfObjects) arounds.remove(0);
  arounds.add(new MovingBall(mouseX, mouseY ));
}


/*
 * MovingBall class
 *
 * Represents a moving ball that moves in a single direction
 *
 */
static class Moving {
  static int numDirections = 2;
  
  
  static void alterDirections(int newDir) {
    if (newDir < 0) numDirections--;
    else if (newDir == 0) numDirections++;
    else    numDirections = newDir;
  }
  
}
 
class MovingBall extends Moving {

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
    step = 1;
    inc = random(0.01);
    radius = random(10, 50);
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
    colorMode(HSB,360,100,100);
    fill(360*numDirections/10.0,100,100, 60);
    ellipse(x, y, 2, 2);
    colorMode(RGB);
  }
}

