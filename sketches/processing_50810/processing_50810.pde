
Mover mover;
PImage b;


void setup() {
  size(600, 400);
  smooth();
  background(#1E73F7);
  mover = new Mover();
}


void draw() {
  noStroke();
  fill(#1E73F7, 100);
  rect(0, 0, width, height);
  
 
    noCursor();
  


  mover.update();
  mover.checkEdges();
  mover.display();
}


class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float diameter;
  //float fly;

  Mover() {
    location = new PVector (random(width), random(height));
    velocity = new PVector(0, 0);
    topspeed = 4;
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.4);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    noStroke();
    fill(#F7CC1E);
    ellipse(location.x+25, location.y-50, diameter, diameter);
    diameter = random(2, 15);
    //fly = random(0,10);
    b = loadImage("peter5.png");
    image(b,mouseX-100,mouseY,width/3,height/3);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    }
    else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    }
    else if (location.y < 0) {
      location.y = height;
    }
  }
}


