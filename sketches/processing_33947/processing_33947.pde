
int linex1pos = 100;
int liney1pos = 0;
int linex2pos = 100;
int liney2pos = 200;
int linex3pos = 100;
int liney3pos = 400;

void setup()
{
  size(700,400);
  background (255);
  strokeWeight (5);
}
void draw()
{
  background(255);
  line(linex1pos,liney1pos,linex2pos,liney2pos);
  line(linex2pos,liney2pos,linex3pos,liney3pos);
}

void mousePressed()
{
  /*
  if (mouseX == 100)
  linex2pos = mouseX;
  liney2pos = mouseY;
  */
}

void mouseDragged()
{
  /*if(mouseX < 350){*/
  linex2pos = mouseX;
  liney2pos = mouseY;
  
}

void mouseReleased()
{
  linex2pos = 100;
  liney2pos = 200;
}

