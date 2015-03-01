
/*
 * Creative Coding
 * Week 4, 03 - adressing pixels
 * by Renzo Wouters
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows a number of bouncing balls of random size. Each ball 'travels' within the sketch and bounces of the edges. 
 * Each ball accelerates towards the location of the mouse. Each ball has its own acceleration speed.
 * The colors of the balls are determined by mapping the location of the ball to the colors of the loaded image. 
 *
 */

Mover[] movers;

PImage myImg;
 
void setup() {
  size(800,600);
  
  myImg = loadImage("nasaImage.jpg");
  
  movers = new Mover[200];
  for (int i=0; i < movers.length; i++) {
    movers[i] = new Mover(random(1,25));
  }
}
 
void draw() {
  background(255);
  
  for (int i=0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    color col = myImg.get((int) map(movers[i].location.x, 0, width, 0, myImg.width), (int) map(movers[i].location.y, 0, height, 0, myImg.height));
    movers[i].update(col);
    movers[i].display();
  }
}

class Mover {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float size;
  color col;
 
  Mover(float t) {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0,0);
    topspeed = t;
    size = random(10,100);
  }
 
  void update() {
    PVector mouse = new PVector(mouseX,mouseY);
    // Step 1: Compute direction
    PVector dir = PVector.sub(mouse,location);

    // Step 2: Normalize
    dir.normalize();

    // Step 3: Scale
    dir.mult(0.5);

    // Step 4: Accelerate
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void update(color c) {
    col = c;
  }

  void display() {
    noStroke();
    fill(col, 90);
    ellipse(location.x,location.y, size, size);
  }
  
  void checkEdges() {
    if (location.x > width || location.x < 0) {
      velocity.x = -velocity.x;
    }
 
    if (location.y > height || location.y <0) {
      velocity.y = -velocity.y;
    }
  }
}


