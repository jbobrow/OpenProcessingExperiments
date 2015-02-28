
void setup() {
  background(0);
  size(600, 600);
}

void draw() {
  background(0);
  drawPoly(9, 50, 50, 120);
}

void drawPoly(int numSides, int centerX, int centerY, int rad) {
  int angle = 360/numSides;

  int xDistance = int(rad * acos(radians(angle)));
  int yDistance = int(rad * asin(radians(angle)));

  triangle(centerX+0, centerY+0, centerX+xDistance, centerY+0, centerX+0, centerY+yDistance);


  int[] vertsX = new int[numSides];
  int[] vertsY = new int[numSides];

  for (int i = 0; i < numSides; i+=2) {
    vertsX[i] = 0;
    vertsY[i] = 0;

  }
  stroke(140);
  for (int i = 0; i < numSides-1; i++) {
    line(vertsX[i], vertsY[i], vertsX[i+1], vertsY[i+1]);
  }
  line(vertsX[numSides-1], vertsY[numSides-1], vertsX[0], vertsY[0]);
}


