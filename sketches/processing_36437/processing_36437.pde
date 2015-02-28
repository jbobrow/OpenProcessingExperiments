
Thrower thrower;
void setup() {
  size(700, 400);
  background(0);
  thrower = new Thrower();
}

void draw() {
  noStroke();
  fill(0, 10);
  rect(0, 0, 700, 400);

  thrower.update();
  thrower.checkEdges();
  thrower.display();
}

class Thrower {
  PVector location;
  PVector velocity;
  PVector acceleration;

  Thrower() {
    location = new PVector(20, 20);
    velocity = new PVector(3, 0);
    acceleration = new PVector(0, 0.15);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, 10, 10);
  }

  void checkEdges() {
    if (location.x>width-16) {
      velocity.x=velocity.x * -0.8;
      location.x=width-16;
    }

    else if (location.x<16) {
      velocity.x=velocity.x * -0.8;
      location.x = 16;
    }

    if (location.y>height-16) {
      velocity.y=velocity.y*-0.8;
      velocity.x=velocity.x*0.99;
      location.y=height-16;
    }

    else if (location.y<16) {
      velocity.y=velocity.y*-0.8;
      location.y=16;
    }

    dist(location.x, location.y, mouseX, mouseY);
    if (dist(location.x, location.y, mouseX, mouseY) < 16) {
      if (mousePressed == true) {
        location.x = mouseX;
        location.y = mouseY;
        velocity.x = mouseX - pmouseX;
        velocity.y = mouseY - pmouseY;
      }
    }
  }
}


