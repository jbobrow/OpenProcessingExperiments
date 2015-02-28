
Walker w;
float sz;

void setup() {
  size(640, 480);
  w = new Walker();
  background(0);
  colorMode(HSB, 100);
}

void draw() {
  w.step();
  w.display();
  if (keyPressed == true) {
    save(frameCount + ".jpg");
  }
}
class Walker {
  float x, y;
  float a = 10;
  float sz = 80;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void display() {
    a = map(mouseX, 0, width, 10, 50);
    fill(random(100),90,100,a);
    float size = random(sz/2, sz);
    stroke(0);
    ellipse(x, y, size, size);
  }

  void step() {
    float stepx = random(-10, 10);
    float stepy = random(-10, 10);
    x += stepx;
    y += stepy;

    if (x > width || x < 0) {
      x = random(width);
    }

    if (y > height || y < 0) {
      y = random(height);
    }
  }
}

