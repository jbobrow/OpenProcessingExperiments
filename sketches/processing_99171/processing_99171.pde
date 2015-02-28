
void setup()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
  frameRate(5);
}
void draw()
{
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);
  noStroke();
  fill(150, 150, 150);
  ellipse(0, 0, 250, 250);
  fill(255, 255, 0, 60);
  ellipse(250, 300, 300, 300);

  fill(255, 255, 255);
  ellipse(random(width), random(height), 10, 10);

  ellipse(frameCount*5, 400-frameCount*5, 10, 10);
}
