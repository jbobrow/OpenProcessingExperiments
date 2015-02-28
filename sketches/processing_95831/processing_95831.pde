
float xOff = 20;
float yOff = 30;
int xTotal = 30;
int yTotal = 20;

float linePosX[] = new float[xTotal];
float linePosY[] = new float[yTotal];
void setup () {
  size(450, 450); 
  background(#F0E2AC);
}

void draw () {

  for (int c = -1; c < xTotal; c++) {

    for (int r = -1; r < yTotal; r++) {
      drawTile(42 * c, 65 * r);
      stroke(#676767);
      strokeWeight(0.5);
      line(42 * (c-1), 65 *( r-1)-yOff, 42 * c, 65 * r-yOff);
      line(42 * (c-1), 65 * r-yOff,42 * c, 65 * (r-1)-yOff);
    }
  }
}

void drawTile (int xPos, int yPos) {
  fill(10);
  stroke(50);
  strokeWeight(2);
  smooth();
  quad(xPos, yPos, xPos + xOff, yPos-yOff, xPos+2*xOff, yPos, xPos+xOff, yPos+yOff); // each point of my custom shape
}


