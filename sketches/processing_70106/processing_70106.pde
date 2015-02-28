
//Samantha G CP1 Mods 14-15 9/13/12 
int c = 0;
int b = 600;
int change = 1;
int bChange = 1;
void setup()
{
  size(600,600);
  background(223,7,224);
}
void draw()
{
  fill(255,0,0,5);
  ellipse(c,c,120,200);
  ellipse(b,b,120,200);
  fill(0,255,0,5);
  ellipse(c,b,120,200);
  ellipse(b,c,120,200);
  fill(0,0,255,5);
  ellipse(c,300,120,200);
  ellipse(b,300,120,200);
    fill(255,0,0,5);
  ellipse(c,c,b,b);
  ellipse(b,b,b,b);
  fill(0,255,0,5);
  ellipse(c,b,b,b);
  ellipse(b,c,b,b);
  fill(0,0,255,5);
  ellipse(c,300,b,b);
  ellipse(b,300,b,b);
  c = c + change;
  b = b - bChange;
  if (c > 600)
  {
    change = -1;
  }
  if (c < 0)
  {
    change = 1;
  }
  if (b < 0)
  {
    bChange = -1;
  }
  if (b >600)
  {
    bChange = 1;
  }
}
