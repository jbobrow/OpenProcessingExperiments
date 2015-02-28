
void ei() {

  pushStyle();
    fill( 200 );
  beginShape();
    vertex( 100.0 , 0.0 );
    bezierVertex(  100.0, -200.0, -100.0, -200.0, -100.0,   0.0 );
    bezierVertex( -100.0,    0.0, -100.0,  100.0,    0.0, 100.0 );
    bezierVertex(    0.0,  100.0,   90.0,  100.0,  100.0,  -1.0 );
  endShape();
  popStyle();
}

void mund() {
  
  pushStyle();
    fill( 0 );
  beginShape();
    vertex( -50.0 , 50.0 );
    bezierVertex( -50.0 , 50.0 , 0.0 , 50.0 , 50.0 , 50.0 );
    bezierVertex( 50.0 , 50.0 , 0.0 , 50.0-groar, -50.0 , 50.0 );
  endShape();
  popStyle();
}

void augen() {

  pushStyle();
    stroke( 0 );
  for ( int i = 0; i < grr/9; i++) {
    line( -60, -5, -60-random( grr*augenfaktor ), -5-random( grr*augenfaktor ) );
    line(  60, -5,  60+random( grr*augenfaktor ), -5-random( grr*augenfaktor ) );
  }
  popStyle();
}

