

float y = 0;

void setup () {
  size (800, 800);
  frameRate (5);
}

void draw() {
  background (random(60, 216), random (9, 179), random(98, 222));
  // t right
  fill (0, 255, 0);
  stroke (0, 255, 0);
  for (float i =-25; i<=800-100; i +=25) {
    for (float z = 0; z<=800-100; z+=25) {
      triangle (z, i, z+50, i, z+25, i+25);
      z += random (800);
    }
  }
  fill (0, 255, 0);
  stroke (0, 255, 0);
  for (float i =-25; i<=800-100; i +=25) {
    for (float z = 0; z<=800-100; z+=25) {
      triangle (z, i, z+50, i, z+25, i+25);
      z += random (800);
    }
    // t left
    fill (0, 255, 0);
    stroke (0, 255, 0);
    for (int r =-25; r<=800; r +=25) {
      triangle (750, r, 800, r, 775, r+25);
    }
  }
}


