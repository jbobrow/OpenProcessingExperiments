
class Ball
{
  PVector loc;
  PVector vel;
  PVector acc;
  float maxVel;
  float r;
  int me;
  color c;
  
  Ball()
  {
    loc = new PVector();
    vel = new PVector();
    acc = new PVector();
    r = 10;
    maxVel = 24;
    c = color(255);
  }
  
  Ball(PVector l_, int m_)
  {
    loc = l_;
    vel = new PVector();
    acc = new PVector();
    r = 10;
    maxVel = 8;
    me = m_;
    c = color(192);
  }
  
  void run()
  {
    update();
    collide();
    border();
    render();
  }
  
  void update()
  {
    vel.add(acc);
    vel.limit(maxVel);
    vel.mult(friction);
    loc.add(vel);
    acc.mult(0);
  }
  
  void render()
  {
    noStroke();
    fill(c);
    ellipse(loc.x, loc.y, r*2, r*2);
  }
  
  boolean isColliding(Ball b_)
  {
    float d;
    d = dist(loc.x, loc.y, b_.loc.x, b_.loc.y);
    if (d<(r+b_.r))
    {
      return true;
    }
    return false;
  }
  
  void collide()
  {
    for (int i=0; i<balls.size(); i++)
    {
      Ball b = (Ball)balls.get(i);
      
      float dx = b.loc.x - loc.x;
      float dy = b.loc.y - loc.y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = b.r + r;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = loc.x + cos(angle) * minDist;
        float targetY = loc.y + sin(angle) * minDist;
        float ax = (targetX - b.loc.x) * spring;
        float ay = (targetY - b.loc.y) * spring;
        vel.x -= ax;
        vel.y -= ay;
        b.vel.x += ax;
        b.vel.y += ay;
      }
    }
  }
  
  void border()
  {
    if (loc.x-r<0) vel.x*=-1;
    if (loc.x+r>width) vel.x*=-1;
    if (loc.y-r<0) vel.y*=-1;
    if (loc.y+r>height) vel.y*=-1;
  }
}

