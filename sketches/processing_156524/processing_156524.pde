
//based on this: http://www.openprocessing.org/sketch/151704

float theta;

void setup ()
{
  size (500, 750);
  smooth();
}

void draw ()
{
  background (#202020);
  drawRaster();
  theta +=0.0523;
}

void drawRaster ()
{
  int rows = 7;
  int columns = 5;

  int margin = 50;     
  int padding = 20;     

  int totalSpaceWidth = width - 2*margin - (columns-1)*padding;
  int totalSpaceHeight = height - 2*margin - (rows-1)*padding;

  float rectWidth = float(totalSpaceWidth) / columns;
  float rectHeight = float(totalSpaceHeight) / rows;

  int i = 0;

  while (i < rows)
  {
    float y = margin + i * (rectHeight + padding) ;
    color f = lerpColor(#FFEC39, #FF6439, 1.0/rows*i);
    int j = 0;
    while (j < columns)
    {
      float x = margin + j*(rectWidth+padding);
      fill (f);
      noStroke();
      float offSet = TWO_PI/columns*(j+i);
      float h = map(sin(theta+offSet), -1, 1, 1, rectHeight);
      rect (x, rectHeight+y-h, rectWidth, h );
      fill (#57385c);
      j = j +1;
    }

    i = i + 1;
  }
}

