
//global variables, can be used anywhere
int xPos = 0;
int yPos = 0;



//setup the stage
void setup() {
  int stageWidth = width;
  int stageHeight = height;
  size(450, 450);
  background(255, 255, 255);
  smooth();
  stroke(7, 108, 183);
  strokeWeight(1);
  noFill();
  noLoop();
}

void draw() {
  // variable to set width and height
  int d = 50;
  // c stands for column, for loop
  for (int c = 0; c < 9; c++) {
    // next loop is inside the first, r stands for row
    for (int r = 0; r < 9; r++) {
      drawTile(60 * c, 60 * r, d);
    }
  }
}

void drawTile(int xPos, int yPos, int d) {
  //rect(xPos, yPos, d, d);
  rect(xPos - 15, yPos - 15, d, d);
  rect(xPos - 20, yPos - 10, d, d);
  rect(xPos - 25, yPos -5, d, d);
}


