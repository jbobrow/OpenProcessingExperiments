
void setup()
{
  size(400, 600);
  background(252, 198, 255);
  smooth();
  strokeWeight (1);
  frameRate(20);
}
 
 
 
void draw()
{ 
}
 
void mouseDragged()
 
{
  fill(random(230), random(30), random(175), random(100));
  rect (mouseX, mouseY, random(75), random(75));
  rectMode(CENTER);
}
