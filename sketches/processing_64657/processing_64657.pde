
Walker walker;

void setup() {
  size(200, 200);
  background(0);
  walker = new Walker(width/2, height/2);
  walker.draw();
}

void draw() {
  walker.walk();
  walker.draw();
}

class Walker {
  float x, y;

  Walker(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void walk() {

    this.x += random(-1, 1)*2;
    this.y += random(-1, 1)*2;

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
    fill(255, 30);
    ellipse(x, y, 4, 4);
  }
}


