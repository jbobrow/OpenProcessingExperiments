

// decalre global variables
int num = 3;
int[] sx = new int[num];
int[] sy = new int[num];
int[] ss = new int[num];
int[] sc = new int[num];

void setup() {
  size( 1024, 576 );
  colorMode( HSB );
  noFill();
  noLoop();

  // set shape1 settings
  for (int i=0; i<num; i++) {
    sx[i] = int(random(width));
    sy[i] = int(random(height));
    ss[i] = int(random(height/6, height/3));
    sc[i] = int(random(255));
  }
} // end setup()


void draw() {
  background( 140, 255, 40 );
  for (int i=0; i<num; i++) {
    drawShape1( sx[i], sy[i], ss[i], sc[i] );
  } // end if() i
} //end draw()



void drawShape1( int centreX, int centreY, int size, int colour ) {
  stroke ( colour, 128, 255, 64 );
  for (float rotation=0; rotation < TWO_PI; rotation+= PI/8) {
    pushMatrix();
      translate( centreX, centreY );
      rotate ( rotation );
      for (float a=0; a < PI; a+= PI/32) {
        float x1 = cos( a ) * (sin(a)*(size/PI));
        float y1 = sin( a ) * (sin(a)*size);
        line ( 0, 0, x1, y1 );
        int r= int ( random ( 3, 8 ) );
        ellipse ( x1, y1, r, r );
      } // end for() a
    popMatrix();
  } // end for() rotation
} //end drawShape1void drawShape1( int centreX, int centreY, int size ) {




