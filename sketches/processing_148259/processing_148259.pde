
void setup ()
{
  size(400, 600);
  background (255,255,255,0);
  smooth();
  frameRate(random (60));
}
void draw ()
{
  strokeWeight(random(7));
  stroke(255,255,255);
  fill(random(255), (random(255)), 255, 70) ;
  ellipse(mouseX, mouseY, mouseX/2, mouseY/2);
  rect(random(width), random(height), 50,40);
}
