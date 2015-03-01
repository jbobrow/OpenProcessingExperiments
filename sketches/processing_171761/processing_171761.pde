
import java.util.Random;

Random generator;

Chaser[] chasers = new Chaser[150];

void setup() {
  size(1000, 800);
  generator = new Random();
  for(int i = 0; i < chasers.length; i++) {
    chasers[i] = new Chaser();
  }
}

void draw() {
  background(82, 179, 217);
  for(int i = 0; i < chasers.length; i++) {
    chasers[i].update();
    chasers[i].checkEdges();
    chasers[i].display();
  }
}

class Chaser {
  Chaser() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2,2), random(-2,2));
    acceleration = new PVector(0, 0);
  }

  void update() {
    PVector mouse = new PVector(mouseX + guassian(0, 20), mouseY + guassian(0, 20));
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(random(0.25, 0.75));
    if(random(0, 1) < 0.0625) {
      acceleration = dir;
    }
    velocity.add(acceleration);
    velocity.limit(3.5);
    location.add(velocity);
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, 5, 5);
  }

  void checkEdges() {
    if(location.x > width) {
      location.x = 0;
    }
    else if(location.x < 0) {
      location.x = width;
    }
    if(location.y > height) {
      location.y = 0;
    }
    else if(location.y < 0) {
      location.y = height;
    }
  }

  PVector location, velocity, acceleration;
};

float guassian(float mean, float sd) {
  return sd * ((float) generator.nextGaussian()) + mean;
}
