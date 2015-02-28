
// Day 3 Demo 2
// Based on work originally demostrated in class by John Gruen
//   Thanks, John
// Easing
// Instead of just drawing a figure at the mouse's location we move it part way -
//  a process called easing.

float x, y, dia;
float xdist, ydist;
float easingCoef;
color bgc, ellipseColor;
void setup()
{
  size( 600, 600 );
  easingCoef = .05;
  bgc = color( 0, 0, 255, 5 );
  ellipseColor = color( 200, 200, 0 );
  noStroke( );
  frameRate( 60 );
  dia = 20;
}

void draw( )
{
  fill( bgc);
  rect( 0, 0, width, height );
  
  xdist = mouseX - x;
  ydist = mouseY - y;
  
  x = x + ( xdist * easingCoef );
  y = y + ( ydist * easingCoef );
  
 
 
  fill( ellipseColor );
  ellipse( x, y, dia, dia );
  
}


