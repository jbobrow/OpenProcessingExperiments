
/*
 Andor Salga
 IsoBoxes
*/

int offset = 1;
int animation = 0;

final int sideSize = 64;
final int sidesInHorizontal = 8;
final int sidesInVertical = 4;

void setup() {
  // Fit the boxes in exactly
  size(sideSize * sidesInHorizontal, sideSize * sidesInVertical + (sideSize/2) * sidesInVertical );
  rectMode(CENTER);
  strokeWeight(3);
}

void draw() {
  background(200);
  translate(0, sideSize/2.0 + sideSize/4.0);

  for (int y = 0; y < height / (sideSize + (sideSize/2)); y++) {
    pushMatrix();
    translate(0, y * sideSize * 1.5);
    drawBoxes(64, 0.45);
    popMatrix();

    pushMatrix();
    translate(-sideSize, y * sideSize * 1.5);
    drawBoxes(128, -0.45);
    popMatrix();

    offset = (y % 2) * sideSize;
  }

  animation -= 2;
  animation %= sideSize * 4;
}

void drawBoxes(int c, float flip) {
  fill(c);
  // +3 so boxes don't just appear on the right.
  for ( float i = 0; i < (sidesInHorizontal/2) + 3; i++) {
    pushMatrix();
    translate(animation + offset + (i * sideSize * 2), 0);
    shearY(flip);
    rect(0, 0, sideSize, sideSize);
    popMatrix();
  }
}
