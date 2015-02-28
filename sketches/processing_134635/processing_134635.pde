
/* Douglas Tran Feb 17 Creative Computing Rory Solomon */


void setup() {
  size (500, 500);
}

void draw() {
  background (0, 0, 255);
  float value = 250;
  float m = map(125, 0, 250, 0, 500);
  float color1;
  float color2;
  float color3;

  color1 = (random(255, 0));
  color2 = (random(0, 255));
  color3 = (random(0, 255));

  fill (color1, color2, color3);
  ellipse (mouseX, mouseY, 100, 100);
  fill (color1, color2, color3);
  ellipse (mouseY, mouseX, 100, 100);
}



