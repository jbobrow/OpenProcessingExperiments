
/* Ball droppings 
 inspired by Josh Nimoy's original which can be found here:
 http://www.jtnimoy.net/  */

import processing.opengl.*;

ArrayList balls;
ArrayList lines;
ArrayList points;

float x1, y1, x2, y2;      // variables for line start/ end pos
int count=0;              // counts amounts of mouse clicks

PVector speed;
int radius;
float gravity;
boolean displaylines = false;
color linecolor = color(212,24,58);

void setup() {
  size(800,600);
  smooth();
  noCursor();              // cross corser used
  strokeCap(ROUND);        // nicer line endings

  // frameRate(30);

  balls = new ArrayList();
  lines = new ArrayList();
  points = new ArrayList();
}

void draw() {
  background(255);
  strokeWeight(1);
  stroke(180);              // grey
  crossCursor();
  for (int i=0; i<balls.size(); i++) {
    Ball thisBall = (Ball) balls.get(i);
    thisBall.move();
    thisBall.display();
    thisBall.collide();
  }
  for (int i=0; i< lines.size(); i++) {
    Line thisLine = (Line) lines.get(i);
    if (thisLine.intersect[i] == false) {            // if lines are not intersecting
      thisLine.points();
      thisLine.intersect();
      thisLine.display();
    }
  }
  for (int i=0; i< points.size(); i++) {
    Point thisPoint = (Point) points.get(i);
    thisPoint.display();
    if(points.size()>1) {                          // only display one point at a time, as points are 
      points.remove(i);                            // also included in line class
    }
  }
}

void mousePressed() {
  count++;
  x2 = x1;
  y2 = y1;
  x1 = mouseX;
  y1 = mouseY;
  if (count%2==0) {                      // if remainder of (amount of clicks divided by 2) = 0
    lines.add(new Line(x1, y1, x2,y2));
  }
  else if(count%2!=0) {
    points.add(new Point(mouseX,mouseY));  // add point before line is added
  }
}

void keyPressed() {                        // generate random ball
  radius = 10; //int (random(8,12));
  gravity = (radius/10.0)*0.06;
  speed = new PVector(random(-6,6),random(6));
  if (key == ' ') {                                // space key
    balls.add(new Ball(speed, radius, gravity));
  }
  if (key == 'o') {
    displaylines = true;
  } 
  if (key == 'k') {
    displaylines = false;
  }
}

void crossCursor() {
  line(mouseX, mouseY-10, mouseX, mouseY+10);
  line(mouseX-10,mouseY,mouseX+10, mouseY);
}


