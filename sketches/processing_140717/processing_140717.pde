
//practice exam 2
//version 0 question 1

color c1, c2, c3;
void setup( )
{
  size( 400, 400 );
  c1 = color( 200, 0, 0 );  // red
  c2 = color( 0, 200, 0 );  // green
  c3 = color( 0, 0, 200 );  // blue
  strokeWeight( 3 );
  ellipseMode( CORNER );
  rectMode(CORNER);
}
void draw( ) {
   background( 200 );
   design( 100, 100,  90, c1, c2 );  // smaller design
   design( 180, 200, 165, c1, c3 );  // larger design
   noLoop( );
}

void design(float x, float y, float dim, color c1, color c2)
{
  fill(c1);
  rect(x, y, dim, dim);
  fill(c2);
  ellipse(x,y,dim/2,dim/2);
  stroke(0);
  line(x,y+dim,x+dim,y);
}



