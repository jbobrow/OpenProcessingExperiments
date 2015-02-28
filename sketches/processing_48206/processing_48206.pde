


class character
{
  
  PVector pos;
  PVector vel, acc;
  boolean on_ground = false;
  float ground_pos = 400;
  sketch_circle body;
  
  character()
  {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0,0);
    acc = new PVector(0,1);
    body = new sketch_circle(0,-15,30,1);
  }
  
  void update()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    body.seed += 1239487;
    body.render();
    
    if (!on_ground)
    {
      vel.add(acc);
      pos.add(vel);
      if (pos.y > ground_pos)
      {
        on_ground = true;
        pos.y = ground_pos;
        vel.y = 0;
      }
    }
    else
    {
      pos.add(vel);
    }
    
    popMatrix();
  }
  
  void move()
  {
    if (keyCode == UP && on_ground)
    {
      vel.y = -18;
      on_ground = false;
    }
    else if (keyCode == RIGHT)
    {
      vel.x = 5;
    }
    else if (keyCode == LEFT)
    {
      vel.x = -5;
    }
  }
  
  void stop()
  {
  
    vel.x = 0;
  }
      
      
    
  }
    

