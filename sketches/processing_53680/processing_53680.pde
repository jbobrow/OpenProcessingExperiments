
// Homework #8 48-257 Programming in the Arts with Processing
// Will Crownover wlc@andrew.cmu.edu
// Copyright February 2012

//Instructions
//Key press, define eyelids.  Mouse pressed, define Iris.

color c;

void setup()
{
  size( 400, 400 );
  stroke( random( 255 ), random( 255 ), random ( 255 ) );
  c = 0;
}

void draw()
{
  c += 1;
  stroke( c%255, c%150, c%200 );
  whileBackground();
}

void whileBackground()
{
  
  float x = 0;
  float l = 1;
  while( x < 2*width )
  {
    strokeWeight( l );
    line( x, 0, 0, x );
    x += 10;
    l += .05;
  }
}

void keyPressed()
{
  stroke( random( 255 ), random( 255 ), random ( 255 ) );
  float x = 0;
  float y = height;
  float l = 1;
  while( x < width*2.0 )
  {
    strokeWeight( l );
    line( x, 0  , y, x );
    line( 0, x, x, y );
    x += 9;
    y += .01;
    l += .01;
  }
}

void mousePressed()
{
  float x = 0;
  float l = 1;
  float c = 1;
  while( x < width*.66 )
  {
    stroke( 200, random( 255), 200 );
    noFill();
    strokeWeight( l );
    ellipse( width/2.0, height/2.0, x, x );
    x += 10;
    l += .05;
    c += 5;
  }
}
