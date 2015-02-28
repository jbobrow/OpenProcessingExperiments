

void setup()
{
  size( 1200, 600 );
  background( 255, 255, 255 );
  smooth(); 
  frameRate(999999999);
}


void draw()
{
  fill( 255, 255, 255, 15 );
  rect( 0, 0, width, height );
  noStroke();
  if ( key == 'r' )
  {
    fill( 255, 0, 0 );
  }
  if ( key == 'b' )
  {
    fill( 0, 0, 255 );
  }
  if ( key == 'g' )
  {
    fill( 10, 157, 52 );
  }
  ellipse( mouseX, mouseY, 50, 50 );
}

void mousePressed()
{
  fill( random(0), random(255), random(0) );
}

void keyPressed()
{
  background( 255, 255, 255 );
}


