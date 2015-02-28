
int numberOfObjects = 400;
int minSize = 10;
int maxSize = 90;
int mouseXit = 102;
int mouseYit = 60;

void setup() {
  size(640, 480);
  colorMode(HSB);
  rectMode(CENTER); 
  stroke(0, 0);

  drawPattern();
}


void drawPattern() {

  background(200, 60);

  float randomH = random(343, 360);
  float randomS = random(40, 100);
  //  float randomB = random(0, 100);

  float y1 = random(0, height);
  float y2 = random(0, height);
  float y3 = random(0, height);
  float y4 = random(0, height);
  float x1 = random(0, width);
  float x2 = random(0, width);
  float x3 = random(0, width);
  float x4 = random(0, width);

  for (int i=0; i < numberOfObjects; i = i + 1) {
    fill(randomH, randomS, 100);

    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    noFill();
    stroke(90);
    rect(x1+mouseYit, y1+mouseXit, x1+x4, y1+y4);
  }
}

void draw() {
}



void keyPressed() {
  if (key == ' ') {
    drawPattern();
  }
}
void mouseMoved() {
  mouseYit = floor(map( mouseX, 0, width, 0, 50));
  mouseXit = floor(map( mouseY, 0, height, 0, 50));
}


