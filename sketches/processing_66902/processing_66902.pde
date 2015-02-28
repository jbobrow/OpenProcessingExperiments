

void setup() {

  size (500, 500);
  background(200);
  noStroke();
  smooth();
}

void draw() {

  drawRectangle (0, 0, (int) random (1, 150), (int) random (1, 150));
  drawRectangle (0, 0, 125, 125);
  drawRectangle (125, 0, 125, 125);
  drawRectangle (250, 0, 125, 125);
  drawRectangle (375, 0, 125, 125);
  drawRectangle (0, 125, 125, 125);
  drawRectangle (125, 125, 125, 125);
  drawRectangle (250, 125, 125, 125);
  drawRectangle (375, 125, 125, 125);
  drawRectangle (0, 250, 125, 125);
  drawRectangle (125, 250, 125, 125);
  drawRectangle (250, 250, 125, 125);
  drawRectangle (375, 250, 125, 125);
  drawRectangle (0, 375, 125, 125);
  drawRectangle (125, 375, 125, 125);
  drawRectangle (250, 375, 125, 125);
  drawRectangle (375, 375, 125, 125);
}

void drawRectangle (int Xloc, int Yloc, int size, int num) {
  float grayvalues = 255/num;
  float steps = size/num;
  for (int i=0; i<num; i++) {
    fill(random (0, 250), random (0, 250), random (0, 250));
    rect (Xloc, Yloc, size-i * steps, size- i* steps);
  }
}


