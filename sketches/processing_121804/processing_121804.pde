
PImage collisionImage;
PImage displayImage;
PImage character;
 
float playerX = 40;
float playerY = 550;
float playerVelocityY = 0;
float playerVelocityX = 0;
float playerSpeed = 3;
float playerJumpSpeed = -5.5;
float playerSize = 1;
float upKey;
float rightKey;
float downKey;
float leftKey;
boolean onGround;
float gravity = .18;
float jumpTimer = 0;
float gravityTimer = 0;

int gameState = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;

SpriteObject face;
SpriteObject goal;
SpriteObject laser1;
SpriteObject laser2;
SpriteObject laser3;
SpriteObject laser4;
SpriteObject laser5;
SpriteObject laser6;
SpriteObject laser7;
SpriteObject laser8;
SpriteObject laser9;

void setup()
{
  size(600, 600);
  collisionImage = requestImage("levelcollisions.png");
  displayImage = requestImage("leveldisplay.png");
  goal = new SpriteObject("goal.png");
  
  laser1 = new SpriteObject("laser1.png");
  laser1.x = ((height/2) + 1);
  laser1.y = ((width/2) + 70);
  
  laser2 = new SpriteObject("laser2.png");
  laser2.x = (116);
  laser2.y = (108);
  
  laser3 = new SpriteObject("laser3.png");
  laser3.x = (570);
  laser3.y = (556);
  
  laser4 = new SpriteObject("laser4.png");
  laser4.x = (484);
  laser4.y = (493);
  
  laser5 = new SpriteObject("laser5.png");
  laser5.x = (30);
  laser5.y = (45);
  
  laser6 = new SpriteObject("laser6.png");
  laser6.x = (254);
  laser6.y = (212);
  
  laser7 = new SpriteObject("laser7.png");
  laser7.x = (395);
  laser7.y = (287);
  
  laser8 = new SpriteObject("laser8.png");
  laser8.x = (555);
  laser8.y = (108);
  
  laser9 = new SpriteObject("laser9.png");
  laser9.x = (45);
  laser9.y = (394);
  
  face = new SpriteObject("player.png");
  face.x = playerX;
  face.y = playerY;
  face.s = playerSize;
   
}

void draw()
{
  fill(0);
 
  playerVelocityY += gravity;
  playerVelocityX = (rightKey - leftKey) * playerSpeed;
  float nextY = playerY + playerVelocityY;
  float nextX = playerX + playerVelocityX;
   
  boolean tempOnGround = false;
  if (collisionImage.width > 0)
  {
    imageMode(CORNER);
    image(collisionImage, 0, 0, width, height);
    if (displayImage.width > 0)
    {
      image(displayImage, 0, 0, width, height);
    }
    collisionImage.loadPixels();
    for (int y = 0; y < collisionImage.height; y += 1)
    {
      for (int x = 0; x < collisionImage.width ; x += 1)
      {
        color pixelColor = collisionImage.pixels[y*collisionImage.width+x];
        float scaleDiff = width / collisionImage.width; // 500 / 50 = 10
        int xx = (int)(nextX / scaleDiff);
        int yy = (int)(playerY / scaleDiff);
        int platformX = x * (int)scaleDiff;
        int platformY = y * (int)scaleDiff;
        if (xx == x &&  yy == y && red(pixelColor) < 255)
        {
          // moving left and character is currently on the right side of the wall
          if (playerVelocityX < 0 && playerX >= platformX)
          {
            playerVelocityX = 0;
          }
          // moving right and character is currently on the left side of the wall
          if (playerVelocityX > 0 && playerX < platformX)
          {
            playerVelocityX = 0;
          }
        }
         
        xx = (int)(playerX / scaleDiff);
        yy = (int)(nextY / scaleDiff);
        if (xx == x &&  yy == y && red(pixelColor) < 255)
        {
          fill(255, 0, 0);
           
           // moving up and character is currently on the bottom side of the wall
          if (playerVelocityY < 0  && playerY >= platformY)
          {
            playerVelocityY = 0;
          }
          // moving down and character is currently on the top side of the wall
           if (playerVelocityY > 0 && playerY < platformY)
          {
            playerVelocityY = 0;
            tempOnGround = true;
          }
        }
      }
    }
  }
   
  playerX += playerVelocityX;
  playerY += playerVelocityY;
  face.x = playerX;
  face.y = playerY;
  face.render();
  onGround = tempOnGround;
  
  goal.x = (width/2);
  goal.y = (height/2);
  goal.render();
  
  laser1.render();
  laser2.render();
  laser3.render();
  laser4.render();
  laser5.render();
  laser6.render();
  laser7.render();
  laser8.render();
  laser9.render();
  
  if (goal.isOverlapping(face) == true)
    {
      gameState = 2;
    }
    
  if (laser1.isOverlapping(face) == true)
    {
      gameState = 1;
    }
  
  if (laser2.isOverlapping(face) == true)
    {
      gameState = 1;
    }
  
  if (laser3.isOverlapping(face) == true)
    {
      gameState = 1;
    }
  
  if (laser4.isOverlapping(face) == true)
    {
      gameState = 1;
    }
  
  if (laser5.isOverlapping(face) == true)
    {
      gameState = 1;
    }
  
  if (laser6.isOverlapping(face) == true)
    {
      gameState = 1;
    }
  
  if (laser7.isOverlapping(face) == true)
    {
      gameState = 1;
    }
  
  if (laser8.isOverlapping(face) == true)
    {
      gameState = 1;
    }
  
  if (laser9.isOverlapping(face) == true)
    {
      gameState = 1;
    }
  
  if (gameState == WIN_STATE)
  {
    background(255, 255, 255);
    fill(0);
    textSize(70);
    text("YOU WON!", 100, 60);
    face.s = 0;
    face.speed = 0;
  }
  
  if (gameState == GAMEOVER_STATE)
  {
    background(255, 0, 0);
    fill(0);
    textSize(70);
    text("GAME OVER", 90, 60);
    face.s = 0;
    face.speed = 0;
  }
}

 
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 0;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 0;
    }
    if (keyCode == UP)
    {
      upKey = 0;
    }
    if (keyCode == DOWN)
    {
      downKey = 0;
    }
  }
}
  
void keyPressed()
{
  if (key == ' ')
  {
    gravityTimer += .2;
    
    if (onGround == true)
    {
      jumpTimer += .1;
      
      if (jumpTimer >= .5)
      {
        playerVelocityY = playerJumpSpeed;
        jumpTimer = 0;
      }
    }
    if (gravityTimer > 5 && gravityTimer < 6.5)
      {
        gravity = -.18;
        if (gravityTimer >= 6)
        {
          gravity = .18;
          gravityTimer = 0;
        }
      }
  }
    
    
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 1;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 1;
    }
    if (keyCode == UP)
    {
      upKey = 1;
    }
    if (keyCode == DOWN)
    {
      downKey = 1;
    }
  }
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
      
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
     
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s))
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
     
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
        
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s);
        
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
   
  void update()
  { 
  }
    
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
        
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}





