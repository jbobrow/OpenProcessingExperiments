
//Mira A, Animation, CP1, Mods 16/17

//Lefthand ellipse variable
  //x for horizontal position x
  //y for vertical position y
  //ytwo for change in vertical position y
float x = 0;
int y = 0;
int ytwo = 10;

//Righthand ellipse variable
  //w for horizontal position x
  //z for vertical position y 
  //ztwo for change in vertical position y
float w = 300;
int z = 0;
int ztwo = 10;

//Centre ellipse variable
  //vertaxis for diameter along vertical axis
  //horiaxis for diameter along horizonal axis
int vertaxis = 0;
int horiaxis = 0;

//Void
void setup()
{
  size(300,300);
  background(0);
  smooth();
  strokeWeight(1);
  noFill();
}

void draw()
{
  one();
  two();
}

//Lefthand ellipse
void one()
{
  stroke(255);
  ellipse(x,y,20,20);
  stroke(198,140,140);
  ellipse(x,y,27,27);
  x = x + 0.3;
  y = y + ytwo;
  if (y > 280)
  {
   ytwo = ytwo - 2;
  }
  if (y < 20)
  {
   ytwo = ytwo + 2;
  } 
  
  //Centre Ellipse
   if (y > 130)
  {
    if (x > 130)
    {
      stroke(255);
      strokeWeight(2);
      ellipse(150,150,horiaxis,vertaxis);
      horiaxis = horiaxis + 1;
      vertaxis = vertaxis + 1;
    }
  }
  if (horiaxis > 361)
  {
    horiaxis = 361;
    vertaxis = 361;
  }
}

//Righthand ellipse 
void two()
{
  stroke(255);
  ellipse(w,z,20,20);
  stroke(198,140,140);
  ellipse(w,z,27,27);
  w = w - 0.3;
  z = z + ytwo;
  if (z > 280)
  {
   ztwo = ztwo - 2;
  }
  if (z < 20)
  {
   ztwo = ztwo + 2;
  } 
}
