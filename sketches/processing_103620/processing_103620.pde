
void setup ()
{
  size(800, 800);
  
  for(int j=0; j < 8; j++)
  {
   drawRow(j * 100, color(30 * j, 30 * j, 30 * j));
  }
}

void drawRow(float yPos, color rowColor)
{
  for(int i = 0; i < 8; i++)
  {
      float xPos = i * 100;
      fill(rowColor);
      rect(xPos, yPos, 100, 100);
  }
}
