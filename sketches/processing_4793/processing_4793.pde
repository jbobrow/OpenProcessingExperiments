
class Block
{
  int x = 0;
  int y = 0;
  int c = 0;
  private Block(int x, int y, int c)
  {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  void draw()
  {

  colour(c);
  rect(grid.get_X(x),grid.get_Y(y),horizontal,horizontal);

  }
  public int get_X()
  {
    return x;
  }
  
  public int get_Y()
  {
    return y;
  }
  
  public int get_C()
  {
    return c;
  }
  
  public void set_X(int x)
  {
    this.x = x;
  }
  
  public void set_Y(int y)
  {
    this.y = y;
  }
}

