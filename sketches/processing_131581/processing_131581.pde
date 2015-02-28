
//copyright Daniel Kim dsk1

float x, y, diam, speed;
float a, b, diam1, speed1;
color col1, col2;

void setup()
{
  size(400, 400);
  
  x = 50;
  y = 50;
  diam = 54;//declare the values otherwise it is 0.
  speed = 10;
  
  a = 350;
  b = 350;
  diam1 = 50;
  speed1 = 5;
  
  col1 = color(200, 200, 0);
  col2 = color(0, 200, 200);
}

void draw()
{
  prepareWindow();
  //signature is figure(float,float,float);[
  drawFigure();
  moveFigure();
  //rectangle(x,y,diam);//arguments
  //circle(x, y, diam);
  //noLoop();
}

void prepareWindow()
{
  fill(0, 100);
  noStroke();
  rect(0, 0, width, height);
  //transparent rectangle
}

void drawFigure()
{
  ellipseMode(CENTER);
  figure(x, y, diam, col1);
  figure(a, b, diam1, col2);
}


//void figure(float x, float y, float diam)  //signature figure(float, float, float);
//{
//  stroke(0);
//  fill(col1);
//  ellipseMode(CORNER);
//  ellipse(x, y, diam, diam);
//}

void figure(float a, float b, float diam1, color col)  //signature figure(float, float, ,float, float);
{
  stroke(0);
  fill(col);
  ellipseMode(CORNER);
  ellipse(a, b, diam1, diam1);
}



void moveFigure()
{

  //1
  if ((x < width - diam) && (y == height - height))
  {
    x += speed;
  }
  else if ((x >= width - diam) && (y <= height - diam))
  {
    y += speed;
  }
  else if ((x > width - width) && (y >= height - diam))
  {
    x -= speed;
  }
  else if ((x <= diam) && (y >= height - height))
  {
    y -= speed;
  }
  //2
  if ((a > width - width) && (b >= height - diam1))
  {
    a -= speed1;
  }
  else if ((a <= width - width) && (b >height - height))
  {
    b -= speed1;
  }
  else if ((a <= width - diam1) && (b >= height - height))
  {
    a += speed1;
  }
  else if ((a >= width - diam1) && (b <= height - diam1))
  {
    b += speed1;
  }
}

