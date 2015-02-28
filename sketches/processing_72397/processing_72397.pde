
//Di Tang,colorfulBalls,CP1 14-15,
int circle1=100;
int circle2=150;
int circle3=80;
float x = 89;
float y = 215;
float xspeed = 1.9;
float yspeed = 5.1;
float a = 30;
float b = 420;
float aspeed = 2.3;
float bspeed = .8;
float c = 101;
float d = 405;
float cspeed = 3.7;
float dspeed = 2.5;
float e = 215;
float f = 5;
float espeed = 1.3;
float fspeed = 4.5;
float g = 350;
float h = 3;
float gspeed = 5.5;
float hspeed = .8;
float i = 289;
float j = 270;
float ispeed = 2.7;
float jspeed = 1.8;
float k = 121;
float l = 312;
float kspeed = 4.2;
float lspeed = 1.5;
float m = 181;
float n = 103;
float mspeed = 2.1;
float nspeed = 3.2;

int w = 60;

int r = 20;

void setup()
{

  size(500,500);
  noStroke();
  smooth();
}
void draw()
{
  frameRate(w);
  if (mousePressed && (mouseButton == LEFT))
  {
    r = r + 1;
  }
  if (mousePressed && (mouseButton == RIGHT))
  {
    r = r - 1;
  }
  
  background(0,170,200);
  
  x = x + xspeed;
  y = y + yspeed;
  a = a + aspeed;
  b = b + bspeed;
  c = c + cspeed;
  d = d + dspeed;
  e = e + espeed;
  f = f + fspeed;
  g = g + gspeed;
  h = h + hspeed;
  i = i + ispeed;
  j = j + jspeed;
  k = k + kspeed;
  l = l + lspeed;
  m = m + mspeed;
  n = n + nspeed;
  

  if ((x > width) || (x < 0))
  {  
  xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0))
  {
  yspeed = yspeed * -1;
  }
  if ((a > width) || (a < 0))
  {  
  aspeed = aspeed * -1;
  }
  if ((b > height) || (b < 0))
  {
  bspeed = bspeed * -1;
  }
  if ((c > width) || (c < 0))
  {  
  cspeed = cspeed * -1;
  }
  if ((d > height) || (d < 0))
  {
  dspeed = dspeed * -1;
  }
  if ((e > width) || (e < 0))
  {  
  espeed = espeed * -1;
  }
  if ((f > height) || (f < 0))
  {
  fspeed = fspeed * -1;
  }
  if ((g > width) || (g < 0))
  {  
  gspeed = gspeed * -1;
  }
  if ((h > height) || (h < 0))
  {
  hspeed = hspeed * -1;
  }
  if ((i > width) || (i < 0))
  {  
  ispeed = ispeed * -1;
  }
  if ((j > height) || (j < 0))
  {
  jspeed = jspeed * -1;
  }
  if ((k > width) || (k < 0))
  {  
  kspeed = kspeed * -1;
  }
  if ((l > height) || (l < 0))
  {
  lspeed = lspeed * -1;
  }
  if ((m > width) || (m < 0))
  {  
  mspeed = mspeed * -1;
  }
  if ((n > height) || (n < 0))
  {
  nspeed = nspeed * -1;
  }
  
  {
   
    
  noStroke();
  fill(circle1,circle2,circle3);
  circle1 = circle1 +int(random(-2,2));
  circle2 = circle2 +int(random(-5,5));
  circle3 = circle3 +int(random(-10,10));
  ellipse(x,y,r,r);
  ellipse(a,b,r,r);
  ellipse(c,d,r,r);
  ellipse(e,f,r,r);
  ellipse(g,h,r,r);
  ellipse(i,j,r,r);
  ellipse(k,l,r,r);
  ellipse(m,n,r,r);
  }
  
}

void keyPressed()
{
 if (key == 'c')
 
 { 
   xspeed = xspeed * -1;
   yspeed = yspeed * -1;
   aspeed = aspeed * -1;
   bspeed = bspeed * -1;
   cspeed = cspeed * -1;
   dspeed = dspeed * -1;
   espeed = espeed * -1;
   fspeed = fspeed * -1;
   gspeed = gspeed * -1;
   hspeed = hspeed * -1;
   ispeed = ispeed * -1;
   jspeed = jspeed * -1;
   kspeed = kspeed * -1;
   lspeed = lspeed * -1;
   mspeed = mspeed * -1;
   nspeed = nspeed * -1;
 }
 if (key == 'z')
 {
   w = w + 10;
 }
  if (key == 'x')
 {
   w = w - 10;
 }
}
