
class Blocks
{
  float x, y, ym;
  int block;
  Blocks()
  {
    block = int(random(0, 3));
  }
  void show()
  {
    if (y < 3000)
    {
      y+=ym;
    }
    if (ym < 3)
    {
      ym+=0.1;
    }
    switch(block)
    {
    case 0:
      image(blocka, x, y, 25, 25);
      break;
    case 1:
      image(blockb, x, y, 25, 25);
      break;
    case 2:
      image(blockc, x, y, 25, 25);
      break;
    }
  }
  void hit()
  {
    if (x <= player.x+50 && x >= player.x &&(y <= player.y+50 && y >= player.y))
    {
      y = 2900;
      switch(block)
      {
      case 0:
        bombs++;
        break;
      case 1:
        score+=score2;
        score2+=1000;
        break;
      case 2:
        lives++;
        break;
      }
    }
  }
}


