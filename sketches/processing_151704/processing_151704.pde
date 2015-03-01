
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
  int rows = 4;
  int columns = 6;

  int margin = 15;      // abstand zum Fensterrand
  int padding = 10;     // abstand der rechtecke zueinander

  int totalSpaceWidth = width - 2*margin - (columns-1)*padding;
  int totalSpaceHeight = height - 2*margin - (rows-1)*padding;

  float rectWidth = float(totalSpaceWidth) / columns;
  float rectHeight = float(totalSpaceHeight) / rows;

  int i = 0;

  while (i < rows)
  {
    float y = margin + i * (rectHeight + padding) ;

    int j = 0;
    while (j < columns)
    {
      float x = margin + j*(rectWidth+padding);
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

