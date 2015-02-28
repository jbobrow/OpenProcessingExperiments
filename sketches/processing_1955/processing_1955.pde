

int g;

void setup() {
  
  size( 800, 600 );
  noFill();
  frameRate(12);
  
}

void draw() {

  g++;
  
  if ( g > 11 )
  {
    g = 0;
  }
  
  translate( -10, -30 + g );

  background( 255 );
  for ( int k = 0; k < height/12 + 4; k++ ) {

    strokeJoin(MITER);
    strokeWeight(4);
    beginShape();

    for ( int i = 0; i < width/20; i++ ) {
      vertex( 0 + i*40, 0 + k*12 );
      vertex( 20 + i*40, 20 + k*12 );
      vertex( 40 + i*40, 0 + k*12 );
    }

    endShape();
  
  }


}

