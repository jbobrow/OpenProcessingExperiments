
// homework 5
// copyright Josh Kim gyeongyk
////code is partially adapted from Christopher Henley

float x, y, diam, speedX, speedY;
float a, b, diam2, speedA, speedB;
color ellipse1, ellipse2;

void setup()
{
  size(400, 400);
  
  x = 0;
  y = 0;
  diam = 40;
  speedX = 30;
  speedY = 8;
  ellipse1 = color(246, 252, 179);
  
  a = 380;
  b = 380;
  diam2 = 20;
  speedA = 10;
  speedB = 5;
  ellipse2 = color(252, 201, 179);
}

void draw()
{
  prepWindow();
  moveFigures();
  drawFigures();
}

void prepWindow()
{
  fill(111, 90, 133, 40);
  noStroke();
  rect(0, 0, width, height);
}

void drawFigures()
{
  ellipseMode(CORNER);
  figure(x, y, diam);
  figure(a, b, diam2, ellipse2);
}

//1st ellipse
void figure(float x, float y, float diam)
{
  noStroke();
  fill(ellipse1);
  ellipse(x, y, diam, diam);
}

//2nd ellipse
void figure(float a, float b, float diam2, color ellipse2)
{
  noStroke();
  fill(ellipse2);
  ellipse(a, b, diam2, diam2);
}

void moveFigures()
{
  if ((x < width - diam) && (y == height - height)) {
    x += speedX;
  }
  else if ((x > width - width) && (y >= height - diam)) {
    x -= speedX;
  }
  else if ((x >= width - diam) && (y <= height - diam)) {
    y += speedY;
  }
  else if ((x <= diam) && (y > height - height)) {
    y -= speedY;
  }
 
    
  //ellipse 2
  if ((a < width - diam2) && (b == height - height)) {
    a += speedA;
  }
  else if ((a > width - width) && (b >= height - diam2)) {
    a -= speedA;
  }
   else if ((a >= width - diam2) && (b <= height - diam2)) {
    b += speedB;
  }
  else if ((a <= diam2) && (b > height - height)) {
    b -= speedB;
  }
}


