
void setup()
{
  size(400, 600);
  background(100, 200, 255);
  smooth();
  frameRate(30);
}
void draw()
{
  fill(100, 200, 255, 50);
  rect(0, 0, width, height);
  strokeWeight(2);
  for (int i=1;i<40;i++)
  {
    fill(random(255), random(255), random(255), 75);
    ellipse(random(400), random(600), random(30), random(20));
  }
  fill(0,0,0);
  textSize(20);
  text("Summer Break!", mouseX, mouseY);
}
