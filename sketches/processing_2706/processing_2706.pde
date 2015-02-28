

/*
 * Just playing around with layering some shapes one on
 * top of another while increasing the darkness.
 */

void setup() {
  size(900, 600);
  background(255);
  smooth();
  noLoop();
}

void draw(){
  // lots of magic numbers
  // this is trying to increase the darkness
  // of the star thing as they progress from
  // the upper left corner to the lower right.
  
  for (int y = 0; y <= 600; y += 300) {
    for (int x = 0;x <= 900; x += 150) {
      int b = x+y + 100;
      stroke(212.0 - b*(128.0/900.0));
      star_thing (x, y, 500, 10);
    }
  }
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

