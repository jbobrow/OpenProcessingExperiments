
void setup() {
  size (500, 500);
  background (50);
}

void draw() {
  smooth();
}

void mouseClicked() {
  totem(mouseX, mouseY);
}

void totem (int x, int y) {
  float i = 0;

  float dif = 0.0;

  float r = 0.0;
  float g = 0.0;
  float b = 0.0;

  float strValue = 0.0;

  float stampSize = random (20, 500);


  for (i=stampSize; i>0; i=i-dif) {

    r = random (0, 255);
    g = random (0, 255);
    b = random (0, 255);

    dif = random (1, 40);

    strValue = random (1, 10);

    strokeWeight (strValue);


    stroke (255);
    fill (r, g, b, 100);
    ellipse (x, y, i, i);
  }
}
