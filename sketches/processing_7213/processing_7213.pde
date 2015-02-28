
// Project: MondrianSquares
// File: MondrianSquare
// Author: James Justinic
// Date: 1/21/2010

class MondrianSquare
{
  int x, y, w, h;
  SquareColor c;

  MondrianSquare(int startX, int startY, int endX, int endY, SquareColor sc)
  {
    x = startX;
    y = startY;
    w = endX - startX;
    h = endY - startY;
    c = sc;
  }

  void drawShape()
  {
    fill(c.r(), c.g(), c.b()); 
    rect(x, y, w, h);
  }
}

