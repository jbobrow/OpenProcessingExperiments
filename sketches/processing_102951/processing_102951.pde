
float t1x, t1y, t2x, t2y;
float d1x, d1y, d2x, d2y;
float dim1, dim2;//radii
PGraphics bg;

void setup()
{
  size(400, 400);
  t1x = t1y = 0.0;
  t2x = 100;
  t2y = 100;
  d1x = 3;
  d1y = 2;
  d2x = 2;
  d2y = 3;
  dim1 = dim2 = 50.0;
  
  //bg image
  bg = createGraphics(300, 400);
  bg.beginDraw();
  bg.fill(255, 255, 255);
  bg.rect(0, 0, width, height);
  bg.stroke(0, 0, 255);
  bg.strokeWeight(5);
  bg.line(50, 200, 100, 100);
  bg.line(100, 100, 200, 300);
  bg.line(200, 300, 250, 200);
  bg.line(250, 200, 200, 100);
  bg.line(200, 100, 100, 300);
  bg.line(100, 300, 50, 200);
  bg.endDraw();
}

void draw()
{
  //bg
  image(bg, -width*.2, -height*.2, 1.4*width, 1.4*height);
  //objects
  drawObj1(t1x, t1y, dim1);
  drawObj2(t2x, t2y, dim2);
  moveObj1();
  moveObj2();
}

void drawObj1(float x, float y, float dim)
{
  fill(0, 100, 0);
  stroke(0, 0, 0);
  strokeWeight(dim * .05);
  ellipse(x, y, dim*2, dim*2);
}

void drawObj2(float x, float y, float dim)
{
  fill(0, 0, 100);
  stroke(0, 0, 0);
  strokeWeight(dim * .05);
  ellipse(x, y, dim*2, dim*2);
}

void moveObj1()
{
  t1x += d1x;
  t1y += d1y;
  //wrap around
  if( t1x + dim1 < 0 ) t1x += width + 2*dim1;
  if( t1y + dim1 < 0 ) t1y += height + 2*dim1;
  if( t1x - dim1 > width ) t1x -= width + 2*dim1;
  if( t1y - dim1 > height ) t1y -= height + 2*dim1;
}

void moveObj2()
{
  t2x += d2x;
  t2y += d2y;
  //reflect
  if( (t2x + dim2 >= width) || (t2x - dim2 <= 0) ) d2x *= -1;
  if( (t2y + dim2 >= height) || (t2y - dim2 <= 0) ) d2y *= -1;
}
