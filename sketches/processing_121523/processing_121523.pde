
float playerX = 350;
float playerY = 350;
float playerVelocityY = 0;
float playerVelocityX = 0;
float playerSpeed = 3;
float playerJumpSpeed = -5;
float playerSize = 50;
float upKey;
float rightKey;
float downKey;
float leftKey;
boolean onGround=true;
float gravity = 0.3;
PImage BG;
BulletObject bigBullet;
float timer = 0;
BulletObject special;
float specialTimer = 2;
PImage AE2;
float timer2 = 0;

SpriteObject[] crescent = new SpriteObject[75];
boolean gameStart, gameEnd, collision;
float score = 0;

import gifAnimation.*;
SpriteObject akiha;
float health = 5;
float MAX_HEALTH = 5;
float rectWidth = 100;


void setup()
{
 
  BG = loadImage("VakihaBG.png");
  AE2 = loadImage("AE2.png");
  size(700,700);
  frameRate(60);
  
  akiha = new SpriteObject("AkihaV.png");
  
  special = new BulletObject("akihaSpecial.png");

  special.s = 0.2;
  special.x = -1000;
  special.y = -1000;
 

 
 bigBullet = new BulletObject("star.png");
  bigBullet.s = 0.02;
  bigBullet.x = -1000;
  bigBullet.y = -1000;
  
 
 
  
  for ( int i = 0; i < 75; i++)
  {
    crescent[i] = new SpriteObject("AEparticle2.png");
    crescent[i].x = random(0, 700);
    crescent[i].y = random(-3000, -500);
    crescent[i].s = 0.1;
    
}
}







void draw()
{
      if(collision)
   {
     //fill(255,0,0,100);
     //rect(0,0,800,800);
   }
   collision = false; 
   

    
  timer += 0.0167;
  timer2 += 0.0167;
  
  image(BG, 0, 0, 700, 700);
  
          if (timer2 > 7)
  {
    //image(AE2, 0, 0, 700, 700);
  }

  

  playerVelocityY += gravity;
  playerVelocityX = (rightKey - leftKey) * playerSpeed;
 
  playerY += playerVelocityY;
 playerX += playerVelocityX;


akiha.x = playerX;
akiha.y = playerY;

akiha.render();
akiha.update();

 
  if (playerY > 600)
{
  playerY -= 50;
}

if (keyPressed){
 
  if (key == 'z'){
    playerX = playerX - 30;
    playerY -= 3;
  }
 
  if (key == 'x'){
    playerX = playerX + 30;
    playerY -= 3;
  }
}

if (playerX > 670)
{
  playerX -= 30;
}

if (playerX < 0)
{
  playerX += 30;
}

if (playerY < 0)
{
  playerY += 30;
}

if (keyPressed){
 if (key == ' ')
  {
    if (onGround == true)
    {
      playerVelocityY = playerJumpSpeed;
    }
  }
}

if (timer > 1.5)
  {
   
    bigBullet.x = playerX;  
    bigBullet.y = playerY;  
    bigBullet.speed = 15;
    bigBullet.directionY = -1;
    bigBullet.directionX = 0;
    bigBullet.destroyed = false; 
    
       
    
timer = 0;
    } 
 

  
  
  specialTimer += 0.0167;
  
  if (keyPressed)
  {
    if (keyCode == UP && specialTimer > 1){
       special.x = playerX;
    special.y = playerY;
    special.speed = 8;
    special.directionY = -1;
    special.directionX = 0;
    special.destroyed = false;
  
  specialTimer = 0;
    }
  }
  

bigBullet.update();
  bigBullet.render();

    
  special.update();
  special.render();
  

     for (int i = 0; i < 75; i++)
   {
     crescent[i].render();
    
     crescent[i].y += 4;
     
   }
     
    for (int i = 0; i < 75; i++){
      
      if(bigBullet.isOverlapping(crescent[i]) && bigBullet.destroyed == false)
       {
         collision = true;
         
         bigBullet.destroyed = true;
          crescent[i].destroyed = true;
        
         
       }
 
            
       if(special.isOverlapping(crescent[i]) && special.destroyed == false)
       {
         collision = true;

         crescent[i].destroyed = true;
         special.destroyed = true;
       } 
      }
      
      if (health < 2)
      {
        fill(255,0,0);
      }
      else if (health < 4)
      {
        fill(255,200,0);
      }
      else
      {
        fill(0,255,0);
      }
      
      noStroke();
      float drawWidth = (health / MAX_HEALTH) * rectWidth;
      rect(0, 0, drawWidth, 50);
      
      stroke(0);
      noFill();
      rect(0,0, rectWidth, 50);
      
      
   } 





class BulletObject extends SpriteObject
{
  BulletObject(String filename)
  {
    super(filename);
  }
  
  void update()
  {
    this.y += directionY * speed;
    this.x += directionX * speed;
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
  boolean destroyed = false;
     
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
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
     
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
       
    if (loaded && destroyed == false)
    {
      imageMode(CORNER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}


