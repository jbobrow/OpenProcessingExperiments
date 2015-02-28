
//tank sprite credit: xnaresources.com
//bullet sprite credit: d9rad from spriters-resource.com
//final game: animated bullet (?), powerups, 
//enemy spawning, explosions
//http://spritedatabase.net/files/neogeo/834/Sprite/RocketJeep.gif

SpriteObject playerChassis, playerTurret, enemyChassis, enemyTurret;
PImage grass;
boolean up, down, left, right;
Bullet[] bullets = new Bullet[15];
SpriteObject[] blockers = new SpriteObject[2];
int bVal;
float enemyCounter;

void setup()
{
  size(400, 400);
  playerChassis = new SpriteObject("blueTankChassis.png");
  playerChassis.x = 300;
  playerChassis.y = 300;
  playerTurret = new SpriteObject("blueTankTurret.png");
  playerTurret.x = 300;
  playerTurret.y = 300;
  enemyChassis = new SpriteObject("redTankChassis.png");
  enemyChassis.x = 50;
  enemyChassis.y = 200;
  enemyTurret = new SpriteObject("redTankTurret.png");
  enemyTurret.x = 50;
  enemyTurret.y = 200;
  
  for(int c = 0; c < 15; c++)
  {
    bullets[c] = new Bullet("fireSprite.png");
    bullets[c].speed = 10;
    bullets[c].x = -100;
    bullets[c].y = -100;
  }
  
  for(int c = 0; c < 2; c++)
  {
    blockers[c] = new SpriteObject("blocker.png");
    blockers[c].x = width/2;
    blockers[c].y = (height*c);
  }
  
  grass = loadImage("grass.jpg");
  bVal = 0;
  enemyCounter = 0.0;
}

void draw()
{
  image(grass, width/2, height/2, 400, 400);
  checkMovement();
  playerChassis.render();
  playerTurret.x = playerChassis.x;
  playerTurret.y = playerChassis.y;
  playerTurret.lookAt(mouseX, mouseY);
  playerTurret.render();
  
  if(enemyCounter <= 0.0)
  {
    enemyChassis.render();
    enemyTurret.lookAt(playerChassis.x, playerChassis.y);
    enemyTurret.render();
  }
  
  checkBulletCollisions();
  
  for(int c = 0; c < 2; c++)
  {
    blockers[c].render();
  }
  
  if(enemyCounter >= 0.0)
  {
    enemyCounter -= 1.0/60.0;
  }
}


class Bullet extends SpriteObject
{
  float speed;
  
  Bullet(String filename)
  {
    super(filename);
  }
    
  void update()
  {
    this.rotation = degrees(atan2(this.directionY, this.directionX));
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
  }
}

void keyPressed()
{
  if(key == 'w')
  {
    up = true;
  }
  
  if(key == 's')
  {
    down = true;
  }
  
  if(key == 'a')
  {
    left = true;
  }
  
  if(key == 'd')
  {
    right = true;
  }
}

void keyReleased()
{
  if(key == 'w')
  {
    up = false;
  }
  
  if(key == 's')
  {
    down = false;
  }
  
  if(key == 'a')
  {
    left = false;
  }
  
  if(key == 'd')
  {
    right = false;
  }
}

void mouseReleased()
{
  if(mouseButton == LEFT)
  {
    bullets[bVal].x = playerChassis.x;
    bullets[bVal].y = playerChassis.y;
    bullets[bVal].rotation = playerTurret.rotation;
    bullets[bVal].directionX = playerTurret.directionX;
    bullets[bVal].directionY = playerTurret.directionY;
    bVal++;
    bVal %= 15;
  }
}

void checkMovement()
{
  if(up && right)
  {
    playerChassis.rotation = 315;
    playerChassis.x++;
    playerChassis.y--;
  }
  
  else if(up && left)
  {
    playerChassis.rotation = 225;
    playerChassis.x--;
    playerChassis.y--;
  }
  
  else if(down && right)
  {
    playerChassis.rotation = 45;
    playerChassis.x++;
    playerChassis.y++;
  }
  
  else if(down && left)
  {
    playerChassis.rotation = 135;
    playerChassis.x--;
    playerChassis.y++;
  }
  
  else if(up)
  {
    playerChassis.rotation = 270;
    playerChassis.y--;
  }
  
  else if(down)
  {
    playerChassis.rotation = 90;
    playerChassis.y++;
  }
  
  else if(left)
  {
    playerChassis.rotation = 180;
    playerChassis.x--;
  }
  
  else if(right)
  {
    playerChassis.rotation = 0;
    playerChassis.x++;
  }
  
  for(int c = 0; c < 2; c++)
  {
    if(playerChassis.isOverlapping(blockers[c]))
    {
      if(up && right)
      {
        //done
        playerChassis.x -= 2;
        playerChassis.y += 2;
      }
      
      else if(up && left)
      {
        playerChassis.x += 2;
        playerChassis.y += 2;
      }
      
      else if(down && right)
      {
        playerChassis.x -= 2;
        playerChassis.y -= 2;
      }
      
      else if(down && left)
      {
        playerChassis.x += 2;
        playerChassis.y -= 2;
      }
      
      else if(up)
      {
        playerChassis.y += 2;
      }
      
      else if(down)
      {
        playerChassis.y -= 2;
      }
      
      else if(left)
      {
        playerChassis.x += 2;
      }
      
      else if(right)
      {
        playerChassis.x -= 2;
      }
    }
  }
}

void checkBulletCollisions()
{
  for(int c = 0; c < 15; c++)
  {
    bullets[c].update();
    bullets[c].render();
    if(bullets[c].isOverlapping(enemyChassis) && enemyCounter <= 0.0)
    {
      enemyCounter = 1.5;
      bullets[c].x = -100;
      bullets[c].y = -100;
      bullets[c].directionX = 0.0;
      bullets[c].directionY = 0.0;
    }
    
    if(bullets[c].x < -50 || bullets[c].x > width+100 
      || bullets[c].y < -50 || bullets[c].y > height+100)
    {
      bullets[c].x = -100;
      bullets[c].y = -100;
      bullets[c].directionX = 0.0;
      bullets[c].directionY = 0.0;
    }
    
    for(int d = 0; d < 2; d++)
    {
      if(bullets[c].isOverlapping(blockers[d]))
      {
        bullets[c].x = -100;
        bullets[c].y = -100;
        bullets[c].directionX = 0.0;
        bullets[c].directionY = 0.0;
      }
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
  float s = 1.0;
  float directionX = 0.0;
  float directionY = 0.0;
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
   
  boolean isOverlappingRect(float otherLeft, float otherTop, float rwidth, float rheight)
  {
   float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
     
    float otherRight = otherLeft + rwidth;
    float otherBottom = otherTop + rheight;
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
  
  void lookAt(float otherX, float otherY)
  {
    this.rotation = degrees(atan2(otherY-this.y, otherX-this.x));
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
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



