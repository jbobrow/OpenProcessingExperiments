
PFont font = createFont ("Arial", 12);

void setup ()
{
  size (600, 200);
  smooth();
  textFont (font, 12);
}

void draw ()
{
  background (#57385c);
  drawRaster();
}

void drawRaster ()
{
  int rows = 8;
  int columns = 6;

  float rectWidth = float(width) / columns;
  float rectHeight = float(height) / rows;

  int i = 0;

  while (i < rows)
  {
    float y = i * rectHeight;

    int j = 0;
    while (j < columns)
    {
      float x = j*rectWidth;
      // rechteck ----------------------------
      fill (#ffedbc);
      stroke (#A75265);
      strokeWeight (3);

      rect (x, y, rectWidth, rectHeight);
      
       // text ----------------------------------
    fill (#57385c);
   text ("i: " + nf (i, 2) + " / j: " + nf (j, 2), x + 10, y + 20);

      j = j +1;
    }

    i = i + 1;
  }
}

