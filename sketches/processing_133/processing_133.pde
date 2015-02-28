
class Square
{
  int i; // i counts through array place-holders
  int r;
  int g;
  int b;
  Square(int _i, int _r, int _g, int _b)  
  {
    i = _i; 
    r = _r;
    g = _g;
    b = _b;
  }

  void embedSquare(int i, int r, int g, int b)
  {  
    xpos[i] = xpos[i] + ( xspeed * xdirection[i] ); // determines x and y position based on speed
    ypos[i] = ypos[i] + ( yspeed * ydirection[i] );

    if (xpos[i] > (xpos[i-1]+squaresize[i-1])-squaresize[i]) { // contrains new shape by previous shape
      xpos[i] = (xpos[i-1]+squaresize[i-1])-squaresize[i];
      xdirection[i] *= -1;
    } 
    else if (xpos[i] < xpos[i-1]) {
      xpos[i] = xpos[i-1]; // prevents shape from bouncing outside of another shape!
      xdirection[i] *= -1;
    }
    if (ypos[i] > (ypos[i-1]+squaresize[i-1])-squaresize[i]) {
      ypos[i] = (ypos[i-1]+squaresize[i-1])-squaresize[i];
      ydirection[i] *= -1;
    }
    else if (ypos[i] < ypos[i-1]) {
      ypos[i] = ypos[i-1]; // prevents shape from bouncing outside of another shape!
      ydirection[i] *= -1;
    }

    fill(r,g,b);  // draw shape
    rect(xpos[i], ypos[i], squaresize[i], squaresize[i]);

    xspeed *= 1.1;  // increases speed of successive shapes
    yspeed *= 1.1;
  }
}


