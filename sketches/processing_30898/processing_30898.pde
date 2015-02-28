
class Circle implements Runnable
{
  PVector loc;
  int r;
  color c;
  
  public Circle()
  {
    loc = new PVector();
  }
  public Circle(int n, int ar, color ac)
  {
    this();
    r = ar;
    c = ac;
  }
  
  public void run()
  {
    loc.mult(.99);
  }
  
  public void push()
  {
    for(int i = 0; i < circles.size(); i++)
    {
      Circle c = (Circle)circles.get(i);
      
      if(touching(c))
      {
        if(dist(c) == 0 && this != c)
          loc.add(new PVector(random(-1,1),random(-1,1)));//radius));//adds a small random vector, so that the distance wont be 0.
 
        PVector push = PVector.sub(loc, c.loc);
        push.limit((1+(2*r) - dist(c))/30.0);//this r might be wrong
        loc.add(push);
      }
    }
    
    loc.limit(400 - r);
  }
  
  public void show()
  {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(c);
    ellipse(0, 0, r*2, r*2);
    
    for(int d = 0; d < 6; d++)//dots
    {
      fill(100.0*d/6, 100, 100);
      float theta = TWO_PI*d/6;
      float dotDist = .7 * r;
      int dotR = 15;
      ellipse(dotDist * cos(theta), dotDist * sin(theta), dotR, dotR);
    }
    
    popMatrix();
  }
 
  public boolean touching(Circle c)
  {
    return dist(c) < 2*r && c != this;
  }
  
  public float dist(Circle c)
  {
    return loc.dist(c.loc);
  }
}

