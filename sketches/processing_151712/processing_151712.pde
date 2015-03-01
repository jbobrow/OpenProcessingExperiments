
void setup ()
{
  size (600, 200);
  smooth();
}

void draw ()
{
  background (#57385c);
  drawRaster();
}

void drawRaster ()
{
  int rows = 6;
  int columns = 20;
  int myDiameter = 20;

  int margin = 15;      // abstand zum Fensterrand

  int totalSpaceWidth = width - 2*margin;
  int totalSpaceHeight = height - 2*margin;

  float stepsX = float(totalSpaceWidth) / columns;
  float stepsY = float(totalSpaceHeight) / rows;

  float maxDistance = dist(margin, margin, width/2, height/2);

  int i = 0;

  while (i < rows)
  {
    int j = 0;
    while (j < columns)
    {
      float y = margin + myDiameter /2 + i * (stepsY) ;
      float x = margin + myDiameter /2  + j*(stepsX);

      float distance = dist (x, y, width/2, height/2);
      float d = map (distance, 0, maxDistance, 5, myDiameter);

      // rechteck ----------------------------
      fill (#ffedbc);
      stroke (#A75265);
      strokeWeight (3);

      ellipse (x, y, d, d);


      j = j +1;
    }

    i = i + 1;
  }
}

