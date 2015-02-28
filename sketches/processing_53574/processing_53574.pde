
//PS_2 Question 4
//Milton Sukhabut

void setup() {
  size(500, 500);
}

void draw () {
  background (0);
  int x = 200;

  if (intersect (125, 125, x/2, mouseX, mouseY, x/2)) {
    fill(250, 90, 266);
  }

  else {
    fill(80, 150, 50);
  }

  rect(150, 150, x, x);
  rect(mouseX, mouseY, x, x);
}

boolean intersect (float a1, float b1, float c1, float a2, float b2, float c2) {
  float d = dist(a1, b1, c1, a2, b2, c2);
  if ( d < (c1 + c2) ) {
    return true;
  }
  else {
  return false;
}
}

