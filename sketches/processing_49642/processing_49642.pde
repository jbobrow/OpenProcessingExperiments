

float xoff = 0; 
float yoff = 0;
float driftXN = 0; 
float driftYN = 0; 

void setup() {
  size(900,450);
  frameRate(112);
  smooth();
  background(255);
  drawGrid();
}

void draw() {
  fill(255,5);
  noStroke();
  rect(0,0,width, height);
  driftXN += 0.01;
  driftYN += 0.01;
  xoff += (noise(driftXN) * 0.2) - 0.1;
  yoff += (noise(driftXN) * 0.2) - 0.1;
  drawGrid();
}


void drawGrid() {
  pushMatrix();
//  translate(250,150);
translate(150,150);
  float inc = 0.02;
  float xnoise = xoff + inc;
  float ynoise = yoff + inc;
  for (int y = -100; y < 100; y+=4) {
    for (int x = -100; x < 100; x+=4) {
      drawShape(x, y, 0, 0, noise(xnoise,ynoise));
      xnoise += inc;
    }
    xnoise = xoff + inc;
    ynoise += inc;
  }
  popMatrix();
}

void drawShape(float x, float y, float wid, float hei, float factor) {
  stroke(int(factor *60), int(factor *180), int(factor *255), 50);
  pushMatrix();
  translate(x, y);
  int rot = int(factor * 720);
  rotate(radians(rot));
  line(0, 0, 600, 0);
  popMatrix();
}
