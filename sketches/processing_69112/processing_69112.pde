
void setup ()
{
  size(300, 300);
  smooth();
  noFill();
  background(255);
}
void draw()
{
  loop1();
  loop2();
  loop3();
}
void loop1()
{
  stroke(0);
  int x= 10;
  while (x<300)
  {
    ellipse(x, 150, 150, 150);
    x=x+3;
  }
}
void loop2()
{
  stroke(0, 255, 0);
  int x=10;
  while (x<300)
  {
    ellipse(x, 150, 150, 150);
    x=x+10;
  }
}
void loop3()
{
  stroke(124,127,224,125);
  int x=0;
  while (x<300)
  {
    ellipse(x, 150, 150, 150);
    x=x+5;
  }
}
