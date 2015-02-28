
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
float gravity = 0.4;
PImage BG;
BulletObject bigBullet;
float timer = 0;
BulletObject special;
float specialTimer = 2;
PImage AE2;
float timer2 = 0;
PFont chalk;


SpriteObject[] crescent = new SpriteObject[50];
boolean gameStart, gameEnd, collision;
float score = 0;

SpriteObject akiha;
float health = 10;
float MAX_HEALTH = 10;
float rectWidth = 100;

SpriteObject shield;
SpriteObject aura;

void setup()
{
 
  BG = loadImage("BG.png");
  AE2 = loadImage("AE2.png");
  size(900,600);
  frameRate(60);
  
  akiha = new SpriteObject("AkihaV.png");
  
  shield = new SpriteObject("fireShield.png");
  
  aura = new SpriteObject("fireAura.png");
 
  
  special = new BulletObject("akihaSpecial.png");

  special.s = 0.2;
  special.x = -1000;
  special.y = -1000;
 

 
 bigBullet = new BulletObject("star.png");
  bigBullet.s = 0.02;
  bigBullet.x = -1000;
  bigBullet.y = -1000;
  
 
 
  
  for ( int i = 0; i < 50; i++)
  {
    crescent[i] = new SpriteObject("AEParticle2.png");
    crescent[i].x = random(1000, 3000);
    crescent[i].y = random(0, 650);
    crescent[i].s = 0.125;
    
    chalk = createFont("Chalkduster", 64);
    
}
}







void draw()
{
      if(collision)
   {
     fill(255,0,0,100);
     rect(0,0,800,800);
   }
   collision = false; 
   
 
   
akiha.s = 0.7;

    
  timer += 0.0167;
  timer2 += 0.0167;
  
  image(BG, 0, 0, 900, 600);
  
          if (timer2 > 12.5)
  {
    background(0);
    fill(0, 255, 223);
    textFont(chalk);
    textSize(20);
    text("Warning: High energy levels detected", random(440, 450), random(440,450));
  }
  
  if (timer2 > 14.5){
    
    image(AE2, 0, 0, 900, 600);
  }

  

  playerVelocityY += gravity;
  playerVelocityX = (rightKey - leftKey) * playerSpeed;
 
  playerY += playerVelocityY;
 playerX += playerVelocityX;


akiha.x = playerX;
akiha.y = playerY;

akiha.update();
akiha.render();


 
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

/*if (timer > 1.5)
  {
   
    bigBullet.x = playerX;  
    bigBullet.y = playerY;  
    bigBullet.speed = 15;
    bigBullet.directionY = 0;
    bigBullet.directionX = 1;
    bigBullet.destroyed = false; 
    
       
    
timer = 0;
    } */
 

  
  
  

bigBullet.update();
  bigBullet.render();

    
  special.update();
  special.render();
  

     for (int i = 0; i < 50; i++)
   {
     crescent[i].render();
    
     crescent[i].x -= 4;
     
   }
   

   
   for (int i = 0; i < 50; i++){
     
     if (shield.isOverlapping(crescent[i]) && crescent[i].destroyed == false)
     {
       crescent[i].destroyed = true;
       shield.destroyed = true;
     }
     shield.destroyed = false;
   }
   
   for (int i = 0; i < 50; i++){
     
    if (aura.isOverlapping(crescent[i]) && crescent[i].destroyed == false)
    {
      crescent[i].destroyed = true;
      aura.destroyed = true;
    }
    aura.destroyed = false;
   }
     for (int i = 0; i < 50; i++){
     
     if (akiha.isOverlapping(crescent[i]) && crescent[i].destroyed == false)
     {
        crescent[i].destroyed = true;
       
     fill(255,0,0,100);
     rect(0,0,800,800);
     }
   }
   
      
      if (health < 4)
      {
        fill(255,0,0);
      }
      else if (health < 7)
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
      
     
  
  if (keyPressed)
  {
    if (keyCode == UP){
       shield.update();
shield.render();

aura.update();
aura.render();
  
      shield.x = playerX - 80;
shield.y = playerY - 105;
shield.s = 0.25;
      
      aura.x = playerX - 90;
      aura.y = playerY - 25;
      aura.s = 0.5;
  
  specialTimer = 0;
    }
    
   
  }
      
    
      
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


