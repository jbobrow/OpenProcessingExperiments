
/* @pjs preload="FatStick.png, FatStickBackground.png"; */

  PImage img;
  float angle;

class SideJumper
{
  PImage image;
  PVector position;
  float direction;
  PVector velocity;
  float jumpSpeed;
  float walkSpeed;

}
 
// GLOBAL VARIABLES
 
SideJumper FatStick;
float left;
float right;
float up;
float down;
 
// half a pixel per frame gravity.
float gravity = .3;
 
// Y coordinate of ground for collision
float ground = 450;
 
void setup()
{
  size(700, 700);
   
  FatStick = new SideJumper();
  FatStick.image = loadImage("FatStick.png");
  FatStick.position = new PVector(400, ground);
  FatStick.direction = 1;
  FatStick.velocity = new PVector(0, 0);
  FatStick.jumpSpeed = 10;
  FatStick.walkSpeed = 4;
  
  img = loadImage("FatStickBackground.png");
}
 
void draw()
{
  imageMode(CORNER);
  image(img, 0, 0);
  updateFatStick();
}
 
void updateFatStick()
{
  // Only apply gravity if above ground (since y positive is down we use < ground)
  if (FatStick.position.y < ground)
  {
    FatStick.velocity.y += gravity;
  }
  else
  {
    FatStick.velocity.y = 0;
  }
   
  // If on the ground and "jump" keyy is pressed set my upward velocity to the jump speed!
  if (FatStick.position.y >= ground && up != 0)
  {
    FatStick.velocity.y = -FatStick.jumpSpeed;
  }
   
  // Wlak left and right. See Car example for more detail.
  FatStick.velocity.x = FatStick.walkSpeed * (left + right);
   
  // We check the nextPosition before actually setting the position so we can
  // not move the FatStick if he's colliding.
  PVector nextPosition = new PVector(FatStick.position.x, FatStick.position.y);
  nextPosition.add(FatStick.velocity);
   
  // Check collision with edge of screen and don't move if at the edge
  float offset = 0;
  if (nextPosition.x > offset && nextPosition.x < (width - offset))
  {
    FatStick.position.x = nextPosition.x;
  }
  if (nextPosition.y > offset && nextPosition.y < (height - offset))
  {
    FatStick.position.y = nextPosition.y;
  }
   
  // See car example for more detail here.
  pushMatrix();
   
  translate(FatStick.position.x, FatStick.position.y);
  
  rotate( random(0, QUARTER_PI/4*(right + left)));
  rotate( random(0, QUARTER_PI/-4*(right + left)));
  // Always scale after translate and rotate.
  // We're using FatStick.direction because a -1 scale flips the image in that direction.
  scale(FatStick.direction, 1);
   
  imageMode(CENTER);
  image(FatStick.image, 0, 0);
   
  popMatrix();
}
 
void keyPressed()
{
  if (key == 'd')
  {
    right = 1;
    FatStick.direction = 1;

  }
  if (key == 'a')
  {
    left = -1;
    FatStick.direction = -1;
  }
  if (key == 'w')
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
  if (key == 'w')
  {
    up = 0;
  }
  if (key == 's')
  {
    down = 0;
  }
}



