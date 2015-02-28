
int a = 10;
int b = 0;
int c = 10;
int d = 0;
void setup()
{
  size(500, 500);
  background(0);
}
void draw()
{
  stroke(a,b,d);
  ellipse(250-b, 250, 10, a);
  ellipse(250+b, 250, 10, a);
  ellipse(250, 250-d, c, 10);
  ellipse(250, 250+d, c, 10);
  if ( a > 450)
  {
    a = -a;
  }
  if (b >450)
  {
    b =-b;
  }
  if ( c > 450 )
  {
    c =-c;
  }
  if (d > 450)
  {
    d=-d;
  }
  a = a + 2;
  b = b + 3;
  c = c + 2;
  d = d + 3;
}
