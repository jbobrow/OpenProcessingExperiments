
class Number
{

  PGraphics p;

  float x;
  float y;
  float textH;
  float speed;
  SNum[] nums;
  char c;
  int randomNum;


  Number(float x_, float y_, char c_)
  {
    x = x_;
    y = y_;
    c = c_;
//     print(c);
    nums = new SNum[10];
    p = createGraphics(20, 30, P2D);
    speed = 10;
    y = y_;
    randomNum = (int)(random(0, 10));

    for (int i = 0; i<10; i++)
    {
     
      nums[i] = new SNum(c, Character.forDigit(i, 10), p.height, (float)(-i*p.height), p);
    }
    //println();
  }


  void display()
  {
    p.beginDraw();
    p.background(0);
    for (int i = 0; i<10; i++)
    {
      nums[i].display();
    }
    p.endDraw();
    if (frameCount%200<100) { 
      move();     
      randomNum = (int)(random(0, 10));
    }
    else stop(randomNum);
    image(p, x, y);
  }


  void move()
  {
    for (int i = 0; i<10; i++)
    {
      nums[i].move();
    }
  }

  void stop(int x)
  {
    nums[x].slow();

    for (int i = 0; i<10; i++)
    {
      if (i!=x)
        nums[i].away();
    }
  }
}


