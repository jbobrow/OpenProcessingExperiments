
void setup ()
{
  size(800, 600);
  
  int numberOfCircles = 0;
  
  while (numberOfCircles < 5)
  {
    float xPos = 100 + 50 * numberOfCircles;
    ellipse(xPos, 400, 30, 30);
    numberOfCircles++;
  }
  for (int i = 0; i < 5; i++)
  {
    float xPos = 100 + 50 * i;
    ellipse(xPos, 200, 30, 30);
    
  }
  println("we're done!");
}
