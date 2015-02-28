
void setup () {
  //setup background color and stroke attributes
  size(450, 450); //size requirement for assignment
  background(#3A9ABF);
  stroke(#FF9027);
  strokeWeight(2);
  smooth();
}

void draw () {

  //draws columns (c) and rows (r) of the first hexagon pattern
  translate (-10, 35); //resetting 0,0 to properly align pattern
  for (int c = -1; c < 10; c++) { //loops set to -1 so start of pattern will not be visible
    for (int r = -1; r < 10; r++) {
      drawTile(50 * c, 80 * r);
    }
  }

  //draws columns (c) and rows (r) of the second hexagon pattern
  translate (75, 40); //resetting 0,0 so to ensure proper alignment
  for (int c = -1; c < 5; c++) {
    for (int r = -1; r < 5; r++) {
      drawTile(c * 100, r * 80);
    }
  }
}

void drawTile (int xPos, int yPos) {

  //draws a hexagon
  line(xPos, yPos, xPos + 20, yPos - 30);
  line(xPos + 20, yPos - 30, xPos + 50, yPos - 30);
  line(xPos + 50, yPos - 30, xPos + 70, yPos);
  line(xPos + 70, yPos, xPos + 50, yPos + 30);
  line(xPos + 50, yPos + 30, xPos + 20, yPos + 30);
  line(xPos + 20, yPos + 30, xPos, yPos);
}


