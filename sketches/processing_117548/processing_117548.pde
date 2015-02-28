
// Learning Processing Example 9-8. Thanks Shiffman!
// A trail of previous mouse positions.

final int TRAIL_LENGTH = 50;

int[] xpos = new int[TRAIL_LENGTH];
int[] ypos = new int[TRAIL_LENGTH];

void setup() {
  size(400, 400);
  initializeTrail();
}

void draw() {
  background(200);
  shiftExistingPositions();
  saveLatestPosition();
  for (int i = 0; i < TRAIL_LENGTH; ++i) {
    noStroke();
    fill(255 - i * 5);
    ellipse(xpos[i], ypos[i], i, i);
  }
}

void initializeTrail() {
  for (int i = 0; i < TRAIL_LENGTH; ++i) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
}

void shiftExistingPositions() {
  for (int i = 0; i < TRAIL_LENGTH - 1; ++i) {
    xpos[i] = xpos[i + 1];
    ypos[i] = ypos[i + 1];
  }
}

void saveLatestPosition() {
  xpos[TRAIL_LENGTH - 1] = mouseX;
  ypos[TRAIL_LENGTH - 1] = mouseY;
}
