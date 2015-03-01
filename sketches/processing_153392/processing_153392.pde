
/*
 * Creative Coding
 * Week 5, 03 - Moving balls
 *
 * This sketch shows the basics of classes and objects in Processing
 * It defines a class called "Ball" with member functions that move and display
 *
 */

// declare array of Balls
Ball theBalls[];
int numBalls = 100;
PGraphics inst;

void setup() {
  size(500, 500);

  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = random(10,30);//constrain(20 + (randomGaussian() * 4), 1, 100);
    theBalls[i] = new Ball(random(width), random(height), ballSize);
    theBalls[i].randomiseDirection();
  }
  background(0);
  textAlign(CENTER);
  inst=createGraphics(int(width/2), int(height/4)+10);
  inst.beginDraw();
  inst.textSize(14);
  inst.textAlign(CENTER,CENTER);
  inst.background(255,128,128, 150);
  inst.fill(128,255,128);
  inst.text("Press 't' information labels.\n" +"Press 'r' for vector arrows.\n"+
    "Press 'c' to colour circles.\n"+"Press 'd' for drawing mode.\n"+"Press 'f' for collision mode.\n"+
    "Press 'e' to hide or show panel.", (width/4), (height/8));
  inst.endDraw();
  textSize(10);
}

void draw() {
  if(!draw_show) background(0);
  for (int i = 0; i < numBalls; ++i) {
    theBalls[i].move();
    theBalls[i].display();
  }
  if (inst_show)image(inst, width/4, height/2-height/4);

}  

boolean label_show = false;
boolean arrow_show = false;
boolean col_show = false;
boolean draw_show = false;
boolean inst_show = true;
boolean col_test = false;
void keyPressed() {
  if (key == 't') label_show = !label_show;
  if (key == 'r') arrow_show = !arrow_show;
  if (key == 'c') col_show = !col_show;
  if (key == 'd') draw_show = !draw_show;
  if (key == 'e') inst_show = !inst_show;
  if (key == 'f') col_test = !col_test;
  if (key == 's') saveFrame("balls##.png");
}
/*
 * declaration of the class "Ball"
 * Which represents the concept of a moving ball with a direction, speed
 * and rate of change in direction.
 *
 */
class Ball {

  // instance variables
  float x;        // x position
  float y;        // y position
  float size;     // ball size
  float speed;    // how fast the ball is moving
  float direction;// direction of travel
  float omega;    // rotational speed
  boolean colliding;
  float overlap;


  // constructor: called when a new Ball is created
  // Note that the constructor is a special function that
  // does have a return type (not even a void) and can't
  // return any value
  Ball(float x_, float y_, float size_) {
    // store supplied values in the instance variables
    x = x_;
    y = y_;
    size = size_;

    // set speed and directions to 0
    speed = 0;
    direction = 0;
    omega = 0;
    colliding = false;
  }


  // randomiseDirection
  // randomise the speed and direction of the ball
  void randomiseDirection() {
    speed = random(1);
    direction = random(360);
    omega = random(0, 1);
  }

  // move method
  // moves the ball in the current direction
  void move() {
    float dx, dy; 
    /*
     * direction is an angle that represents the current
     * direction of travel.
     * speed is the current speed in units/frame
     */
    dx = cos(radians(direction)) * speed;
    dy = sin(radians(direction)) * speed;
    x += dx;
    y += dy;
    direction += omega;
    if (checkBounds()) {
      direction += 180;
      direction = direction % 360;
    }
    if (collide()) {
      direction += 180;
      direction = direction % 360;
      x += overlap*cos(radians(direction));
      y += overlap*sin(radians(direction));
    }
  }

  // checkBounds
  // checks that the ball is within the display window.
  // If it reaches the edge, move in the opposite direction
  boolean checkBounds() {
    return (x <= 0 || x >= width || y <= 0 || y >= height);
  }

  boolean hitCheck(Ball anotherBall) {
    float testdis = dist(x, y, anotherBall.x, anotherBall.y);
    overlap = size/2 + anotherBall.size/2 - testdis;
    return testdis < (size/2 + anotherBall.size/2) && testdis > 0;
  }

  boolean collide() {
    colliding = false;
    for (int i = 0; i < numBalls; ++i) {
      colliding = hitCheck(theBalls[i]);
      if (colliding) break;
    }
    if (col_test) return colliding;
    else return false;
  }

  // display method
  // draws the ball as a transparent circle with a red point at the centre
  //
  void display() {
    noStroke();
    if (col_show) {
      colorMode(HSB, 40, 100, 100);
      fill(direction%40, map(speed+20, 0, 1, 1, 100), map(omega+20, 0, 1, 1, 100));
    } else {
      colorMode(RGB, 255, 255, 255);
      if (colliding && col_test) fill(255, 255);
      else fill(200, 100);
    }
    ellipse(x, y, size, size);
    if (col_test) stroke(255, 0, 0);
    else stroke(0,255, 0);
    point(x, y);
    if (arrow_show) {
      float ax = x+speed*15*cos(radians(direction));
      float ay = y+speed*15*sin(radians(direction));
      line(x, y, ax, ay);
      triangle(ax, ay, ax+3*cos(radians(direction+130)), ay+3*sin(radians(direction+130)), ax+3*cos(radians(direction-130)), ay+3*sin(radians(direction-130)));
    }
    if (label_show) text("Spd "+nf(speed, 1, 1)+" Dir "+nf(direction, 1, 1), x, y);
  }
}

