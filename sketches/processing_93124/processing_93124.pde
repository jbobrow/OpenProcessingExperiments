
/* homework 8 copyright shirley wang 2013 */

int count, call;
int y, deltaX, deltaY, diam;

void setup ( ) {
  size ( 500, 500 );
  background ( 255);
  smooth ( );
  colorMode ( HSB);
  
  y = 15;
  deltaY = 15;
  deltaX = 15;
}

void draw ( ) {
  frameRate ( 20);
  if ( call == 0 ) {
  whileLine ( );
  y = (y + deltaY) % height;
  }
  
  if ( call == 1 ) {
    frameRate ( 50);
    loopCircles ( );
   
  }
}


void whileLine ( ) {
  int x = 0;
  while ( x < width ) {
    stroke ( random( 200 ), 100, 255, 10 );
    strokeWeight ( 2);
    line ( width/2, height/2, x, y );
    x = x + deltaX;

  }
}

void loopCircles ( ) {
  count++;
  for ( int x = 10; x < width; x = x + 100) {
    fill ( random (245), 200, 255, 200 );
    ellipse ( x, y, width/2, height/2);
   y = y + deltaY;
   
   if ( count > 300) {
     count--;
   }
  }
    
}
  

void keyPressed ( ) {
  if ( key == '1') {
    call = 0;
    redraw ( );
  }
  if (key == '2') {
    call = 1;
    redraw ( );
  }
  
}

