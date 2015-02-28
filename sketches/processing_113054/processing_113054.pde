
/*
float w_in = 12;
float h_in = 9;
float dpi = 72;


int w = int(w_in * dpi);
int h = int(h_in * dpi);

float tile_size_in = 1.5;
float tot_tiles_w = w_in / tile_size_in;
float tot_tiles_h = h_in / tile_size_in;
int tile_size = int(tile_size_in * dpi);
int strokew = int(tile_size_in/7 * dpi);

color light = #FFFFF8;
color dark = #383030;
*/

void setup() {
  size(879, 663);//(w+strokew, h+strokew);
  noLoop();
  noSmooth();
}

void draw() {
color light = #FFFFF8;
color dark = #383030;
  background(light);
  
  float tot_tiles_w = 12 / 1.5;
  float tot_tiles_h = 9 / 1.5;
  int tile_size = int(1.5 * 72);
  
  for (int i = 0; i < tot_tiles_w; i++) {
    for (int j = 0; j < tot_tiles_h; j++) {
      int is_vert = int(random(0, 2));
      int is_hor = int(random(0, 2));
      int x = tile_size * i;
      int y = tile_size * j;
      draw_tile(x, y, is_vert, is_hor);
    }
  }
}

void draw_tile(int x, int y, int is_vert, int is_hor) {
int strokew = 15;
color light = #FFFFF8;
color dark = #383030;
int tile_size = int(1.5 * 72);
  noStroke();
  fill(dark);
  rect(x+strokew, y+strokew, tile_size-strokew, tile_size-strokew);
  stroke(light);
  strokeWeight(strokew);
  strokeCap(SQUARE);
  if (is_hor == 1) {
    float bary = random(0, 1.01) * (tile_size-4*strokew);
    float liney = y + 2*strokew + bary;
    line(x, liney, x+tile_size, liney);
  }
  if (is_vert == 1) {
    float barx = random(0, 1.01) * (tile_size-4*strokew);
    float linex = x + 2*strokew + barx;
    line(linex, y, linex, y+tile_size);
  }
}
