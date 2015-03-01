
//Task 1C
//Jim Roberts
// Copyright August 2014  Pittsburgh 15221

// A simple target with no Magic Numbers



float x, y, wd, ht;

void setup( )
{
  size( 400, 400 );
  x = 200;
  y = 200;
  wd = 100;
  ht = 100;
  smooth( );
}

void draw( )
{
  background( 200, 0, 100 ); // color #1
  
  // set the anchor point to the mouse location
  x = mouseX;
  y = mouseY;
  
  // alter the size of the target in some manner
  wd = mouseX - mouseY;
  ht = mouseY * .01*mouseX;
  // black rectangle  2D Primitive #1
  noStroke( );
  fill( 0 ); // color #2
  rect( x-.5*wd, y-.5*ht, wd, ht );
  
  // yellow ellipse  2D Primitive #2
  fill( 200, 200, 0 ); // color #3
  ellipse( x, y, wd, .2*ht );
  
  // cyan ellipse
  fill( 0, 200, 200 ); // color #3
  ellipse( x, y, .2*wd, ht);
  
  // red triangle  2D Primitive #2
  fill( 255, 0, 0 ); // color #5
  triangle( x, y-.1*ht, x-.1*wd, y+.05*ht, x+.1*wd, y+.05*ht );
  
  // white lines  2D Primitive #4
  stroke( 255 ); // color #6
  strokeWeight( 3 );
  line( x-.5*wd, y-.5*ht, x-.1*wd, y-.1*ht );
  line( x+.5*wd, y+.5*ht, x+.1*wd, y+.1*ht );
}



