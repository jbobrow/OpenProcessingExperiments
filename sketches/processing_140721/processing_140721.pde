
// ICE#15
// copyright eunkic

color c1, c2, c3;

void setup( )
{
size( 400, 400 );
c1 = color( 200, 0, 0 ); // red
c2 = color( 0, 200, 0 ); // green
c3 = color( 0, 0, 200 ); // blue
strokeWeight( 3 );
ellipseMode( CORNER );
}

void draw( )
{
background( 200 );
design( 100, 100, 90, c1, c2 ); // smaller design
design( 180, 200, 165, c1, c3 ); // larger design
noLoop( );
}

void design( float x, float y, float s, color r, color c)
{
  fill (c1);
  rect (x, y, s, s);
  line (x, y+s, x+s, y);
  fill (c);
  ellipse (x, y, s/2, s/2);
}



