
class Square
{
  float x, y, edge, dx, dy;
  color col;
  
  void setup( float tx, float ty, float tedge, float tdx, float tdy, color tcol)
  {
    x = tx;
    y = ty;
    edge = tedge;
    dx = tdx;
    dy = tdy;
    col = tcol;
  }
  
  void move()
  {
  x = x + dx;
  y = y + dy;
  }
  
  void draw()
  {
    fill(col);
   ellipse(x,y, edge, edge); 
  }
  
  void wrap()
  {
    move();
    if (x > width) x = 0;
    if(y > height) y = 0;
    draw();
  }
  
  void bounce()
  {
    move();
    if (x > width || x < 0) dx = -dx ;
    if (y > height || y < 0) dy = -dy;
    draw ();
  }
}

