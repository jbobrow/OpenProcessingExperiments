
int[] p = new int[8];
for ( int i=0; i<p.length; i+=1 ) {
  p[i] = floor( random( 300 ) );
}
colorMode( HSB, 360, 100, 100 );
Color bg = color( 360, 0, 100 );
Color fg = color( 0, 100, 100 );

void setup() {  //setup function called initially, only once
  size( 400, 400 );
  strokeWeight( 20 );
  background( bg );
  noFill();
}

void draw() {  //draw function loops 
  background( bg );
  stroke( fg );
  fg = color( hue( fg ) + 1 % 360, 100, 100 );
  bezier( p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7] );
  for ( int i=0; i<p.length; i+=1 ) {
    p[i] += floor( random( 11 ) ) - 5;
    p[i] = min( max( 0, p[i] ), 400 );
  }
}
