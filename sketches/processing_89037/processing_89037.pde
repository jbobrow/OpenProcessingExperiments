
import netscape.javascript.*;

int x,y;
int shapeSize = 20;
void setup()
{
  size(400,200);
}
void draw()
{
  for(int i =0; i<20; i++)
  {
    for(int j=0;j<10;j++)
    {
      x=(i * shapeSize) + shapeSize/2;
      y=(j * shapeSize) + shapeSize/2;
      ellipse(x,y,20,20);
    }

{
if(mouseX<width/2 && mouseY<height/2)
{
  fill(250,0,0);
}
else if(mouseX>width/2&& mouseY<height/2)
{
  fill(0,0,250);
}
else if(mouseX<width/2 && mouseY>height/2)
{
  fill(0,250,0);
}
else if(mouseX>width/2 && mouseY>height/2)
{
  fill(255,255,0);
}
}
  }
}


