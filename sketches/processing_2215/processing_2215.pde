
PVector[] dots;
int numDots = 512;
float maxRange = 50.0f;
float minRange = 20.0f;

void setup() {
  size(400, 400);
  colorMode(RGB, 255);
  background(192);
  stroke(32, 32);
  smooth();

  dots = new PVector[numDots];

  this.setDots();
}

void draw() {
  background(192);
  for (int i=0; i<numDots; i++) {
    this.renderLines(dots[i].x, dots[i].y);
  }
}

void keyReleased() {
  this.setDots();
}

void setDots() {
  for (int i=0; i<numDots; i++) {
    dots[i] = new PVector(random(width), random(height));
  }
}

void renderLines(float x_, float y_) {
  for (int i=0; i<numDots; i++) {
    float d = dist(x_, y_, dots[i].x, dots[i].y);
    if (d<maxRange && d>minRange) {
      strokeWeight(25/d);
      line(x_, y_, dots[i].x, dots[i].y);
    }
  }
}



