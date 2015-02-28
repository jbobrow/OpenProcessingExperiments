
Mover[] movers = new Mover[20];  // array of objects

void setup() {
  size(400, 400);
  smooth();
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  noStroke();
  fill(180, 10);
  rect(0, 0, width, height);

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}


class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;   // to limit velocity

  Mover() {
    location = new PVector(random(width/2), random(height/2));
    velocity = new PVector(0, 0);
    topspeed = 10;
  }

  void update() {

    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed); // to limit velocity
    location.add(velocity);
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

  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 30, 30);
  }
}
