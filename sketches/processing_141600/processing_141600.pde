
float x, y, w, h;
color col;

void setup()
{
  size(400, 400);
  background(0);
  frameRate(30);
}

void draw()
{
  x= mouseX;
  y= mouseY;
  w= 10;
  h= 10;
  col= color(mouseX, mouseY, 150);

  noFill();
  stroke(col);
}
void mouseMoved()
{
  { 
    rect(x, y, w, h);
  }
}
void mouseDragged()
{
  { 
    rect(x, y, w+50, h+50);
  }
}
void keyPressed()
{
  if (key=='a')
  {
    background(255);
  }
}
void mouseWheel(MouseEvent event)
{
  background(0);
}

