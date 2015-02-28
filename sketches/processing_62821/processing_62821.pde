
void setup()
{
  size( 400, 600 );
  background( 0);
  smooth();
  frameRate(30);
}


void draw()



{

  frameRate(30);
  stroke( 255);
  strokeWeight(1);
  line( 0, 0, mouseX, mouseY );
  fill( random(255), random(255), random(255), 70);
  ellipse( mouseX, mouseY, 120, 50 );
  if (mousePressed) {
    fill( random(0), random(0), random(0), 10);
  }
}
