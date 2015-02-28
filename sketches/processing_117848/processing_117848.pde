
void setup() {
  size( 700, 500 );
  background( #000000 ); 
  //frameRate( 111100 );
}
float xoff = 0.0, yoff = 10000.0;
void draw() {
  background( #000000 );
  translate( width/2, height );
  int l;
  float a;
  
  l = (int) (noise( yoff ) * height/1.7);
  a = noise( xoff ) * 45;
  
  //l = (int) map( mouseX, 0, width, 0, 140 );
  //a = map( mouseY, 0, height, 0, 90 );
  
  //a = 45;
  //l = height/2.7;
  
  tree( l, -a );
  tree( l, a );
  
  //rotate( PI );
  
  //tree( l, -a );
  //tree( l, a );
  
  xoff += 0.01;
  yoff += 0.01;
}
void tree( int bLen, float ang ) {
  pushMatrix();
    if( bLen > 2 ) {
      rotate( radians( ang ) );
      stroke( #FFFFFF );
      line( 0, 0, 0, -bLen );
      pushMatrix();
        translate( 0, -bLen );
        tree( bLen /= 1.6, ang );
        tree( bLen, -ang );
      popMatrix();
    }
    popMatrix();
}
