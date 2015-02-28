
/* @pjs font="Chalkduster-48.vlw"; preload="FatStick.png, FatStickBackground.png, Snickers.png, catfood.png"; */

  PImage img;
  PImage snickers;
  float angle;
  float snickerSpeed;
  float time = 0;
  float snickersTimer = 3;
  float x;
  PImage catfood;
  float catfoodSpeed;
  float catfoodTimer = 5;
  boolean imagesCollided = false;
  PFont font;
  int score = 0;
  
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
float gravity = .2;
 
// Y coordinate of ground for collision
float ground = 450;
 
void setup()
{
  size(700, 700);
  
  catfood = loadImage("catfood.png");
  snickers = loadImage("Snickers.png"); 
  FatStick = new SideJumper();
  FatStick.image = loadImage("FatStick.png");
  FatStick.position = new PVector(400, ground);
  FatStick.direction = 1;
  FatStick.velocity = new PVector(0, 0);
  FatStick.jumpSpeed = 10;
  FatStick.walkSpeed = 4;

  img = loadImage("FatStickBackground.png");
  
  font = loadFont("Chalkduster-48.vlw");
  textFont(font, 32);
}
 
void draw()
{
  time += 0.0167;
  snickersTimer -= 0.0167;
  catfoodTimer -= 0.0167;
  
  imageMode(CORNER);
  image(img, 0, 0);
  updateFatStick();
  
  fill(0);
  text("Score: " + score, width/2-50, 40);

  
 

    if(imagesCollided(FatStick.image, FatStick.position, snickers, new PVector(snickerSpeed, 500)))
  {
    fill(0, 255, 0);
    rect(0, 0, width, height);
    snickerSpeed = 7500;
    score += 50;
  }else {
      if (snickersTimer <= 0){
     imageMode(CENTER);
  image(snickers, snickerSpeed, 500);
  snickerSpeed = snickerSpeed +9;
  if (snickerSpeed >= 750){
    snickersTimer = random(1,2);
    snickerSpeed = 0;
   }
      }
  }
  

    if(imagesCollided(FatStick.image, FatStick.position, catfood, new PVector(catfoodSpeed, 500)))
  {
    fill(255, 0, 0);
    rect(0, 0, width, height);
    catfoodSpeed = 800;
    score -= 10;
  }else {
      if (catfoodTimer <= 0){
     imageMode(CENTER);
    image(catfood, catfoodSpeed, 500);
  catfoodSpeed = catfoodSpeed +5;
  if (catfoodSpeed >= 750){
    catfoodTimer = random(1,5);
    catfoodSpeed = 0;
   }
  }
  }
  
  if (time >= 20){
    fill(26, 153, 255);
    text("Complete!", width/2-50, height/2-150);
  }
    
}
  
boolean imagesCollided(PImage image1, PVector position1, PImage image2, PVector position2)
{
  boolean collided = true;
   
  float left1 = position1.x - image1.width / 2;
  float right1 = position1.x + image1.width / 2;
  float top1 = position1.y - image1.height / 2;
  float bottom1 = position1.y + image1.height / 2;
   
  float left2 = position2.x - image2.width / 2;
  float right2 = position2.x + image2.width / 2;
  float top2 = position2.y - image2.height / 2;
  float bottom2 = position2.y + image2.height / 2;
  
  if (left2 > right1 || right2 < left1 || top2 > bottom1 || bottom2 < top1)
  {
    collided = false;
  }
 
  return collided;
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
  float offset = 140;
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


