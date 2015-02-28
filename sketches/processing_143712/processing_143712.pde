
/*
Click, and press any key (2014)
*/

// Square properties

float randA; // Random width
float randB; // Random height
int x = 5; // x and y represent the bounds of the random dimensions
int y = 10;

void setup() {
  size(400, 400);
  noLoop();
  background(random(0, width), height/2, 100);
  colorMode(HSB, width, height, 100);
}

void draw() {
  randA = random(x, y);
  randB = random(x, y);
  for(int i = 0; i<height; i+=randA*2) {
    for(int j = 0; j<width; j+=randB*2) {
      rect(i, j, randA, randB);
    }
  }
}

// Creates two new sets of random values, and redraws everything
void keyPressed() {
  randA = random(x, y);
  randA = random(x, y);
  background(random(0, width), height/2, 100);
  redraw();
}
