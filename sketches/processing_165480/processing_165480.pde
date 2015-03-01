
// Enrique Canto
// Práctica 1
// 11-10-2014

DinaSquare dinaSquare;
DinaSquare[] dinaSquares;

int t;
int rows;
int cols;
int squaresCount;
int padding;
int squareSize;
int currentColor;
color _color;
color backgroundColor;
color[] colors;

void setup()
{
  size(680,680, P2D);
  smooth();

  t = 0;
  rows = 3;
  cols = 3;
  squaresCount = rows * cols;  
  padding = 20;
  squareSize = 200;

  dinaSquares = new DinaSquare[squaresCount];
  colors = new color[5];

  colors[0] = color(230,232,227);
  colors[1] = color(215,218,207);
  colors[2] = color(190,195,188);
  colors[3] = color(143,154,156);
  colors[4] = color(101,114,122);

  currentColor = (int)random(0,5);

  backgroundColor = colors[currentColor];

  background(backgroundColor);

  int c = 0;

  for (int i = 0; i < rows; i++)
  {
    for (int j = 0; j < cols; j++) {
      dinaSquare = new DinaSquare(j * squareSize + (padding * (j + 1)), i * squareSize + (padding * (i + 1)), squareSize, squareSize);
      dinaSquares[c] = dinaSquare;
      dinaSquares[c].colors(colors);
      c++;
    }
  }

}

void draw()
{
    int count = 0;
    for (DinaSquare o : dinaSquares) 
    {
      dinaSquares[count].drawme();
      count++;
    }
}

// CLASSES

class DinaSquare
{
  int pos, posX, posY, w, h;
  int currentColor;
  boolean active;
  color backgroundColor;
  color[] colors;

  DinaSquare (int x, int y, int dswidth, int dsheight)
  {
    posX = x;
    posY = y;
    w = dswidth;
    h = dsheight;
    pos = 0;
  }

  void colors(color[] c)
  {
    colors = c;
  }

  void move(int x, int y)
  {
    posX = x;
    posY = y;
  }

  void drawme()
  {
    if (frameCount % (int)random(1,40) == 0) {
      currentColor = (int)random(0,5);
    }

    _color = (active) ? color(0) : colors[currentColor];

    noStroke();
    fill(_color);
    rect(posX, posY, w, h);
  }

}


