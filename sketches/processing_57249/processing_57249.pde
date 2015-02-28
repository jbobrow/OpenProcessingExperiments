
class BorderLib
{
  private Border border;
  BorderLib (int i)
  {
    init(i);
  }

  public int [] [] getBorder ()
  {
    return (border.getBorder());
  }

  private void init (int n)
  {
    int x = 0, y = 0;
    if (n == 1)
    {
      int [] [] b = new int [XRES*2 + 2*(YRES-2)] [2];
      for (int i = 0; i < b.length; i++)
      {
        if (i == 0) {
          x = 0;
          y = 0;
        }
        else if (i == XRES) {
          x = 0; 
          y = YRES-1;
        }
        else if (i == XRES*2) {
          x = 0;
          y = 1;
        }
        else if (i == XRES*2 + YRES-2) {
          x = XRES-1;
          y = 1;
        }

        b [i] [0] = x;
        b [i] [1] = y;

        if (i < XRES*2) x++;
        else y++;
      }
      border = new Border (b);
    }
    else if (n == 2)
    {
      int [] [] b = new int [20] [2];
      int count = 0;
      for (int i = 0; i < XRES*YRES; i++)
      {
        if (x == (int) (XRES/3.0) && y > 5)
        {
          b [count] [0] = x;
          b [count] [1] = y;
          count++;
        }
        else if (x == (int) (XRES*2.0/3.0) && y < 10)
        {
          b [count] [0] = x;
          b [count] [1] = y;
          count++;
        }
        x++;
        if (x>=XRES) {
          x = 0;
          y++;
        }
      }
      border = new Border (b);
    }
  }
}

class Border
{
  private int [] [] b;
  Border (int [] [] b)
  {
    this.b = b;
    //this.b = new int [b.length] [2];
    //arrayCopy (this.b, b);
  }

  public int [] [] getBorder ()
  {
    return b;
  }
}


