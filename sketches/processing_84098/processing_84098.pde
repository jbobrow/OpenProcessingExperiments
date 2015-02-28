
// Grapher is based on a context free art design
// by ColorMeImpressed (takes a bit of time to run)
// http://www.contextfreeart.org/gallery/view.php?id=2844

float CMIN = -2;
float CMAX = 2;
float XMAX = PI;
float XMIN = -XMAX;
float FUZZ = 0.04;
float SZ = 5;

void setup() {  
  size(600, 600);
  noStroke();
  colorMode(HSB, 1.0);
  background(0);
  frameRate(5000);
}

void draw() {
  translate(width/2, height/2);
  if (frameCount < 200000) {
    dot(randomRange(XMIN, XMAX), randomRange(XMIN, XMAX), randomRange(CMIN, CMAX));
  }
}

void dot(float px, float py, float c) {
  float func = sin(px) + sin(py) + c;
  // change function to change the graph eg.
  // func = sin(px) + tan(py) + c    
  // func = cos(px) + sin(py) + c
  if (abs(func) <= FUZZ) {
    fill(((CMIN - c) / (CMIN - CMAX)), 1.0, 1.0);
    ellipse(px * (width / TWO_PI), py * (height / TWO_PI), SZ, SZ);
  }
  else {
    dot(randomRange(XMIN, XMAX), randomRange(XMIN, XMAX), randomRange(CMIN, CMAX));
  }
}

float randomRange(float a, float b) {
  return random(b - a) + a;
}





