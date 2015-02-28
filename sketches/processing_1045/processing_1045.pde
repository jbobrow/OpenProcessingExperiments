
class Ball
{
  float friction;
  PVector position;
  PVector speed;

  Ball()
  {
    friction = 0.1;
    position = new PVector(height/2, width/2);
    speed = new PVector(random(0,15),random(0,15));
  }

  void move()
  {
    position.x +=speed.x;
    position.y +=speed.y;
    if(speed.x > 0) 
    {
      speed.x = constrain(speed.x-friction,0,100);
    }
    else
    {
     speed.x = constrain(speed.x+friction,-100,0);
    }
    if(speed.y > 0)
    {
      speed.y = constrain(speed.y-friction,0,100);
    }
    else
    {
      speed.y = constrain(speed.y+friction,-100,0);
    }
    background(0); 
    if (position.x > width || position.x < 0)
    { 
      speed.x *= - 1;
    } 
    if (position.y > height || position.y < 0)
    { 
      speed.y *= - 1;
    } 
  }

  void  display()
  {
    ellipse(position.x, position.y, 55, 55);
  }

}







