
class gameObjects
{
  float x;
  float y;
  float speed;
  boolean check;
  
  gameObjects()
  {
    x = random(width);
    y = random(height) - 500;
    speed = 1;
    check = false;
  }
  
  void draw()
  {
  }
  
  void update()
  {
  }
  
  void reset()
  {
    check = false;
  }
  
  void speedUp()
  {
    speed += 0.06;
  }

}


