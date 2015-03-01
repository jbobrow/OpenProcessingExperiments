
int dim;

void setup() {
  size(400, 400);
  dim = 800;
  colorMode(HSB, 360, 100, 100);
  noStroke();
  rectMode(CENTER);
  frameRate(1);
  smooth();
}

void draw() {

  for (int x=0; x<=width; x+=dim) {
    drawGradient(width, height);
  }
}

void drawGradient(float x, float y) {

  int rectangle = dim;
  float h = random(0, 360);
  
  for (int r = rectangle; r>0; --r) {
    fill(h, 100, 100);
    rect(width/2, height/2, r+150, r+150);
    h = (h+.5)%360;
  }
}


