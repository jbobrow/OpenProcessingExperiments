
//Jonathan Huang

size(500,500);
background(0);

int a = 10;
int b = 0;
int c = 10;
int d = 0;
while(a < 250)
{
  ellipse(250-b,250,10,a);
  ellipse(250+b,250,10,a);
  ellipse(250,250-d,c,10);
  ellipse(250,250+d,c,10);
  a = a + 3;
  b = b + 3;
  c = c + 3;
  d = d + 3;
}
