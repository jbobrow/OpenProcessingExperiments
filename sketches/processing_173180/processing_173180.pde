
void setup()
{
  size (200, 200);
  smooth();
  background(#F5F6F7);
  strokeWeight (5) ;

}
 
 
void draw()
{
  noStroke();
  background(mouseX, mouseY);
  

  {
    stroke(random (0, 0));
  }
  ellipse (mouseX, mouseY, random (0, 0), random ( 50, 100));
  ellipse (mouseX, mouseY, random (0, 0), random ( 0, 0 ));
  ellipse (mouseX, mouseY, random (0, 0), random ( 0, 0 ));
}

  {
    for (int x=25; x<width; x+=50)
    {
      fill(#FAFF03);
      stroke(#FAFF03);

    }
  }

