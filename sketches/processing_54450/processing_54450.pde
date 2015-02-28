
//Problem Set 1.4 by Nathan Smofsky
//8x8 grid (using loops)

background(255);
size(400, 400);

int x = 40;
int y = 40;
int spacing = 40;
int len = 320;
int endLegs = 360;

  stroke(0);
  while (x <= endLegs) {
  line (x, 40, x, y+len);
  x = x + spacing;
}

 stroke(0);
  while (y <= endLegs) {
  line (40, y, 40+len, y);
  y = y + spacing;
}







