
void setup()
{
  size(400, 300);
  background(#eca9ed);
}

void draw()
{
 smooth();
 fill(#abdeed);
 ellipse(100, 100, 100, 100);
 filter(BLUR, 9);
}

void mouseDragged()
{
  {
    stroke(#f9f9dd);
    line(mouseX, mouseY, 20, 20);
  }
  smooth();
  fill(#abdeed);
  ellipse(300, 300, 300, 300);
  filter(POSTERIZE, 15);
}

void mouseReleased()
{
  background(#eca9ed);
}



                
                
