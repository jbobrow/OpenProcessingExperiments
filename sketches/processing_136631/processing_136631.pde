
Star[] stars = new Star[200];

void setup() {
  size(800, 600, OPENGL);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  colorMode(HSB);
  background(100);
  mouseX = width/2;
  mouseY = height/2;
}

void draw() {
  //background(0);

    for (int i = 0; i < stars.length; i++) {
      stars[i].move();
      stars[i].render();
    }
}

class Star {

  PVector loc, ploc, vel, acc;

  Star() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void move() {

    float distX = mouseX - loc.x;
    float distY = mouseY - loc.y;


    if (abs(distX) < 2 && abs(distY) < 2 ) {
      resetLocToEdge();
    }
    float accX = (mouseX - loc.x);
    float accY = (mouseY - loc.y);
    acc = new PVector(accX, accY);
    acc.limit(.5);
    //vel.mult(.9);

    vel.add(acc);
    vel.limit(8);
    ploc = loc.get();
    loc.add(vel);
  }

  void render() {
    stroke(vel.mag()*8, 189, 100, 30);
    strokeWeight(2);
    line(loc.x, loc.y, ploc.x, ploc.y);
  }

  void resetLocToEdge() {
    int wallNum = (int) random(4);
    switch (wallNum) {
    case 0: 
      loc.y = 0;
      loc.x = random(width);
      break;
    case 1: 
      loc.x = width;
      loc.y = random(height);
      break;
    case 2: 
      loc.y = height;
      loc.x = random(width);
      break;
    case 3: 
      loc.x = 0;
      loc.y = random(height);
      break;
    }
  }
}



