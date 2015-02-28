
int numRect = 0;
float x = 100;
float y = 100;
int indexPosition = 0;

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
    i=i+1;
  }

}

void mousePressed() {
  numRect = numRect + 1;

  rectXps = expand(rectXps, numRect);
  rectYps = expand(rectYps, numRect);

  rectXps[0] = mouseX;
  rectYps[0] = mouseY;

  //2. Now you want to put a value for the new rectanges xpos and ypos into the LAST position of the array. (hint numRect)
  // Remember that arrays start their count from 0. and you access an array by using [ ] brackets.
}

