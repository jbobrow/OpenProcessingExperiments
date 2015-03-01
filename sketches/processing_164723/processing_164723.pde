
Orb[] theOrbs = new Orb[10];

void setup() {
  size(600, 500);
  for (int i = 0; i < theOrbs.length; i++) {
    PVector location =  new PVector(random(width), random(height));
    PVector speed =  new PVector(random(-2, 2), random(-2, 2));
    theOrbs[i] = new Orb(location, speed, theOrbs);
  }
}

void draw() {
  noStroke();
  fill(0, 20);
  rect(0, 0, width, height);

  //background(0);
  fill(200);
  for (int i = 0; i < theOrbs.length; i++) {
    theOrbs[i].run();
  }
}



class Orb {
  PVector location, speed, acceleration;
  Orb[] theArray;

  Orb(PVector loc, PVector spd, Orb[] myArray) {
    location = loc;
    speed = spd;
    theArray = myArray;
  }

  void run() {
    display();
    move();
    bounds();
    mouser();
    collision();
  }

  void display() {
    ellipse(location.x, location.y, 20, 20);
  }

  void move() {
    location.add(speed);
  }

  void bounds() {
    if (location.x > width || location.x < 0) {
      speed.x = speed.x * -1;
      move();
    }
    if (location.y > height || location.y < 0) {
      speed.y = speed.y * -1;
      move();
    }
  }

  void mouser() {
    if (mousePressed == true) {
      PVector mouse = new PVector(mouseX, mouseY);
      PVector direction = PVector.sub(mouse, location);
      direction.normalize();
      direction.mult(.5);
      acceleration = direction;

      speed.add(acceleration);
      speed.limit(2);
      location.add(speed);
    }
  }

  public PVector getLocation() {
    return location;
  }

  void collision() {
    for (int i = 0; i < theArray.length; i++) {
      float distance = PVector.dist(this.getLocation(), theArray[i].getLocation());
      if (distance < 20 && theArray[i] != this) {
        speed.x = speed.x * -1;
        speed.y = speed.y * -1;
        move();
        move();
      }
    }
  }
}

