
void setup()
{
  size(400, 400);
  background(#000000);
}
void draw()
{
if (mousePressed)
  {
    int mX = mouseX;
    int mY = mouseY;
    if (mX < 200)
    {
    fill(#E01B6A); 
    text("WIN WIN WIN WIN WIN ", 100, 100); 
    }
    else
    {
    text("LOSE LOSE LOSE LOSE LOSE", 200, 300); 
    fill(#E01B1B); 
   }
  }
}

