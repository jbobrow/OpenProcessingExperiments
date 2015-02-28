
void setup()
{
  size(720,480);
  background(0,0,0);
  println("begin");
}
void draw()
{
  for(int i=0; i<10; i++)
  {
    for(int j =i++; j <10; j++)
    {
      fill(155, mouseX, mouseY,5);
      noStroke();
      rect(mouseX,mouseY,100,2);
    }
  }
}


