
void setup ()
{
  size (600, 200);
  smooth();
  
  rectMode (CENTER);
}

void draw ()
{
  background (#57385c);
  drawRaster();
}

void drawRaster ()
{
  int rows = 10;
  int columns = 30;
  int mySquare = 15;

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
      float y = margin + mySquare /2 + i * (stepsY) ;
      float x = margin + mySquare /2  + j*(stepsX);

      float distance = dist (x, y, width/2, height/2);
      float s = map (distance, 0, maxDistance, 2, mySquare);
      float angle = map (distance, 0, maxDistance, PI/2, 0);

      // rechteck ----------------------------
      fill (#ffedbc);
      stroke (#A75265);
      strokeWeight (3);

      pushMatrix();
      translate (x, y);
      rotate (angle);
      rect (0, 0, s, s);
      popMatrix();

      j = j +1;
    }

    i = i + 1;
  }
}

