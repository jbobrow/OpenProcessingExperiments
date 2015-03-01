
Line lines[] = new Line[20];
int space = 30;

void setup()
{
  background(200);
  frameRate(15);
  size(600,600);
  for (int i = 0; i < lines.length; i++)
  {
    lines[i] = new Line(space);
    space = space + height/22;
  }
}

void draw()
{
  background(200);
  for (int i = 0; i < lines.length; i++)
  {
    lines[i].display();
  }
  
  for (int k = 0; k < lines.length; k++)
  {
    int next = k+1;
    if (next >2)
{ next = 0;
}
if (lines[k].check(lines[next]))
{
  lines[k].same = 1;
  lines[next].same = 1;
  }
}

for (int j = 0; j < lines.length; j++)
{
  if (lines[j].same !=1)
  {
    lines[j].reset();
  }
}
  }
class Line
{
  int x1 = int(3*random(1,100));
  int y;
  int x2 = width-x1;
  int same = 0;
  
  Line(int tempY)
  {
    y = tempY;
  }
  
  void display()
  {
    noFill();
  strokeWeight(8);
  line(x1,y,x2,y);
  }
  
  void reset()
  {
    x1 = int(3*random(1,100));
    x2 = width - x1;
  }
  
  boolean check(Line nextup)
  {
    if(x1 == nextup.x1)
    {return true;
    }
    else {
      return false;
    }
  }
}



