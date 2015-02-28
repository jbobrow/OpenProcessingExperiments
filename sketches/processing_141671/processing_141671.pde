
int crn = 6; //crests number in row
int crs; // crest size

void setup() {
  size( 650, 650 );

  crs = floor( width / 6 * .8f );
}

void draw() {
  background( 0 );
  dots();
  pushMatrix();
  translate( width/2, height/2);
  rotate( radians( frameCount % 360 ) );
  stroke( 127, 127, 255 );

  crests();

  popMatrix();
}

void dots() {
  int ds = width/100;
  pushStyle();
  noStroke();
  fill( 0, 255, 0 );
  ellipse( width/2, height/2, ds, ds );

  fill( 255, 255, 0 );
  ellipse( width/4, height/4, ds, ds );
  ellipse( 3*width/4, height/4, ds, ds );
  ellipse( 3*width/4, 3*height/4, ds, ds );
  popStyle();
}

void crests() {

  int gridx = width/crn;
  int gridy = height/crn;

  for ( int i = -crn/2; i <= crn/2; i++ ) {

    for ( int j = -crn/2; j <= crn/2; j++ ) {
      crest( i * gridx, j * gridy, crs );
    }
  }
}

void crest( int x, int y, int size ) {
  pushMatrix();
  translate( x, y );
  line( -size/2, 0, size/2, 0 );
  line( 0, -size/2, 0, size/2 );
  popMatrix();
}

