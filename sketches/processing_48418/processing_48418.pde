
void setup()
{
  size (400,600);
  background (0,0,0);
  smooth();
  textAlign (CENTER);
}

void draw ()
{
  fill (0,0,0, 75);
  rect (0, 0, width, height);
  strokeWeight (5);
  stroke (255,255,255);
  point (random(225*4), random(225*4));
  textSize ( 36 );
  fill (random(255), random(255), random(255));
  text( "Merry Christmas", mouseX, mouseY );
}


