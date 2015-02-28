
class arrow {
  
  float x, y; // coordinate position
  float a; // direction angle
  
  arrow( float x0, float y0, float a0 ) {
    x = x0;
    y = y0;
    a = a0;
  }
  
  void render( float r ) {
    strokeWeight(r/4);
    line( x+r*cos(a), y+r*sin(a), x-r*cos(a), y-r*sin(a) );
    line( x+r*cos(a), y+r*sin(a), x+r*cos(a)-r*cos(a-QUARTER_PI), y+r*sin(a)-r*sin(a-QUARTER_PI) );
    line( x+r*cos(a), y+r*sin(a), x+r*cos(a)-r*cos(a+QUARTER_PI), y+r*sin(a)-r*sin(a+QUARTER_PI) );
  }
  
}

