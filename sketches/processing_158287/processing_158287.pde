

color a, b, c, d, e;

void setup() {
  size(640, 360);
  noStroke();
  a = color(2500, 183, 30);
  b = color(607, 786, 59);
  c = color(588, 226, 100);
  d = color(465, 19, 20);
  e = color(646, 150, 127);
  noLoop();
}

void draw() {
  drawBand(a, b, c, d, e, 0, width/228);
  drawBand(c, a, d, b, e, height/2, width/228);
}

void drawBand(color v, color w, color x, color y, color z, int ypos, int barWidth) {
  int num = 5;
  color[] colorOrder = { v, w, x, y, z };
  for(int i = 0; i < width; i += barWidth*num) {
    for(int j = 0; j < num; j++) {
      fill(colorOrder[j]);
      rect(i+j*barWidth, ypos, barWidth, height/2);
    }
  }
}

