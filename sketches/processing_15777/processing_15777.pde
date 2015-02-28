
class Player
{
  float x, y;
  float previousY;
  int s;

  Player(float x, float y, int playerSize)
  {
    this.x = x;
    this.y = y;
    this.s = playerSize;
  }

  void display()
  {
    fill(255,0,0);
    ellipse(x,y,s+11,s+11);
    fill(255);
    ellipse(x-6.3,y-3,s-5,s-5);
    ellipse(x-2,y-3,s-5,s-5);
  }
}


