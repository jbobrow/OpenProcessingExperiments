
/*
 20061044 Ji Min Woong
 Digital Media Art Workshop @ Sogang University, 2013
 Assignment 3                                        */

Mover[] movers = new Mover[100];  //bug objects
int[] beaconsX = new int[100];    //array of X values of beacons
int[] beaconsY = new int[100];    //array of Y values of beacons

int max = 0; // actually means the number of bugs

void setup() {
  size(600, 600);
  //smooth();
  frameRate(60);
  background(255);
  /* making bug objects */
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void reset() {
  for (int i = 0; i < beaconsX.length; i++) {
    beaconsX[i] = 0;
    beaconsY[i] = 0;
  }
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
  max = 0;
}

void draw() {

  /* on-screen intorduction */
  textSize(10);
  fill(180, 180, 100);
  text("Press R to reset", width - 140, 20); 
  text("Press C to change color", width - 140, 30);

  /* manage key press */
  if (keyPressed) {
    switch (key) {
    case 'r' : //call reset()
      reset();
      break;
    case 'c' : //change color
      movers[max].bugcolor = color(random(0, 255), random(0, 255), random(0, 255));
      break;
    default :
      break;
    }
  }

  /* rectangle to dessolve everything */
  fill(0, 30);
  rect(0, 0, width, height);

  /* update every movers(bugs) */
  for (int i = 0; i <= max; i++) {
    movers[i].update(i);
    movers[i].checkEdges();
    movers[i].display();
  }
}

void mouseClicked() {

  if (max < 99) {

    /* draw light beacon */
    fill(180, 170, 100);
    ellipse(mouseX, mouseY, 30, 30); 
    fill(200, 190, 100);
    ellipse(mouseX, mouseY, 15, 15); 

    /* set the beacon of index 'max' */
    beaconsX[max] = mouseX;
    beaconsY[max] = mouseY;
    max++;
  }
}


class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  color bugcolor;
  float speed;

  /* constructor */
  Mover() {
    location = new PVector (random(width), random(height));
    velocity = new PVector (0, 0);
    bugcolor = color(random(0, 255), random(0, 255), random(0, 255));
  }

  void update(int bIndex) {

    PVector dirVector;

    if (beaconsX[bIndex] != 0) //if there's an beacon for the bug of 'bIndex'
      dirVector = new PVector(beaconsX[bIndex], beaconsY[bIndex]);    //go to the beacon
    else    //if not
      dirVector = new PVector(mouseX, mouseY);    //track the mouse
    PVector dir = PVector.sub(dirVector, location);
    dir.normalize();
    dir.mult(0.3);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(4);
    location.add(velocity);
  }
  
  /* draw */
  void display() {
    noStroke();
    fill(bugcolor);
    pushMatrix();
    translate(random(-5, 5), random (-5, 5));
    ellipse(location.x, location.y, random(3, 10), random(3, 10));
    popMatrix();
  }
  
  /* removing edges */
  void checkEdges() {
    if (location.x > width)
      location.x = 0;
    else if (location.x < 0)
      location.x = width;
    if (location.y > height)
      location.y = 0;
    else if (location.y < 0)
      location.y = height;
  }
}

