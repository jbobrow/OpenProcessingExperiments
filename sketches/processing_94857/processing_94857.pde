
//Inky Class

class Inky
{
  float X;
  float Y;
  
  float Width;
  float Height;
  int Colour;
 
  Inky(float x, float y, float width, float height, int colour)
  {
      X = x;
      Y = y;
      Width = width;
      Height = height;
      Colour = colour;
 
  }
 
  void show()
  {
      pushMatrix();
          rectMode(CORNER);
          rect(  X,   Y, Width, Height );
          fill( Colour );
      popMatrix();
  }
 
  void move(int x,int y)
  {
      X = x;
      Y = y;
  }
 
  float xPos()
  {
      return X;
  }
 
  float yPos()
  {
      return Y;
  }
 
  float height()
  {
      return Height;
  }
 
  float width()
  {
      return Width;
  }
}


