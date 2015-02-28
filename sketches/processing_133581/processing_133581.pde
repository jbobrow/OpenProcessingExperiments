
void setup(){
  size( 800, 400 );
  
  background(0);
  stroke( 255 );
  for( int x=0; x<width; x++ ){
    float y = cheapNoise( x * 0.01 ) * height;
    line( x, height, x, y );
  }
}

float cheapNoise( float t ){
  return sin( ( t + sin( t * 1.2342 + sin( t*0.2142 ) ) ) * 4.2334 ) * 0.5 + 0.5;
}
