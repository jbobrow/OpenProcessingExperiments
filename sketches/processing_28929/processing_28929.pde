
//global variables, can be used anywhere
int xPos = 225;
int yPos = 225;



//setup the stage
void setup() {
  int stageWidth = width;
  int stageHeight = height;
  size(450, 450);
  background(0, 0, 0);
  smooth();
  stroke(75, 75, 75);
  strokeWeight(.5);
  noFill();
}

void draw() {
  // variable to set width and height
  int d = 56;
  // c stands for column, for loop
  for (int c = 0; c < 8; c++) {
    // next loop is inside the first, r stands for row
    for (int r = 0; r < 15; r++) {
      drawTile(56 * c, 28 * r, d);
    }
  }
}

void drawTile(int xPos, int yPos, int d) {
  ellipse(xPos + 29, yPos + 29, d, d);

}


