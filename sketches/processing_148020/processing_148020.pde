
class SideJumper
{
  PImage image;
  PVector position;
  float direction;
  PVector velocity;
  float jumpSpeed;
  float walkSpeed;
}
  
  
SideJumper megaMan;
float left;
float right;
float up;
float down;
  
float gravity = .5;
  
float ground = 700;
  
void setup()
{
  size(800, 800);
 
    
  megaMan = new SideJumper();
  megaMan.image = loadImage("Megaman.png");
  megaMan.position = new PVector(400, ground);
  megaMan.direction = 1;
  megaMan.velocity = new PVector(0, 0);
  megaMan.jumpSpeed = 10;
  megaMan.walkSpeed = 2;
}
  
void draw()
{
  background(255);
  updateMegaman();
}
  
void updateMegaman()
{
  
  if (megaMan.position.y < ground)
  {
    megaMan.velocity.y += gravity;
  }
  else
  {
    megaMan.velocity.y = 0;
  }
    
  if (megaMan.position.y >= ground && up != 0)
  {
    megaMan.velocity.y = -megaMan.jumpSpeed;
  }
    
  megaMan.velocity.x = megaMan.walkSpeed * (left + right);
    
  PVector nextPosition = new PVector(megaMan.position.x, megaMan.position.y);
  nextPosition.add(megaMan.velocity);
    
  float offset = 0;
  if (nextPosition.x > offset && nextPosition.x < (width - offset))
  {
    megaMan.position.x = nextPosition.x;
  }
  if (nextPosition.y > offset && nextPosition.y < (height - offset))
  {
    megaMan.position.y = nextPosition.y;
  }
    
  pushMatrix();
    
  translate(megaMan.position.x, megaMan.position.y);
    
  scale(megaMan.direction, 1);
    
  imageMode(CENTER);
  image(megaMan.image, 0, 0);
    
  popMatrix();
}
  
void keyPressed()
{
  if (key == 'd')
  {
    right = 1;
    megaMan.direction = -1;
  }
  if (key == 'a')
  {
    left = -1;
    megaMan.direction = 1;
  }
  if (key == ' ')
  {
    up = -1;
  }
  if (key == 's')
  {
    down = 1;
  }
}
  
void keyReleased()
{
  if (key == 'd')
  {
    right = 0;
  }
  if (key == 'a')
  {
    left = 0;
  }
  if (key == ' ')
  {
    up = 0;
  }
  if (key == 's')
  {
    down = 0;
  }
}



