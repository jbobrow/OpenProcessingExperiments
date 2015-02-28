
//Jinhe Weber, Computer Programming, Mods 16-17
int xPos = 2;
int change = 2;
void setup()
{
  size(400,400);
  stroke(51,178,211);
  noFill();
  background(27,97,165);
}
void draw()
{
  fill(0,0,0,10);
  ellipse(200,200,xPos,xPos);
  xPos = xPos + change;
  if (xPos > 600)
  {
    change = -2;
  }
  if (xPos < 0)
  {
    change = 2;
  }
}
