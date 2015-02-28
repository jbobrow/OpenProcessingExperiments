
ArrayList<Walker> walkers = new ArrayList<Walker>();
int MAX_WALKER = 7;

void setup() {
  size(500, 500);
  frameRate(1000);
  colorMode(HSB, 360, 100, 100);
  background(360);
  for (int i = 0; i < MAX_WALKER;i++) {
    Walker walker = new RotateRandomWalker(width/2, height/2, 360*i/MAX_WALKER);
    walker.draw();
    walkers.add(walker);
  }
}

void draw() {
  for (Walker walker:walkers) {
    walker.walk();
    walker.draw();
  }
}
abstract class Walker {
  float x, y;
  float t;
  float hue;
  float rect_w = 1;
  float rect_h = 5;
  Walker(float x, float y, float hue) {
    this.x = x;
    this.y = y;
    this.hue = hue;
    this.t = random(TWO_PI);
  }
  abstract void walk();
  abstract void draw();
  
}
class RotateRandomWalker extends Walker {
  RotateRandomWalker(float x, float y, float hue) {
    super(x, y, hue);
  }

  void walk() {
    this.x += random(-1, 1)*2;
    this.y += random(-1, 1)*2;

    if (this.x < 0) {
      this.x = 0;  //width;
    }
    if (this.y < 0) {
      this.y = 0;  //height;
    }
    if (this.x > width) {
      this.x = width;  //0;
    }
    if (this.y > height) {
      this.y = height;  //0;
    }
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    rotate(t);

    noFill();
    stroke(hue, 80, 100, 10);
    rect(0, 0, rect_w, rect_h);    
    popMatrix();

    t += 0.5;
  }
}

