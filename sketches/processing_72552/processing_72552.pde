
//Lisa L, Random Walk, CP1 16/17

int x1 = 225;
int y1 = 225;
int b = 175;
int a = 127;
int b2 = 128;
int c = 127;
void setup()
{
  size(450,450);
  background(0);
}

void draw()
{
  fill(a,b2,c,1);
  rect(0,0,450,450);
  fill(x1-75,y1+3,b,100);
  ellipse(x1,y1,40,40);
  ellipse(y1-50,x1+50,40,40);
  fill(x1+25,y1-100,b+100,50);
  ellipse(x1-75,y1-75,40,40);
  ellipse(y1-75,x1-75,40,40);
  fill(x1-200,y1-111,b+52,75);
  ellipse(x1+75,y1+75,40,40);
  ellipse(y1+50,x1+50,40,40);
  x1 = x1 + int(random(-4,4));
  y1 = y1 + int(random(-4,4));
  b = b + int(random(-5,5));
  a = a + int(random(-5,5));
  b2 = b2 + int(random(-5,5));
  c = c + int(random(-5,5));
}
