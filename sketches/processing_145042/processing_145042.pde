
// David Mrugala

float number=90;

void setup() {
  size(600, 600);
}

void draw() {
  background(249, 232, 163);

  noFill();
  strokeCap(PROJECT);
  strokeWeight(mouseY/30);
  stroke(5, 35, 37);

  for (int i=100; i<width; i+=100) {
    for (int j=100; j<height; j+=100) {
      pushMatrix();
      geo01(i, j);
      popMatrix();
    }
  }
}

void geo01(float x, float y) {
  float a = mouseY/10;
  translate(x, y);
  for (float n=0; n<360; n+=number) {
    pushMatrix();
    rotate(radians(mouseX));
    rotate(radians(n));
    line(50+a, -50, 50, 50-a);
    popMatrix();
  }
}

void keyPressed() {
  if (key=='1') {number=360/1;}
  if (key=='2') {number=360/2;}
  if (key=='3') {number=360/3;}
  if (key=='4') {number=360/4;}
  if (key=='5') {number=360/5;}
  if (key=='6') {number=360/6;}
  if (key=='7') {number=360/7;}
  if (key=='8') {number=360/8;}
  if (key=='9') {number=360/9;}
}

