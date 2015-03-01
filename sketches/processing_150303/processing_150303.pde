
class SideJumper
{
  PImage image;
  PVector position;
  float direction;
  PVector velocity;
  float jumpSpeed;
  float walkSpeed;
}
   
   
SideJumper blobDude;
float left;
float right;
float up;
float down;
   
float gravity = .5;
   
float ground = 700;
   
void setup()
{
  size(800, 800);
  
     
  blobDude = new SideJumper();
  blobDude.image = loadImage("blobDude.png");
  blobDude.position = new PVector(400, ground);
  blobDude.direction = 1;
  blobDude.velocity = new PVector(0, 0);
  blobDude.jumpSpeed = 10;
  blobDude.walkSpeed = 2;
}
   
void draw()
{
  background(255);
  updateblobDude();
}
   
void updateblobDude()
{
   
  if (blobDude.position.y < ground)
  {
    blobDude.velocity.y += gravity;
  }
  else
  {
    blobDude.velocity.y = 0;
  }
     
  if (blobDude.position.y >= ground && up != 0)
  {
    blobDude.velocity.y = -blobDude.jumpSpeed;
  }
     
  blobDude.velocity.x = blobDude.walkSpeed * (left + right);
     
  PVector nextPosition = new PVector(blobDude.position.x, blobDude.position.y);
  nextPosition.add(blobDude.velocity);
     
  float offset = 0;
  if (nextPosition.x > offset && nextPosition.x < (width - offset))
  {
    blobDude.position.x = nextPosition.x;
  }
  if (nextPosition.y > offset && nextPosition.y < (height - offset))
  {
    blobDude.position.y = nextPosition.y;
  }
     
  pushMatrix();
     
  translate(blobDude.position.x, blobDude.position.y);
     
  scale(blobDude.direction, 1);
     
  imageMode(CENTER);
  image(blobDude.image, 0, 0);
     
  popMatrix();
}
   
void keyPressed()
{
  if (key == 'd')
  {
    right = 1;
    blobDude.direction = -1;
  }
  if (key == 'a')
  {
    left = -1;
    blobDude.direction = 1;
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




