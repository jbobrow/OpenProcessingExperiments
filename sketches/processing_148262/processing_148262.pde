
void setup ()
{
  size(600, 400);
  background (255,255,255,0);
  smooth();
  frameRate(random (60));
}
void draw ()
{
  strokeWeight(random(7));
  stroke(250,100,30);
  fill(random(255), (random(255)), 255, 70) ;

  rect(random(width), random(height), 50,40);
}
