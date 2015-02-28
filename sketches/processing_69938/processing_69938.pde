
class ColorLib
{
  color [] c;
  ColorLib ( color [] c )
  {
    this.c = c;
  }
  
  void setColor (color [] c)
  {
    this.c = c;
  }
  
  color getColor ()
  {
    return c [(int) random (c.length) ];
  }
  
  void printList ()
  {
    for (int i = 0; i < c.length; i++)
    {
      println ("r: " + red (c[i]) + ",  g: " + green (c[i]) + ", b: " + blue (c[i]) + ", a: " + alpha (c[i]));
    }
  }
}

