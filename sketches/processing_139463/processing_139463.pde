
int a;
int b;
int x;
int z;
int q;
int w;

void setup()
{
  background(0);
  size(800, 500);
  a = width/2;
  b = width/2;
  x = height/2;
  z = height/2;
  q = 0;
  w = 0;

  ellipseMode(CENTER);
  rectMode(CENTER);
}
void draw()
{
  noStroke();
  ellipse(q, w, 10, 10);
  ellipse(a, x, 10, 10);
  smooth();
  
  x= x+5;
  z= z-5;
  a= a+5;
  b= b-5;
  q= q+5;
  w= w+5;
  if (q > width/2)
  {
    fill(random(255), random(255), random(255));
    q= 0;
  }
  if (w > height/2)
  {
    w= 0;
  }
  if (a > width)
  {

    a= width/2;
  }
  if (b  < 0)
  {
    b= width/2;
  }
  if (x > height)
  {
    x= height/2;
  }
  if (z < 0)
  {
    z = height/2;
  }
  ellipse(width/2, height/2, random(150), random(150));
  ellipse(a, height/2, 20, 20);
  ellipse(b, height/2, 20, 20);
  ellipse(width/2, x, 20, 20);
  ellipse(width/2, z, 20, 20);

  ellipse(width/4, height/4, random(70), random(70));
  ellipse(a/2, height/4, 20, 20);
  ellipse(b/2, height/4, 20, 20);
  ellipse(width/4, x/2, 20, 20);
  ellipse(width/4, z/2, 20, 20);

  ellipse(width, height, random(200), random(200));
  ellipse(a, height, 20, 20);
  ellipse(b, height, 20, 20);
  ellipse(width, x, 20, 20);
  ellipse(width, z, 20, 20);
  ellipse(width-150, 100, 100, 100);
  ellipse(200, height-100, 80, 80);
}
