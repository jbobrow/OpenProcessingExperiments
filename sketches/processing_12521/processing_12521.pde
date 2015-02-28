
void setup() {
  size(640,480);
  smooth();
  rectMode(CORNER);

  cuttingUp();
}


void draw() {
}

void cuttingUp() {
  background (200,60);

  rect(30, 30, width-60, height-60);


  for (int i = 1; i < width; i = i + 1) {

    float y1 = random(30, height-60);
    float y2 = random(30, height-60);
    float y3 = random(30, height-60);
    float y4 = random(30, height-60);
    float x1 = random(30, width-60);
    float x2 = random(30, width-60);
    float x3 = random(30, width-60);
    float x4 = random(30, width-60);


    quad(x1, y1, x2, y2, x3, y3, x4, y4);
  }
}


void keyPressed() {
  if (key == ' ') {
    cuttingUp();
  }
}



