
class Dot
{
  PVector _location;
  PVector _speed; // direction and magnitude

  float _radius;

  public Dot(float x, float y, float xs, float ys, float ms, float r)
  {
    _location = new PVector(x,y);
    _speed = new PVector(xs,ys);
    _speed.normalize();
    _speed.mult(ms);
    _radius = r;
  }

  void updateLocation()
  {
    _location.add(_speed);
    if (_location.x < 0)
    {
      _location.x += width;
    }
    else if (_location.x > width)
    {
      _location.x -= width;
    }
    if (_location.y < 0)
    {
      _location.y += height;
    }
    else if (_location.y > height)
    {
      _location.y -= height;
    }

  }

  void drawDot()
  {
    
    fill(255,255,255,55);
    ellipse(_location.x,_location.y,_radius,_radius);
  }

  void pushDot(float amount)
  {
    if (mouseX > _location.x)
    {
      _speed.x += amount; 
      _location.x += amount;
    }
    else
    {
      _speed.x -= amount; 
      _location.x -= amount;
    }

    if (mouseY > _location.y)
    {
      _speed.y += amount; 
      _location.y += amount;
    }
    else
    {
      _speed.y -= amount; 
      _location.y -= amount;  
    }
  }

  void collide(Dot d)
  {
    float apart = (d._radius+_radius);

    float halfwidth = width/2.0;
    float halfheight = height/2.0;

    PVector pdist = new PVector(_location.x,_location.y);
    pdist.sub(d._location);

    if (abs(pdist.x) > halfwidth)
    {
      if (_location.x < d._location.x) pdist.x = width - abs(pdist.x);
      else pdist.x = abs(pdist.x) - width;
    }
    if (abs(pdist.y) > halfheight)
    {
      if (_location.y < d._location.y) pdist.y = height - abs(pdist.y);
      else pdist.y = abs(pdist.y) - height;
    }
    float dist_apart = pdist.mag();

    float f = gravity /(dist_apart);
    float f2 = 1650.0*gravity/(dist_apart*dist_apart);

    pdist.normalize();
    pdist.mult(f);
    _speed.sub(pdist);
    d._speed.add(pdist);
    pdist.normalize();
    pdist.mult(f2);
    _speed.add(pdist);
    d._speed.sub(pdist);
    checkSpeed(maxSpeed);
    d.checkSpeed(maxSpeed);
    if ( dist_apart < apart)
    {
      PVector p = new PVector(_speed.x, _speed.y);
      p.add(d._speed);
      p.mult(0.5);
      _speed.normalize();
      _speed.mult(p.mag());
      d._speed.normalize();
      d._speed.mult(p.mag());

      PVector c = new PVector(_location.x, _location.y);
      c.sub(d._location);
      c.normalize();
      c.mult(0.5*apart);
      _location.sub(c);
      d._location.add(c);
    }
    

  }

  void checkSpeed(float _maxspeed)
  {
      _speed.limit(_maxspeed);
  }
}





