
Walker walker;
ArrayList walkers;

void setup() {
  size(600, 600);
  frameRate(90);
  background(0);
  walkers = new ArrayList();
  for (int i=0; i<400; i++) {
    walkers.add(new Walker(random(width), random(height)));
  }
}

void draw() {
  for (int i=0; i<walkers.size(); i++) {
    walker = (Walker)walkers.get(i);
    walker.walk();
    walker.draw();
  }
}

class Walker {
  float x, y;

  Walker(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void walk() {

    this.x += random(-0.947, 1);
    this.y += random(-0.87, 1);

    if (this.x < 0) {
      this.x = width;
    }
    if (this.y < 0) {
      this.y = height;
    }
    if (this.x > width) {
      this.x = 0;
    }
    if (this.y > height) {
      this.y = 0;
    }
  }

  void draw() {
    noStroke();
    fill(255, 25);
    ellipse(x, y, 1, 1);
  }
}


