
//William T., BouncingBall, CP1 Mods 14-15
BounceBall who; 
BounceBall pond;
BounceBall song;
boolean mode = true;
void setup()
{
  size(500, 500);
  who = new BounceBall();
  pond = new BounceBall();
  song = new BounceBall();
}
void draw()
{
  if (mode == true)
  {
    background(200);
  }
  fill(5, 30, 130);
  who.mov();
  who.show();
  who.bounce();
  fill(214, 15, 30);
  pond.mov();
  pond.show();
  pond.bounce();
  fill(170, 109, 52);
  song.mov();
  song.show();
  song.bounce();
}
class BounceBall
{
  float x, y;
  boolean up, right;
  BounceBall()
  {
    x = int(random(300));
    y = int(random(300));
    up = false;
    right = true;
  }
  void mov()
  {
    if (up == true)
    {
      y = y - PI;
    }
    else if (up == false)
    {
      y = y + PI;
    }
    if (right == true)
    {
      x = x + (PI+1);
    }
    else if (right == false)
    {
      x = x - (PI+1);
    }
  }
  void bounce()
  {
    if (x < 25)
    {
      right = true;
    }
    if (x > 475)
    {
      right = false;
    }
    if (y > 475)
    {
      up = true;
    }
    if (y < 25)
    {
      up = false;
    }
  }
  void show()
  {
    ellipse(x, y, 50, 50);
  }
}
void mousePressed()
{
  mode = !mode;
  redraw();
}
