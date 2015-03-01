
ArrayList<Actor> robots = new ArrayList<Actor>();

void setup()
{
  size(700,700);
  for (int i = 0; i < 100; i++)
  {
    robots.add(new Actor());
  }
}

void draw()
{
  background(255);
  for (int i = 0; i < robots.size(); i++)
  {
    Actor a = robots.get(i);
    a.drawActor();
  }
}
 
 
class Actor
{
  float x;
  float y;
  float xv;
  float yv;
  float theta;
  color c;
  
  Actor()
  {
    x = random(width);
    y = random(height);
    xv = random(-2,2);
    yv = random(-2,2);
    c = color( random(255), random(255), random(255) );
  }
  
  float distanceTo(float xs, float ys)
  {
    return(dist(x,y,xs,ys));
  }
  
  float getDirection()
  {
    return theta;
  }
  
  float getSpeed()
  {
    return sqrt(xv*xv + yv*yv);
  }
  
  void drawActor()
  {
    AI();
    
    x += xv;
    y += yv;
    
    
    if (x > width)
    {
      xv *= -1;
      x -= 10;
    }
    else if (x < 0)
    {
      xv *= -1;
      x += 10;
    }
    if (y > height)
    {
      yv *= -1;
      y -= 10;
    }
    else if (y < 0)
    {
      yv *= -1;
      y += 10;
    }
    if (xv > 0)
    {
      theta = atan(yv/xv);
    }
    else
    {
      theta = PI - atan(yv/xv);
    }
    fill(c);
    rect(x,y,10,10);
  }
  
  void AI()
  {
    //get three nearest neighbors
    int c1=0;
    float c1d = width*height;
    int c2=0;
    float c2d = width*height;
    int c3=0;
    float c3d = width*height;
    
    float avg_theta = 0;
    float avg_speed = 0;
    
    //nearest neighbor
    for (int i = 0; i < robots.size(); i++)
    {
      Actor a = robots.get(i);
      if (a != this)
      {
        if (a.distanceTo(x,y) < c1d)
        {
          c1d = a.distanceTo(x,y);
          c1 = i;
        }
      }
    }
    avg_theta = robots.get(c1).getDirection();
    avg_speed = robots.get(c1).getSpeed();
    
    //2nd nearest neighbor
    for (int i = 0; i < robots.size(); i++)
    {
      Actor a = robots.get(i);
      if ((a != this) && (i != c1))
      {
        if (a.distanceTo(x,y) < c2d)
        {
          c2d = a.distanceTo(x,y);
          c2 = i;
        }
      }
    }
    avg_theta += robots.get(c2).getDirection();
    avg_speed += robots.get(c2).getSpeed();
        
    //3rd nearest neighbor
    for (int i = 0; i < robots.size(); i++)
    {
      Actor a = robots.get(i);
      if ((a != this) && (i != c1) && (i != c2))
      {
        if (a.distanceTo(x,y) < c3d)
        {
          c3d = a.distanceTo(x,y);
          c3 = i;
        }
      }
    }
    avg_theta += robots.get(c3).getDirection();
    avg_speed += robots.get(c3).getSpeed();
    
    avg_theta /= 3;
    avg_speed /= 3;
    
    float speed = sqrt(xv*xv + yv*yv);
    
    //println(str(speed) + " " + str(avg_speed));
    speed = 0.2 * speed + 0.8 * avg_speed;
    
    
    xv = speed * cos(avg_theta);
    yv = speed * sin(avg_theta);
    
                  
  }
    
}
    
