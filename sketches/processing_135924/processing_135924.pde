
/**
 * Grid of random colors
 **/


void drawSquareGrid(int nrows, int len, int p0_x, int p0_y) {
  
  int offset = len / nrows;
  int dx = 0;
  int dy = 0;
  
  for(int j = 0; j < nrows; j++){
    for(int i = 0; i < nrows; i++){
      fill(randomColor11());
      rect(p0_x+dx, p0_y+dy, offset, offset);
      dx += offset;
    }
    dy += offset;
    dx = 0;
  }
}

color randomColor11() {
  color[] colors = new color[12];
  colors[0] = color(84,48,5);
  colors[1] = color(140,81,10);
  colors[2] = color(191,129,45);
  colors[3] = color(223,194,125);
  colors[4] = color(246,232,195);
  colors[5] = color(245,245,245);
  colors[6] = color(199,234,229);
  colors[7] = color(128,205,193);
  colors[8] = color(53,151,143);
  colors[9] = color(1,102,94);
  colors[10] = color(0,60,48);
  return colors[(int)random(0,11)];
}

void setup() {
  size(600, 600, OPENGL);
  stroke(255, 0, 0);
  frameRate(2);
}

void draw() {
  drawSquareGrid(6,200,125,125);
}



