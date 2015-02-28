
float x0 = 0f, y0 = 0f;
float currentShade = 255f;
float shadeInc = 0.9f;

void setup() {
  size(800, 800);
  stroke(255);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(30);
  float tX = map(mouseX, 0, width, 0, width/10);
  float tY = map(mouseY, 0, height, 0, height/10);
  for (int i = 0; i < 100; i++) {
    fill(255-255*i/100f,0,0,currentShade);
    //fill(255-255*i/100f,0,0,127);
    rect(0, 0, 30, 30);

    translateModulo(tX, tY);
    //tX+= 2f;
    //tY+= 3f;
    tX*= 0.99f;
    tY*= 1.01f;
  }
  resetTransformations();
}

void mouseMoved() {
}

void mouseDragged() {
}

void translateModulo(float x, float y) {
  translate(x, y);
  x0 += x;
  y0 += y;
  while (x0 > width) {
    x0 -= width;
    translate(-width, 0);
    currentShade = (currentShade+1)*shadeInc;
  }
  while (y0 > height) {
    y0 -= height;
    translate(0, -height);
    currentShade = (currentShade+1)*shadeInc;
  }
  while (x0 < 0) {
    x0 += width;
    translate(width, 0);
    currentShade = (currentShade+1)*shadeInc;
  }
  while (y0 < 0) {
    y0 += height;
    translate(0, height);
    currentShade = (currentShade+1)*shadeInc;
  }
}

void resetTransformations() {
  currentShade = 255f;
  x0 = 0f;
  y0 = 0f;
}


