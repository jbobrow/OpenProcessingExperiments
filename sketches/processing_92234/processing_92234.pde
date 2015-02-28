
/* @pjs preload="oldman_3.png"; */
// Devon Scott-Tunkin
// Playgramming 2013

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

SideJumper oldGuy;
float left;
float right;
float up;
float down;

// half a pixel per frame gravity.
float gravity = .5;

// Y coordinate of ground for collision
float ground = 700;

void setup()
{
  size(800, 800);
  
  oldGuy = new SideJumper();
  oldGuy.image = loadImage("oldman_3.png");
  oldGuy.position = new PVector(400, ground);
  oldGuy.direction = 1;
  oldGuy.velocity = new PVector(0, 0);
  oldGuy.jumpSpeed = 10;
  oldGuy.walkSpeed = 4;
}

void draw()
{
  background(100);
  updateOldGuy();
}

void updateOldGuy()
{
  // Only apply gravity if above ground (since y positive is down we use < ground)
  if (oldGuy.position.y < ground)
  {
    oldGuy.velocity.y += gravity;
  }
  else
  {
    oldGuy.velocity.y = 0; 
  }
  
  // If on the ground and "jump" keyy is pressed set my upward velocity to the jump speed!
  if (oldGuy.position.y >= ground && up != 0)
  {
    oldGuy.velocity.y = -oldGuy.jumpSpeed;
  }
  
  // Wlak left and right. See Car example for more detail.
  oldGuy.velocity.x = oldGuy.walkSpeed * (left + right);
  
  // We check the nextPosition before actually setting the position so we can
  // not move the oldguy if he's colliding.
  PVector nextPosition = new PVector(oldGuy.position.x, oldGuy.position.y);
  nextPosition.add(oldGuy.velocity);
  
  // Check collision with edge of screen and don't move if at the edge
  float offset = 0;
  if (nextPosition.x > offset && nextPosition.x < (width - offset))
  {
    oldGuy.position.x = nextPosition.x;
  } 
  if (nextPosition.y > offset && nextPosition.y < (height - offset))
  {
    oldGuy.position.y = nextPosition.y;
  } 
  
  // See car example for more detail here.
  pushMatrix();
  
  translate(oldGuy.position.x, oldGuy.position.y);
  
  // Always scale after translate and rotate.
  // We're using oldGuy.direction because a -1 scale flips the image in that direction.
  scale(oldGuy.direction, 1);
  
  imageMode(CENTER);
  image(oldGuy.image, 0, 0);
  
  popMatrix();
}

void keyPressed()
{
  if (key == 'd')
  {
    right = 1;
    oldGuy.direction = -1;
  }
  if (key == 'a')
  {
    left = -1;
    oldGuy.direction = 1;
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





