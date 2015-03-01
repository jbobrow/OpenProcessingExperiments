
int brickWidth = 20; // width of rect
int brickHeight = 15; // height of rect
int cols = 20; // width of columns
int rows = 24;  // height of rows
int columnOffset = 20; 
int rowOffset = 20;
float rotationIncrement = 0.15;

void setup () {
  size (1200, 768);
  background(255);
  smooth();
  noFill();
  stroke(1);
  noLoop();
}

void draw () {
  translate(0, 0);
  for(int i = 0; i < width; i++) { // as long as i is less than 20, run this statement
  pushMatrix();
  translate(i* columnOffset, 0);
  float r = random(-QUARTER_PI);
    for (int j = 0; j < height; j++) {
      pushMatrix();
      translate(0, rowOffset * j);
      rotate(r);
      rect(-brickWidth / 2, -brickHeight / 2, brickWidth, brickHeight);
      popMatrix();
    }
  popMatrix();
  }
}

