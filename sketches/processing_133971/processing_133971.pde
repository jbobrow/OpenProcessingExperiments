
float x = 10; // integer 0, 1, 2, 3, 4
int y = 75;

void setup() {
  size( 1000, 100 );
}

void draw() {
  background( 204 );
  line( x, y, x+20, y-40 );
  line( x+10, y, x+30, y-40 );
  line( x+20, y, x+40, y-40 );
  // x = 20
  x = x + 0.1;
  println( x );
  // x = 21
  if ( x > 100.1 ) {
    x = -40;
  }
}



