

class Walk
{
  PImage image;
  PVector position;
  float direction;
  PVector velocity;
  float jumpSpeed;
  float walkSpeed;
}
  
Walk man;
float left;
float right;
float up;
float down;
float gravity = .5;
float ground = 300;
 
void setup()
{
  size(800, 400);
   
  man = new Walk();
  man.image = loadImage("man.png");
  man.position = new PVector(400, ground);
  man.direction = 1;
  man.velocity = new PVector(0, 0);
  man.jumpSpeed = 10;
  man.walkSpeed = 4;
}
 
void draw()
{
  background(#fff0ac);
  updateman();
}
 
void updateman()
{
  if (man.position.y < ground)
  {
    man.velocity.y += gravity;
  }
  else
  {
    man.velocity.y = 0;
  }
   
  if (man.position.y >= ground && up != 0)
  {
    man.velocity.y = -man.jumpSpeed;
  }
   
  man.velocity.x = man.walkSpeed * (left + right);
   
  PVector nextPosition = new PVector(man.position.x, man.position.y);
  nextPosition.add(man.velocity);
   
  float offset = 0;
  if (nextPosition.x > offset && nextPosition.x < (width - offset))
  {
    man.position.x = nextPosition.x;
  }
  if (nextPosition.y > offset && nextPosition.y < (height - offset))
  {
    man.position.y = nextPosition.y;
  }
   
  pushMatrix();
  translate(man.position.x, man.position.y);
  scale(man.direction, 1);
  imageMode(CENTER);
  image(man.image, 0, 0);
  popMatrix();
}
 
void keyPressed()
{
  if (key == 'd')
  {
    right = 1;
    man.direction = -1;
  }
  if (key == 'a')
  {
    left = -1;
    man.direction = 1;
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



