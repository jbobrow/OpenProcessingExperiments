
void setup()
{
  size(800, 800);
  background(0, 0, 0);

  int tileSize = 100;
  int numberOfRows = height / tileSize;
  int tilesPerRow = width / (tileSize * 2);

  for (int i = 0; i < numberOfRows; i++)
  {
    int rowOffset = 0;


    if (i % 2 == 0)
    {
      rowOffset = tileSize;
    }

    for (int j = 0; j < tilesPerRow; j++)
    {
      float xPos = j * tileSize * 2;
      float yPos = i * tileSize;

      fill(255, 255, 255);
      rect(xPos + rowOffset, yPos, tileSize, tileSize);
    }
  }
}
