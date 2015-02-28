
class Particle
{
  public PVector pos = new PVector(width/2,height/2);
  public PVector vel = new PVector(0,0);
  public PVector maxVel = new PVector(random(3,5),random(3,5));
  public float radius = random(10,25);
  public color col = color(random(200),random(200),random(200));
  public int inCollision = 0;
  public float gravity = 0.1;
  public boolean useGravity = false;
  public float maxY = 4;
  public float friction = 0.99;
  public boolean useFriction = false;
  
  public Particle lastCollision = null;
  
  
  public Particle() {}
  
  public Particle(PVector pos, PVector vel)
  {
    this.pos = pos;
    this.vel = vel;
  }
  
  public Particle(PVector pos, PVector vel, float gravity)
  {
    this(pos,vel);
    this.gravity = gravity;
  }
  
  public Particle(PVector pos, PVector vel, float radius, color col)
  {
    this(pos,vel);
    this.radius = radius;
    this.col = col;
  }
  
  
  public void run()
  {
    update();
    draw();
  }
  
  public void update()
  {
    if(abs(vel.x) > maxVel.x)
      vel.x = maxVel.x * (vel.x/abs(vel.x));
    if(abs(vel.y) > maxVel.y)
      vel.y = maxVel.y * (vel.y/abs(vel.y));
    
    if(useGravity)
      if(vel.y < maxY)
        vel.add(new PVector(0,gravity));
    
    if(useFriction)
      vel.mult(friction);
    
    pos.add(vel);
    
    if(pos.x < radius)
    {
      pos.x = radius;
      vel.x = abs(vel.x);
    }
    else if(pos.x > width - radius)
    {
      pos.x = width-radius;
      vel.x = -abs(vel.x);
    }
      
    if(pos.y < radius)
    {
      pos.y = radius;
      vel.y = abs(vel.y);
    }
    else if(pos.y > height - radius)
    {
      pos.y = height - radius;
      vel.y = -abs(vel.y);
    }
  }
  
  public void draw()
  {
      fill(col);
    ellipse(pos.x, pos.y, radius, radius);    
  }
  
  
  public float getMass()
  {
    return pow(radius,2);
  }
}

