
void setup()
{
  size( 400, 600 );
  background( 255, 255, 255);
  smooth();
  frameRate(10);
}

void draw()
{
  strokeWeight(3);
  fill( random(255), random(255), random(255), 50 );
  line( pmouseX, pmouseY, mouseX, mouseY );
  ellipse( mouseX, mouseY, 30, 30 );

}
