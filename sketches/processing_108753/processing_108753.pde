
/**
 * Relativity. 
 * 
 * Each color is perceived in relation to other colors. The top and bottom 
 * bars each contain the same component colors, but a different display order 
 * causes individual colors to appear differently. 
 */
 
color a, b, c, d, e;

void setup() {
  size(700, 360);
  noStroke();
  a = color (560, 200, 20);
  b = color(10, 30, 10);
  c = color(165, 89, 20);
  d = color(570, 540, 540);
  e = color(55, 150, 127);
  noLoop();  // Draw only one time
}

void draw() {
  drawBand(a, b, c, d, e, 0, width/120);
  drawBand(c, a, d, b, e, height/2, width/128);
}

void drawBand(color v, color w, color x, color y, color z, int ypos, int barWidth) {
  int num = 5;
  color[] colorOrder = { w, v, x, y, z };
  for(int i = 0; i < width; i += barWidth*num) {
    for(int j = 0; j < num; j++) {
      fill(colorOrder[j]);
      rect(i+j*barWidth, ypos, barWidth, height/2);
    }
  }
}


