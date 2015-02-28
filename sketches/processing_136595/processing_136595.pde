
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// ICE #4
// 1/28/14


void setup( ) {
  size( 400, 400 );
  background( 0 ); 
}

void draw( ) {
  fill( 0, 200, 0 );
  circle( 200, 200, 100 );
  color col = color( 200, 200, 0 ); 
  circle( 300, 200, 50, col ); 
  noLoop( );
}

void circle(float x, float y, float diam) {
  ellipse(x,y,diam,diam);
}

void circle(float x, float y, float diam, color myColor) {
  fill(myColor);
  ellipse(x,y,diam,diam);
}



