
int numlines = 20;
int Y1 = 0;
int Y2 = 500;
void setup()
{
  size(500,500);
  background(0);
  smooth();
  stroke(79, 252, 237);
}
void draw()
{
  background(0);
  int X1 = 0;
  for (int i = 0; i< numlines; i++)
  {
    line(X1, Y1, mouseX, mouseY);
    line(X1, Y2, mouseX, mouseY);
    X1 += 25;
  }
}
                
                
