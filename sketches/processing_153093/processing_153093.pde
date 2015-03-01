
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
ArrayList<MovingBall> arounds;
color[] palette = {
  #E4B13B, #8AC6A0, #5E964F
};

int numOfObjects, c=0;

void setup() {
  size(800, 600);

  numOfObjects = 120;
  arounds = new ArrayList<MovingBall>();
  background(0);
}

void draw() {
  //background(0);

  for (int i=0; i < arounds.size (); i++ ) {
    MovingBall around = arounds.get(i);
    around.run();
  }
  println(arounds.size());

  //if (frameCount%2==0 && frameCount<380) saveFrame("image-###.gif");
}

void mouseDragged() {
  arounds.add(new MovingBall(mouseX, mouseY, palette[c%3]));
  c++;
  if (c>numOfObjects) arounds.remove(0);
}

void keyPressed() {
  if (key=='s') saveFrame("image-###.gif");
  if (key=='c') {
  c=0;
    arounds.clear();
    background(0);
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


