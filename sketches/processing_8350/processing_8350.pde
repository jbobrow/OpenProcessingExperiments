
class EquiNode
{
  float x, y;
  float rad = 10;
  float speed = 3;
  EquiNode friend1, friend2;
  ArrayList watchers;
  
  EquiNode(float xP, float yP)
  {
    x = xP; y = yP;
    watchers = new ArrayList(0);
  }
  
  void addFriends(EquiNode f1, EquiNode f2)
  {
    friend1 = f1; friend2 = f2;
    f1.addWatcher(this);
    f2.addWatcher(this);
  }
  
  void addWatcher(EquiNode in)
  {
    watchers.add(in);
  }
  
  void draw(color col)
  {
    fill(col);
    stroke(col);
    ellipse(x, y, rad, rad);
  }
  
  void step()
  {
    float m = (friend2.y-friend1.y)/(friend2.x-friend1.x);
    float pm = (-1/(m+0.0));
    float midX = lerp(friend1.x, friend2.x, .5);
    float midY = lerp(friend1.y, friend2.y, .5);
    
    float xIntercept = ((-m*x)+y+(pm*midX)-midY)/(pm-m+0.0);
    float yIntercept = m*(xIntercept - x)+y;
    
    if(xIntercept > -2147483648 && yIntercept > -2147483648)
    {
    
    float aTheta = atan2((friend2.y-friend1.y), (friend2.x-friend1.x)) + (PI/2.0);
    
    while(dist(xIntercept, yIntercept, friend1.x, friend1.y) <= rad  || dist(xIntercept, yIntercept, friend2.x, friend2.y) <= rad)
    {
      xIntercept+=cos(aTheta)*(3*rad);
      yIntercept+=sin(aTheta)*(3*rad);
    }
    
    
    if(dist(mouseX, mouseY, x, y) < rad)
    {
      fill(255,0,0,40);
      stroke(255,0,0);
      ellipse(xIntercept, yIntercept, 5, 5);
      line(midX, midY, xIntercept, yIntercept);
      stroke(0,0,255);
      line(x,y,xIntercept, yIntercept);
      stroke(0,255,0);
      strokeWeight(1);
      line(friend1.x, friend1.y, friend2.x, friend2.y);
      strokeWeight(1);
      for(int i = 0; i < watchers.size(); i++)
      {
        EquiNode nd = (EquiNode)watchers.get(i);
        nd.draw(color(255,200,0));
      }
    }
    
    float diffX = xIntercept - x;
    float diffY = yIntercept - y;
    float theta = atan2(diffY, diffX);
    
    if(dist(x, y, xIntercept, yIntercept) > speed)
    {
      x += cos(theta)*speed;
      y += sin(theta)*speed;
    }
    else
    {
      x = xIntercept;
      y = yIntercept;
    }

  //  println(xIntercept+"  :  "+yIntercept);
    }
  }
  
  
  void hitTest(EquiNode nd)
  {
    if(dist(x,y,nd.x,nd.y) < rad)
    {
      float diffX = nd.x - x;
      float diffY = nd.y - y;
      float theta = atan2(diffY, diffX)+PI;
      
      x += cos(theta)*speed;
      y += sin(theta)*speed;
    }
  }
  
  
}

