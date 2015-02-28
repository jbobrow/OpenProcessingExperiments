
void setup()
{
  size(400, 500);
  background(255);
  smooth();
}
void mouseDragged()
 
{
  fill(random(255), random(255), random(255));
  ellipse(random(400), random(600), 20, 50);
}
void draw()
{
  fill(random(255), random(255), random(255));
  rect(random(400), random(600), 20, 20);
  if (key=='s')
  {
    stop();
  }
}
void keyPressed()
{
  fill(random(255), random(255), random(255));
  triangle(random(450), random(650), random(100), random(100), random(650), random(100));
}


