
void setup() // setup at the beginning one time
{
  size (500,500);
}
void draw()//loop
{
  fill(255,0,0)
  ellipse (mouseX,mouseY,20,20);

  println(mouseY);
}
