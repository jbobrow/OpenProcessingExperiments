
void setup()
{
  size(400, 600);
  background(random(255), random(255), random(255));
  smooth();
  frameRate(10);

}

void draw()
{
  fill(random(255),random(255),random(255));
  rect( 0, 0, mouseX, mouseY );

  fill(19, 234, 240);
  ellipse( mouseX, mouseY, random(255), random(255) );
  

}

