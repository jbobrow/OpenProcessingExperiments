
void setup(){
  size( 465, 465 );
  background( 0 );
  stroke( 50, 150 );
  colorMode( HSB, 1 );
}

void draw(){
  if( mousePressed ){
    background( 0 );
  }
  
  
  float d = dist( pmouseX, pmouseY, mouseX, mouseY );
  if( d < 3 ){
    return;
  }
  
  float x1 = ( pmouseX + mouseX ) / 2;
  float y1 = ( pmouseY + mouseY ) / 2;
  
  d /= 2;
  
  for( int i = 0 ; i < int(d); i++ ){
    float xx = x1 + random( -d, d );
    float yy = y1 + random( -d, d );
    fill( random(0.95, 1 ), random( 0.5, 1 ), random(0.5, 1 ) );
    float s = random( 1, d/3 ) * 2;
    
    ellipse( xx, yy, s, s );
  }
}
