

void setup() {
  size (800, 850);
  background (90, 150, 100);
  smooth ();
}

void draw() {
  float r = random (120, 400);
  float g = random (140, 350);
  float b = random (140, 200);
  float c = random (130, 150);
  stroke (r, g, b, c);

if (mouseButton == RIGHT) 
 line (mouseX, mouseY, r, g);
 
}



