
boolean mouseIsDown = false;

void setup()
{
  size(320, 480);
  background(255);
}

void draw()
{
  strokeWeight(abs(pmouseX-mouseX)*2
  );

 color c = get (mouseX, mouseY);

  if (c == color(0))
  {
    stroke(255);
  }
  println(c);
  
  if (c == color(255))
  {
    stroke(0);
  }

  if (mouseIsDown == true)
  {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
 

}



void mousePressed()
{
  //background(255);
  mouseIsDown = true;
  println("Mouse was pressed");
}

void mouseReleased()
{
  mouseIsDown = false;
  println("Mouse was released");
}



