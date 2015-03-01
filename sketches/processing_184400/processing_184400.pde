
void setup() {
  size (500, 500);
}



void draw() {
  if (mouseY<250) { 
    background (0);
  }

  if (mouseY>250) {
    background (255, 252, 252);
  }
  {
    ellipse (250, 250, 90, 90);
  }
}
