
// Homework #4 48-257 Programming in the Arts with Processing
// Will Crownover wlc@andrew.cmu.edu
// Copyright January 2012

//CONTROLS
//Hold down either the left or right mouse button to gradually change the size of the circles  
//Up and Down arrows change the circle into an ellipse

float x1, y, x2;

void setup( )
{
  size( 800, 400 );
  background( 255 );
  x1 = 0;
  y = 0;
  x2 = 0;
}

void draw( )
{
  if ( mousePressed && ( mouseButton == LEFT) )
  {
    stroke( 0, mouseX/2, mouseY/2 + 80 );
    strokeWeight( abs( y ) );
    fill( mouseX/2 + 80, mouseY/2, 0, 20 );
    ellipse( mouseX, mouseY, abs ( x2 ), abs( x1 ) );
    x1 = x1 + 3;
    x2 = x2 + 3;
    y = y + .4;
  }
  if ( mousePressed && ( mouseButton == RIGHT) )
  {
    stroke( 0, mouseX/2, mouseY/2 + 80 );
    strokeWeight( abs( y ) );
    fill( mouseX/2 + 80, mouseY/2, 0, 20 );
    ellipse( mouseX, mouseY, abs ( x2 ), abs( x1 ) );
    x1 = x1 - 3;
    x2 = x2 - 3;
    y = y - .4;
  }
}

void keyPressed( )
{
  if( keyCode == UP )
  {
    x2 = x2 - 20;
  }
  
  if( keyCode == DOWN )
  {
    x2 = x2 + 20;
  }
}                                                                   
