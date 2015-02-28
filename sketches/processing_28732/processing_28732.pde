
// Global variables
// declare its name and assign it a value
int xPos = 225;
int yPos = 225;
int d = 40;

void setup() {
  size(450, 450);
  background(10, 61, 87);
  smooth();
  stroke(144, 129, 250);
  strokeWeight(.1);
  noFill();
}

void draw() {
  for (int c = 0; c < 10; c++) {
    for (int r = 0; r < 10; r++) {
      drawTile(50 * c, 50 * r, d);
    }
  }
}

void drawTile(int xPos, int yPos, int d) {

  // Draws inner light blue rectangle
  strokeWeight(1);
  stroke(25, 179, 205);
  noFill();
  rect(xPos + 6, yPos + 6, 27, 27);

  // Draws darker blue inner circle
  strokeWeight(25);
  noStroke();
  fill(31, 134, 161);
  ellipse(xPos + 20, yPos + 20, 15, 15);
  //Draws inner dark blue mask inner circle
  fill(10, 61, 87);
  ellipse(xPos + 20, yPos + 20, 10, 10);

  // Drass outer green circles
  strokeWeight(2);
  stroke(175, 222, 65);
  noFill();
  ellipse(xPos + 20, yPos + 20, 60, 60);

  // Draws points on rectangle
  strokeWeight(6);
  stroke(227, 237, 218);
  point(xPos + 5, yPos + 5);
  point(xPos + 33, yPos + 5);
  point(xPos + 5, yPos + 33);
  point(xPos + 33, yPos + 33);

  // Draws points in green rings
  strokeWeight(2);
  point(xPos + 20, yPos + 45);
  point(xPos + 45, yPos + 20);
}


