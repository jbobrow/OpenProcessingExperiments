

final int SHADES = 256 ;   // No. of shades of grey (and No. of levels of red, green or blue)

int delta = 0 ;

// -------------------------------------------------
void setup() {
  size(800, 600) ;
  colorMode(RGB, SHADES-1) ;
  
  frameRate(30) ;
}

// ------------------------------------------------------------------------------ main methods
void draw() {
  for (int x = 0 ; x < width ; x++) {
      for (int y = 0 ; y < height ; y++) {
        set(x, y, color( ((x+y)+(5*x*x+5*y*y+ (x+y)*delta)) % SHADES+50, (delta%100*(x/(y+1) + 2*delta)) % SHADES, (delta%100*(y/(x+1) + 2*delta)) % SHADES, (delta) % SHADES)) ;
      }
  }
  delta++ ;
}
*/ // -----------------------------------------------------------------------------------------


