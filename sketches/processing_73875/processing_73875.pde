
class Dino
{
  public PVector origin;
  public PVector speed;
  Sprite spr;
  float ang = 0;
  
  Dino(PVector origin)
  {
    this.origin = origin;
    spr = new Sprite("dino_strip.png", 4, Sprite.CENTER);
    speed = new PVector(0, 0);
  }
  
  void update()
  {
    float runFactor = .5;
    
    if(origin.x > width/2)
    {
      speed.x = -runFactor;
    }
    else
    {
      speed.x = runFactor;
    }
    speed.y = runFactor;
    
    /* Animate the sprite if moving */
    if (speed.x != 0 || speed.y != 0)
    {
      spr.speed = 0.25;
    }
    else
    {
      spr.speed = 0;
      spr.frame = 1;
    }
    
    /* Set the direction of rotation */
    spr.angle = atan2(height/2 - origin.y, width/2 - origin.x);
    
    /* Increment x and y */
    origin.add(speed);
  }
  
  void render()
  {
    update();
    spr.render(origin);
  }
}

