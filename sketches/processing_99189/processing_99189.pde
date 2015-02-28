
void setup()
{
  size( 400, 600 );
  background( 255, 255, 255);
  smooth();
  frameRate(25);
}

void draw()
{ 
  noStroke();
  fill(255, 255, 255, 30);
  rect(mouseX,mouseY,width, height );

  strokeWeight(3);
  fill( random(255), random(255), random(255));
  line( pmouseX, pmouseY, mouseX, mouseY );
  if (key == 'c')
  {
    ellipse( mouseX, mouseY, 30, 30 );
  }
  if (key == 'r')
  {
    rectMode(CENTER);
    rect(mouseX, mouseY, 30, 30);
  }
}
