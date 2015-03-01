
float x2Position=0;
float y2Position=0;

void setup ()
{
  size(400, 400);
}
void draw ()
{
  background (0);
  ellipse (x2Position, y2Position, 40, 40);
  x2Position=x2Position+10;
  y2Position=y2Position+10;
  if (x2Position>400)
  {
    x2Position=-20;
  }
  if (y2Position>400)
  {
    y2Position=int(random(1,6));
  }
  
}








