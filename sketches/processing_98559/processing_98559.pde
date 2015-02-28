
void setup()
{
  size( 400, 600 );
  background( 0, 255, 255);
  smooth();
  frameRate(10);
}

void draw()
{
  strokeWeight(3);
  fill( random(255), random(255), random(255), 50 );
  ellipse( mouseX, mouseY, 30, 30 );

}

