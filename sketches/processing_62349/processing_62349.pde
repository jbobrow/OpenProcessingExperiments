
// Cool thing.
 
void setup()
{
  size( 600, 600 );
  background( random(255), random(255), random(255) );
  smooth();
  frameRate(20);
}

void draw()
{
  fill( random(255), random(255), random(255));
  rect( 0, 0, 600, 600);
  strokeWeight(5);
  fill( random(255), random(255), random(255), random(255) );
  line( pmouseX, pmouseY, mouseX, mouseY );
  ellipse( mouseX, mouseY, random(10, 50), random(10, 50) );
  fill( random(255), random(255), random(255), random(255) );
  line(pmouseY, pmouseX, mouseY, mouseX );
  rect( mouseY, mouseX, random(5, 55), random(5, 55) );

}

