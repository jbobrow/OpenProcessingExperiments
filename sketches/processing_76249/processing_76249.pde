
Rectangle[] squares = new Rectangle[150];
void setup() 
{
  size(500, 500);
 
  for (int i=0; i < 200; i++) 
  {
    squares[i] = new Rectangle();
    squares[i].rectx = i*2;
    squares[i].recty = i;
    squares[i].rectyspeed = squares[i].rectyspeed * random(1);
  }
}
void draw() 
{
  background(0);
  for (int i=0; i < 200; i = i++)
  {
    squares[i].move_rect();
    squares[i].draw_rect();
  }
}
class Rectangle 
{
  float rectx;
  float recty;
  float rectxspeed;
  float rectyspeed;
 
  Rectangle() 
  {
    rectx = 30;
    recty = 30;
 
    rectxspeed = 0;
    rectyspeed = 2;
  }
  void draw_rect()
  {
    fill(147, 247, 17, 65);
    rect(rectx, recty, 30, 30);
  }
  void move_rect() 
  {
    //  rect_y += rect_yspeed;
    recty = recty + rectyspeed;
    rectyspeed = rectyspeed + .3;
    if (recty > height - 30)
    {
      rectyspeed = rectyspeed * -1;//bounce
      rectyspeed = rectyspeed * .9;//lose bounce
      recty = height - 30;
    }
  }
}
