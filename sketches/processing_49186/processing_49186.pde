
void setup ()
{
  size(400, 600);
  background (random (200),random(200), random (200));
  smooth();
  frameRate(random (60));
}
void draw ()
{
  strokeWeight(random(7));
  stroke(random(255),random(255),random(255));
  fill(random(255), random (200), random (200), random(200)) ;
  ellipse(mouseX, mouseY, mouseX/2, mouseY/2);
  
}

