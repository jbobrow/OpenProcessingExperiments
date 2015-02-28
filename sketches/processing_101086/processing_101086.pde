
int rx, ry;
int cx, cy;
float r,g,b,a;

void setup()
{
  size (400,400);
  background(233,73,14);
  rx = 390;
  ry = 1;
  cx = 1;
  cy = 1;
 frameRate(10);
}
void draw()
{
  rect(rx,ry,50,50);
  rx = rx - 10;
  ry = ry + 10;
  ellipse(cx,cy,50,50);
  cx = cx + 10;
  cy = cy + 10;
  if ( cx >= width && cy >= height)
  {
    background(233,73,14);
    cx = 0;
    cy= 0;
    rx = 390;
    ry = 1;
  }
 
  r = random(255); 
  g = random(255);
  b =  random(255);
  a = random(255);
  fill(r,g,b,a);
}
