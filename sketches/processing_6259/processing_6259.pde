
class Circle
{
  float _x,_y,_r,_m;
  Vector VELOCITY;
  Circle()
  {
    _x = 0;
    _y = 0;
    _r = 1;
    _m = _r*0.1;
    VELOCITY = new Vector(0,0);
  }
  Circle(float pX, float pY, float pR)
  {
    _x = pX;
    _y = pY;
    _r=pR;
    _m = _r*0.1;
    VELOCITY = new Vector(0,0);
  }
  void Update()
  {
    CheckBoundaryCollision(0,width,0,height);
    this._x+=VELOCITY._x;
    this._y+=VELOCITY._y;
  }
  void Render()
  {
    float px, py,x,y;
    x = (float)_r * cos(359 * PI/180.0f)+_x;
    y = (float)_r * sin(359 * PI/180.0f)+_y;
    px = x;
    py = y;
    for(int j = 0; j < 360; j+=2)
    {
      x = (float)_r * cos(j * PI/180.0f)+_x;
      y = (float)_r * sin(j * PI/180.0f)+_y;
      line(px,py,x,y);
      px = x;
      py = y;
    }
    x = (float)_r * cos(359 * PI/180.0f)+_x;
    y = (float)_r * sin(359 * PI/180.0f)+_y;
    line(px,py,x,y);
  }
  void CheckBoundaryCollision(float lx,float rx,float ty,float by)
  {
    if(_x<(lx+_r))
    {
      _x = lx+_r;
      VELOCITY._x*=-1;
    }
    if(_x>(rx-_r))
    {
      _x = rx-_r;
      VELOCITY._x*=-1;  
    }
    if(_y<(ty+_r))
    {
      _y = ty+_r;
      VELOCITY._y*=-1;
    }
    if(_y>(by-_r))
    {
      _y = by-_r;
      VELOCITY._y*=-1;
    }
  }
}


