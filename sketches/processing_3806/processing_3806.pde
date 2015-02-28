
int delta = 0 ;

void setup() {
  size(800, 600) ;
}
void draw() {
  for (int x = 0 ; x < width ; x++) {
      for (int y = 0 ; y < height ; y++) {
        set(x, y, color(((2*y-x) % 128 + 2*delta) % 256, ((x-y) % 128 +3*delta) % 256, ((y-2*x) % 128 + delta) % 256, (4*y+2*delta+3*x) % 32 % 256)) ;
      }
  }
  delta++ ;
}


