
void ray( int x, int y, float angle, float len ) {
  line( x, y, 
  x + sin( radians( -angle - 180 ) ) * len, 
  y + cos( radians( -angle - 180 ) ) * len
    );
}

boolean illusion = true;

void setup() {
  size( 400, 400 );
}

void draw() {

  background(127);

  if ( illusion ) { 
    for ( int i = 0; i < 360; i+=10 ) {
      ray( width/2, height/2, i, width/2 );
    }
  } 


  noFill();
  ellipse( 11*width/16, 11*height/16, width/3, width/3 );
}

void mousePressed() {
  illusion = false;
}

void mouseReleased() {
  illusion = true;
}

