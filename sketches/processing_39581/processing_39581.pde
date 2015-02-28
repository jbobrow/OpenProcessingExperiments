
float x, y, b, c, d, e, f, g, h, i, j, k, l, m, n, dia;
color col, col2;

void setup()
{
  size(400, 400);
  smooth();
  col = color(random(256), random(256), random(256));
  col2 = color(245, 18, 250);
  x = 0;
  y = 20;
  dia = 20;
  b = 30;
  c = 50;
  d = 80;
  e = 110;
  f = 140;
  g = 170;
  h = 200;
  i = 230;
  j = 260;
  k = 290;
  l = 320;
  m = 350;
  n = 380;
  frameRate(10);
  background(0);
}

void draw()
{
  drawCircles(x, y, dia, col);
  drawCircles(x, c, dia, col);
  drawCircles(x, d, dia, col);
  drawCircles(x, e, dia, col);
  drawCircles(x, f, dia, col);
  drawCircles(x, g, dia, col);
  drawCircles(x, h, dia, col);
  drawCircles(x, i, dia, col);
  drawCircles(x, j, dia, col);
  drawCircles(x, k, dia, col);
  drawCircles(x, l, dia, col);
  drawCircles(x, m, dia, col);
  drawCircles(x, n, dia, col);
}

void drawCircles(float x, float y, float dia, color col)
{
  noStroke();
  fill(random(256), random(256), random(256));
  while (x <= width - b)
  {
   x = x + 25;
  ellipse(x, y, dia, dia);
  fill(random(256), random(256), random(256)); 
  }
  //saveFrame("discobubbles.jpg");
}
 
 void mouseClicked()
 {
   background(random(256), random(256), random(256));
   drawCircles(x,y, dia, col2);
 }


