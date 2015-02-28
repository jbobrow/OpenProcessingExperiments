
class Ball
{
  float x;
  float y;
  float Size;
  float tra = 150;
  Ball(float Xpos,float Ypos, float Size_)
  {
    x = Xpos;
    y = Ypos;
    Size = Size_;
  }
  void display()
  {
    fill(255,tra);
    noStroke();
    x = x + 10;
    tra = tra - 5;
    ellipse(x,y,Size,Size);
  }
  
}

