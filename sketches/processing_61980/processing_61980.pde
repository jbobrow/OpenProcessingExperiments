
void setup()
{
  size(800,800);
  background(32,39,98);
  smooth();
  frameRate(18);
}
void draw()
{
  stroke(random(32),random(39),random(98));
  fill(random(234),random(33),random(208),100);
  ellipse(mouseX,mouseY,random(255),random(255));
}

