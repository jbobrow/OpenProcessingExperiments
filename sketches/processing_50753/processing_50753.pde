
PImage penguin;

class Mover {
  PVector location;
  PVector acceleration;
  PVector velocity;
  float fleeMaxSpeed;
  int penguinSize;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-3, 3), random(-3, 3));
    acceleration = new PVector(random(-0.1,0.1),random(-0.1,0.1));
    fleeMaxSpeed = 11;
    penguinSize = 100;
  }

  void display() {
    penguin = loadImage("penguin.jpg");
    image(penguin, location.x-(round(penguinSize/2)), location.y-(round(penguinSize/2)), penguinSize, penguinSize);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(fleeMaxSpeed);
    location.add(velocity);
  }

  void checkEdges() {
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }

    if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  }

  void avoidOthers() {
    PVector thisVector = new PVector(location.x, location.y, 0);
    for (int i=0; i < movers.length; i++) {
      PVector testVector = new PVector(movers[i].location.x, movers[i].location.y, 0);
      float d = PVector.dist(thisVector, testVector);
      if (d < 100) {
        movers[i].velocity.x = movers[i].velocity.x * -1;
        movers[i].velocity.y = movers[i].velocity.y * -1;
        velocity.x = velocity.x * -1;
        velocity.y = velocity.y * -1;
      }
    }
  }
}


