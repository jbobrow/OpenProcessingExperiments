

Object player = new Object();
void setup()
{
  size(700,700);
  
}

void draw()
{
  
  
  background(255);
  if(player.destroyed == false)
  {
    player.render();
  }
  player.update();
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      player.direction.x = 0;
      player.direction.y = player.speed * -1;
      player.speed += .1;
    }
    if (keyCode == DOWN)
    {
      player.direction.x = 0;
      player.direction.y = player.speed;
      player.speed += .1;
    }
    if (keyCode == RIGHT)
    {
      player.direction.x = player.speed;
      player.direction.y = 0;
      player.speed += .1;
    }
    if (keyCode == LEFT)
    {
      player.direction.x = player.speed * -1;
      player.direction.y = 0;
      player.speed += .1;
    }
  }
}


class Object
{
  PVector location = new PVector (350,350); 
  PVector direction = new PVector (0,0);
  float speed = 3;
  boolean destroyed = false;
  color ringColor = color (0);
  boolean shielded = false;
  float shieldTimer = 300;
  
  
  void render()
  {
      pushMatrix();
      ellipseMode(CENTER);
      fill(ringColor);
      stroke(0);
      strokeWeight(2);
      ellipse(location.x,location.y,30,30);
      fill(0);
      noStroke();
      ellipse(location.x,location.y,15,15);
      popMatrix();
     
      location.add(direction);   
      println(speed);
  }
  
  void update()
  {
    location.add(direction); 
    ringColor = color (255);
    
    if (speed > 6)
    {
      speed = 6;
    }
    if (location.x - 30 > width || location.x + 30 < 0 || location.y - 30 > height || location.y + 30 < 0)
    {
      this.destroyed = true;
    }
    
    if (this.destroyed == true)
    {
      this.destroyed = false;
      this.direction.x = 0;
      this.direction.y = 0;
      this.location.x = 350;
      this.location.y = 350;
      this.speed = 3;
    }
    if (shieldTimer == 0)
    {
      shielded = false;
    }
    if (shielded == true)
    {
      ringColor = color (3,175,252);
      shieldTimer -= 1;
      if (location.x + 20 > width)
      {
        direction.x = direction.x * -1;
      }
      if (location.x - 20 < 0)
      {
        direction.x = direction.x * -1;
      }
       if (location.y + 20 > height)
      {
        direction.y = direction.y * -1;
      }
      if (location.y - 20 < 0)
      {
        direction.y = direction.y * -1;
      }
    }
    
  }
}



