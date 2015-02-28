
void setup()
{
  size(700, 700);
  stroke(105,random(100, 200),54,45);
  background(0);
  noFill();
  smooth();
}
void draw()
{
  ellipse(350,350,mouseX,mouseY);
}


