

void setup()
{
  size(1000, 600);
  background(10, 242, 27);
  smooth();
  frameRate(10);
}



void draw()
{
  fill (random(255), random(255), random(255) );
  textSize(40);
  textAlign(CENTER);
  text( "I LOVE COMPUTER APPS", mouseX, mouseY );
}
void mouseDragged()

{
  fill(random(255), random(255), random(255), random(190));
  ellipse (mouseX, mouseY, random(255), random(255));
  ellipseMode(CENTER);
}


