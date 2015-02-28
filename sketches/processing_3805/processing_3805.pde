
int delta = 0 ;

// -------------------------------------------------
void setup() {
  size(800, 600) ;
}
void draw() {
  for (int x = 0 ; x < width ; x++) {
      for (int y = 0 ; y < height ; y++) {
        set(x, y, color((x*x+y*y+x+y+delta) % 256, (x*x+y*y+3*x+3*y+3*delta) % 256, (x*x+y*y+2*x+2*y+2*delta) % 256, delta/10 % 256)) ;
      }
  }
  delta++ ;
}


