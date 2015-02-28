
//copyright Irene Joung 2014
//51-257: hw#5

float x,y,diam,speed; //orange ellipse
float a,b,diam2,speed2; //blue ellipse
color colorA, colorB;

void setup()
{
  size(400,400);
  x=0;
  y=0;
  a=350;
  b=350;
  diam=30;
  diam2=50;
  speed=4;
  speed2=2;
  colorA=color(255,119,64);
  colorB=color(65,80,209);
}

void draw()
{
  prepareWindow();
  moveFigure();
  drawFigure();
}

void prepareWindow()
{
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
}

void drawFigure()
{
  ellipseMode(CORNER);
  figure(x,y,diam);
  figure(a,b,diam2,colorB);
}

//orange ellipse
void figure(float x,float y,float diam)
{
  noStroke();
  fill(colorA);
  ellipse(x,y,diam,diam);
}

//blue ellipse
void figure(float a, float b,float diam2, color colorB)
{
  noStroke();
  fill(colorB);
  ellipse(a,b,diam2,diam2);
}

void moveFigure()
{
  //move orange ellipse
  if ((x < width-diam) && (y == height-height))//top edge
  {
    x += speed;
  }
  else if ((x >= width-diam) && (y <= height-diam))//right edge
  {
    y += speed;
  }
    else if ((x > width-width) && (y >= height-diam))//bottom edge
  {
    x -= speed;
  }
  else if ((x <= diam) && (y > height-height))//left edge
  {
    y -= speed;
  }
  
  //move blue ellipse
  if ((a > width-width) && (b >= height-diam2))//bottom edge
  {
    a -= speed2;
  }
  else if ((a <= width-width) && (b > height-height))//left edge
  {
    b -= speed2;
  }
  else if ((a <= width-diam2) && (b <= height-height))//top edge
  {
    a += speed2;
  }
  else if ((a >= width-diam2) && (b <= height-diam2))//right edge
  {
    b += speed2;
  }
}



