
Sparkle s;
ArrayList<Sparkle> sparkles;
Explosion e;
ArrayList<Explosion> explosions;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(1000, 1000);

  noCursor();
  noStroke();

  sparkles = new ArrayList<Sparkle>();
  explosions = new ArrayList<Explosion>();
}

void draw() {
  background(color(260, 88, 54));  //dark blue
  sparkles.add(new Sparkle(new PVector(mouseX, mouseY)));

  for (int i = 0; i < sparkles.size(); i++) {
    Sparkle s = sparkles.get(i);
    s.run();
    if (s.isDead()) {
      sparkles.remove(i);
    }
  }

  if (mousePressed) {
    for (int i = 0; i < 50; ++i) {
      explosions.add(new Explosion(new PVector(mouseX, mouseY)));
    }
  }

  for (int i = 0; i < explosions.size(); ++i) {
    Explosion e = explosions.get(i);
    e.run();
    if (e.isDead()) {
      explosions.remove(i);
    }
  }
}

class Sparkle {
  PVector location;
  float lifespan;

  Sparkle(PVector l) {
    location = l.get();
    lifespan = 255;
  }

  void run() {
    update();
    display();
  }

  void update() {
    lifespan -= 4;
  }

  void display() {
    float i = random(2, 6);
    fill(64, 69, 100);  //yellow
    quad(location.x-i, location.y, location.x, location.y-i, location.x+i, location.y, location.x, location.y+i);
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    }
    else {
      return false;
    }
  }
}

class Explosion {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int     lifespan;

  Explosion(PVector l) {
    acceleration = new PVector(random(-1.5, 1.5), random(-1.5, 1.5));
    velocity = new PVector(random(-0.01, 0), random(-0.02, 0.03));
    location = l.get();
    lifespan = 255;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2;
  }

  void display() {
    fill(random(330, 360), random(70, 100), random(70, 100), lifespan);  //red
    int radius = (int) random(5, 15);
    ellipse(location.x, location.y, radius, radius);
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    }
    else {
      return false;
    }
  }
}



