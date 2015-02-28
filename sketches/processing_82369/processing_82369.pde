
color c1, c2;
void setup( )
{
  size( 400, 400 );
  c1 = color( 200, 0, 0 );  // red
  c2 = color( 0, 0, 200 );  // blue
  strokeWeight( 3 );
}
void draw( )
{
   fill( c2 );
   design( 100, c1 ); // 100 pixel separation & red lines
   design( 80, c2 );  //  80 pixel separation & blue lines
   stroke(0);
   triangle( 0, 0, width, height, 0, height);
   noLoop( );
}

void design(int pos, color co1) {
  
  for(int i = pos; i < 400; i += pos) {
    
    stroke(co1);
    line(i,0,i, height);
    line(0,i,width,i);    
    }
    
  }
  

