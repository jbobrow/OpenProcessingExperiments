
class Bot
{
  PImage b = loadImage("robot.png");
  PVector pos;
  int dir;
  
  Bot()
  {
    pos = new PVector(random(100,500), random(300, 600));
    dir = (int)random(4);
  }
  
  void update()
  {
    // Direction
    int r = (int)random(50);
    if (r == 0)
      dir = (dir+1)%4;
    else if (r == 1)
      dir = (dir+3)%4;
    
    // Movement
    if (dir == 0)
      pos.y-=15;
    else if (dir == 1)
      pos.x+=15;
    else if (dir == 2)
      pos.y+=15;
    else if (dir == 3)
      pos.x-=15;
      
    // Edge-Detection  
    if(pos.x>600)
      dir=3;
    else if (pos.x<0)
      dir=1;
    else if (pos.y>700)
      dir=0;
    else if (pos.y<200)
      dir=2;
      
    // Display
    fill(0);
    image(b, pos.x, pos.y);
  }
}

