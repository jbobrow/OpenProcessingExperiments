
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
}
void mouseDragged()

{
  fill(random(255), random(255), random(255));
  ellipse(random(400), random(600), 50, 50);
}
void draw()
{
  fill(random(255), random(255), random(255));
  rect(random(400), random(600), 50, 50);
  if (key=='s')
  {
    stop();
  }
} 
void keyPressed()
{
  fill(random(255), random(255), random(255));
  triangle(random(400), random(600), random(50), random(50), random(600), random(50));
}



