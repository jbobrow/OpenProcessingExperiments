
int numRect = 0;
float x = 100;
float y = 100;

float[] rectXps = new float[0];
float[] rectYps = new float[0];

void setup() {
  size(700, 400);
  background(255);
  smooth();
}

void draw() {

  int i = 0;
  while (i < numRect) {
    rectMode(CENTER);
    rect(rectXps[i], rectYps[i], 100, 100);
    rectXps[i]=rectXps[i]+1;
    i=i+1;

  }

}

void mousePressed() {
  numRect = numRect + 1;

  rectXps = expand(rectXps, numRect);
  rectYps = expand(rectYps, numRect);

  rectXps[0] = mouseX;
  rectYps[0] = mouseY;

}

