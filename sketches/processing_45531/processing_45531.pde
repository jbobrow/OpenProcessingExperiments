

int i = 20;

void setup() {
  size( 500, 500 );
  smooth();
}

void draw() {
  background( 255 );
  
   for( int y = 0; y <= height; y = y + i ) {
      for( int x = 0; x <= width; x = x + i ) {
        ellipse( x, y, 20, 20 );
      }
   }
}

