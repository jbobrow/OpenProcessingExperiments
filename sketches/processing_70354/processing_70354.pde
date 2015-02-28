
//Simon L, Functions and Animation, CP1 Mod 14-15

int a = 0;
int b = 1;
float c = 0;
float d = 1;

void setup()
{
  size(500,500);
  strokeWeight(2);
}

void draw()
{
  background(255,255,0);
  circle();
  ball();
}
void ball()
{
  ellipse(15 + a,15 + a,30,30);
  ellipse(485 - a,485 - a,30,30);
  ellipse(485 - a,15 + a,30,30);
  ellipse(15 + a,485 - a,30,30);
  ellipse(15 + a, 250,30,30);
  ellipse(485 - a,250,30,30);
  ellipse(250,15 + a,30,30);
  ellipse(250,485 - a,30,30);
  ellipse(250,250,30,30);
  a = a - b;
  if(a < 15)
  {
  fill(135,206,235);
  b = -1;
  }
  if(a > 250)
  {
  fill(255,192,203);
  b = 1;
  }
}
void circle()
{
  ellipse(250,250,30+c,30+c);
  c = c + d;
  if(c < 0)
  {
  fill(147,112,219);
  d = 1.5;
  }
  if(c > 470)
  {
  fill(0,255,0);
  d = -1.5;
  }
}
