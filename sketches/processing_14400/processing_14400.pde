
class BodyPart
{
  float x,y;
  float radius;
  
  BodyPart(float _x, float _y, float _radius)
  {
    x = _x;
    y = _y;
    radius = _radius;
  }
  
  void update(float _x, float _y)
  {
    if(dist(x,y,_x,_y)> 5)
    {
      float d = dist(x,y,_x,_y);
      float angle = atan2((y-_y),(x-_x));
      
      x = _x + cos(angle) * 5;
      y = _y + sin(angle) * 5;
    }
    else
    {
      float d = dist(x,y,_x,_y);

      float angle = atan2((y-_y),(x-_x));
      
      x = _x + cos(angle) * d;
      y = _y + sin(angle) * d;
    }
    //draw();
  }
  
  void draw()
  {
    fill(225);
    ellipse(x,y,radius+1,radius+1);
    fill(200, 0, 50);
    ellipse(x,y,radius,radius);
  }
}

