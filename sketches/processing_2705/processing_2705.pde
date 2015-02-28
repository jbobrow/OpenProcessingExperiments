

void setup() {
  size(500, 500);
  background(255);
  smooth();
  noLoop();
}

void draw(){
  translate(250,250);
  star_thing(0,0,500, 10);
}


void star_thing(int x, int y, int sz, int step) {
  int x_min = x-sz/2;
  int x_mid = x;
  int x_max = x+sz/2;
  int y_min = y-sz/2;
  int y_mid = y;
  int y_max = y+sz/2;
  
  // upper left quadrant
  for (int i = 0; i <= sz/2; i += step) {
    line(x_min + i, y_mid, x_mid, y_mid - i);
  }
  // lower left quadrant
  for (int i = 0; i <= sz/2; i += step) {
    line(x_min + i, y_mid, x_mid, y_mid + i);
  }
  // upper right quadrant
  for (int i = 0; i <= sz/2; i += step) {
    line(x_max - i, y_mid, x_mid, y_mid - i);
  }
  // lower right quadrant
  for (int i = 0; i <= sz/2; i += step) {
    line(x_max - i, y_mid, x_mid, y_mid + i);
  }
}

