
class Circle implements Runnable
{
  PVector loc;
  ArrayList circles;
  int r;
  color c;
  
  public Circle()
  {
    loc = new PVector();
    circles = new ArrayList();
  }
  public Circle(int n, int ar, color ac)
  {
    this();
    r = ar;
    c = ac;
    
    if(r > 10)
      for(int i = 0; i < n; i++)
      {
        //color col = color(random(255), random(255), random(255));
        color col = color(100.0*i/n, 255, 255);
        Circle c = new Circle(n, r/3, col);//n - 1
        circles.add(c);
      }
  }
  
  public void run()
  {
    loc.mult(.99);
    
    for(int i = 0; i < circles.size(); i++)
    {
      Circle c = (Circle)circles.get(i);
      c.push(this);
      c.run();
    }
  }
  
  public void push(Circle host)
  {
    for(int i = 0; i < host.circles.size(); i++)
    {
      Circle c = (Circle)host.circles.get(i);
      
      if(touching(c))
      {
        if(dist(c) == 0 && this != c)
          loc.add(new PVector(random(-1,1),random(-1,1)));//radius));//adds a small random vector, so that the distance wont be 0.
 
        PVector push = PVector.sub(loc, c.loc);
        push.limit((1+(2*r) - dist(c))/30.0);//this r might be wrong
        loc.add(push);
      }
    }
    
    loc.limit(host.r - r);
  }
  
  public void show()
  {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(c);
    ellipse(0, 0, r*2, r*2);

    for(int i = 0; i < circles.size(); i++)
    {
      Circle c = (Circle)circles.get(i);
      c.show();
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

