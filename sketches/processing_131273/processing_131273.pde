
// wrap demo 1

//+ increases dx
//- decreases dx

float x,y,dx,wd,ht;
color bgColor, ellipseColor;

void setup()
{
  size(400,400);
  background(0);
  x=0;
  y=height/2;
  wd=39;
  ht=29;
  dx=1;
  
  bgColor=color(0,10);
  ellipseColor=color(255,0,0);
  noStroke();
}

void draw()
{
  prepareWindow();
  moveEllipse();
  drawEllipse();
}

void prepareWindow()
{
fill(bgColor);
rect(0,0,width,height);
}

void moveEllipse()
{
   x += dx;
   //x = x + dx;
  if (x > width)
  {
    dx = -dx;
  }
  else if (x < 0)
  {
    dx = -dx;
  }
}

void drawEllipse()
{
  fill(ellipseColor);
  ellipse(x,y,wd,ht);
  //ellipse(x coord,y coord,radwd,radht);
}

void keyPressed()
{
  if (key == '+')
  {
    dx++;
    //dx = dx + 1;
  }
  else if (key == '-')
  {
    dx--;
  }
}


