
int radius = 150;
int segmentCount = 12;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 50);
  smooth();
  noLoop();
}

void draw() {
  int hueMin = 0;
  int hueMax = 360;
  int avstand = 30;
  int sat = 50;
  int sqinc = width/100;

// BACKGROUND COLOURS
for(int i = 0; i<height; i+=sqinc) {
  for(int j = 0; j<width; j+=sqinc) {
    noStroke();
    float hue = map(i, 0, width, 0, 360);
    fill(hue, sat/5, 100);
    rect(i, j, sqinc, sqinc);
  }
}

// LINES
  for (int i = 0; i<=width; i+=avstand) {
    for (int j = 0; j<=height; j+=avstand) {
      float hue = map(i, 0, width, hueMin, hueMax);
      fill(hue, sat, 100);
      stroke(hue, sat, 100, 10);
      line(width/2, height/2, i, j);
    }
  }
  
// CIRCLES
  for (int i = 0; i<=width; i+=avstand) {
    for (int j = 0; j<=height; j+=avstand) {
      float hue = map(i, 0, width, hueMin, hueMax);
      fill(hue, sat, 100);
      stroke(0, 100, 0);
      ellipse(i, j, 10, 10);
    }
  }
}

