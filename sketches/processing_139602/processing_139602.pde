
void setup()
{
  size(800,400);
  background(5,45,182);
}
void draw ()
{
  background(200);
  fill(3,184,180);
  rect(100,150,mouseX,mouseY);
  fill(46,181,6);
  ellipse(100,150,mouseX,mouseY);
}
