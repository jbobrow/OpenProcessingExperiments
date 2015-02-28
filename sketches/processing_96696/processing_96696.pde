
int dim;

void setup() {
  size(640, 360);
  dim = width/2;
  background(0);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(1);
}

void draw() {
  background(0);
  for (int x = 0; x <= width; x+=dim) {
    drawGradient(x, height/2);
  } 
}

void drawGradient(float x, float y) {
  int radius = dim/2;
  float h = random(0, 360);
    fill(h, 90, 90);
    size(600, 300);
    rect(180, 60, 250, 300);
    h = (h + 1) % 360;
  }




