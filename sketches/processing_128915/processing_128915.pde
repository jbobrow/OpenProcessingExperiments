
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int corners;
int intangletotal;
int intangle;
int shapeHeight;
int temppos;
int temppoint;
int tempdist;

void setup()
{
  size(1000,1000);
  corners = 3;
  shapeHeight = (3*height)/5;
}

void draw()
{
  startShape();
  while (mousePressed == false)
  {
    temppos = xpos.get(int(random(-1,xpos.size())));
    temppoint = xpos.get(int(random(-1,xpos.size())));
    tempdist = (abs(temppos - temppoint)/2)
    //(((abs(A-B))/2)+-A)
    
  }
}

void clickCorners()
{
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      corners += 1;
    }
    else if (mouseButton == RIGHT)
    {
      if (corners > 3)
      {
         corners -= 1;
      }
    }
  }
}

void startShape()
{
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  intangletotal = 180 * (corners - 2);
  intangle = intangletotal/corners;
  xpos.add(width/2);
  ypos.add(height/5);
  //add something here that defines shape based on corners
  xpos.add(xpos.get(0) + ((shapeHeight) / sqrt(3)));
  xpos.add(xpos.get(0) - ((shapeHeight) / sqrt(3)));
  ypos.add(ypos.get(0) + shapeHeight);
  ypos.add(ypos.get(0) + shapeHeight);
}
