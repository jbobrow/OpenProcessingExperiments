
void setup() {
  size(900,450);
  frameRate(112);
  smooth();
  background(255);
  drawGrid();
}

float xoff = 0; 
float yoff = 0;
float driftXN = 0; 
float driftYN = 0; 

void draw() {
  background(255);
  driftXN += 0.001;
  driftYN += 0.02;
  xoff += (noise(driftXN) * 0.03) - 0.03;
  yoff -= (noise(driftXN) * 0.05);
  drawGrid();
}

void drawGrid() {
  pushMatrix();
  translate(450,150);
  noFill();
  strokeWeight(0.8);
  float xnoise = xoff;
  float ynoise = yoff;
  int stro = 0;
  for (float y = -200; y <= 200; y+=0.5) {
    stroke(stro, (y+140)/2, stro, 40);
    for (int x = -200; x <= 230; x+=80) {
      float offset = (noise(xnoise,ynoise) * 40) -20;
      float rad = noise(xnoise,ynoise) * 50;
      ellipse(x, y+offset, rad *2, rad);
      xnoise += 0.1;
    }
    stro += 250;
    if (stro > 255) { stro = 0; }
    xnoise = xoff;
    ynoise += 0.005;
  }
  popMatrix();
}

