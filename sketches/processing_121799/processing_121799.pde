
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
boolean wPressed = false;

PImage AE2;
PFont chalk;
PFont sans;
PImage Vakiha;


SpriteObject[] crescent = new SpriteObject[50];
SpriteObject[] bolt = new SpriteObject[35];
boolean gameStart, gameEnd, collision; 
boolean gamemenu = true;

SpriteObject akiha;
float health = 10;
float MAX_HEALTH = 10;
float sHealth = 20;
float MAX_SHEALTH = 20;
float rectWidth = 100;

SpriteObject shield;
SpriteObject aura;

void setup()
{
 
  BG = loadImage("BG.png");
  AE2 = loadImage("AE2.png");
  Vakiha = loadImage("VakihaBG.png");
  size(900,600);
  frameRate(60);
  
  akiha = new SpriteObject("AkihaV.png");
  
  shield = new SpriteObject("fireShield.png");
  
  aura = new SpriteObject("fireAura.png");
 
  
 chalk = createFont("Chalkduster", 64);
 sans = createFont("SanSerif", 64);
  
  for ( int i = 0; i < 50; i++)
  {
    crescent[i] = new SpriteObject("AEParticle2.png");
    crescent[i].x = random(1000, 3000);
    crescent[i].y = random(0, 650);
    crescent[i].s = 0.125;
    }
    
    for (int b = 0; b < 35; b++)
    {
      bolt[b] = new SpriteObject("bolt.png");
      bolt[b].x = random(1000, 3000);
      bolt[b].y = random(0, 650);
      bolt[b].s = 0.3;
    }
}







void draw()
{
  timer += 0.0167;
  image(BG, 0, 0, 900, 600);

  akiha.s = 0.7;

    

if (timer > 12.5)
  {
    background(0);
    fill(255, random(255), 0);
    textFont(chalk);
    textSize(25);
    text("Warning: High energy levels detected", random(300, 325), random(440,450));
  }
  
  if (timer > 13.5)
  {
    background(0);
    fill(255, random(255), 0);
    textFont(chalk);
    textSize(25);
    text("Brace yourself!", random(350, 370), random(410,420));
    text("Archetype:Earth--incoming!", random(350, 370), random(450, 460));
  }
  
  if (timer > 14.5){
    
    image(AE2, 0, 0, 900, 600);
  }

  playerVelocityY += gravity;
  playerVelocityX = (rightKey - leftKey) * playerSpeed;
 
  playerY += playerVelocityY;
 playerX += playerVelocityX;


if(akiha.x + akiha.img.width < 0) 
   {
    akiha.x = 0 - akiha.img.height;
    playerVelocityX = 0;
   }
   
akiha.x = playerX;

if(akiha.y + akiha.img.height > 600) 
   {
    akiha.y = 600 - akiha.img.height;
    playerVelocityY = 0;
   }
   
akiha.y = playerY;


akiha.update();
akiha.render();



 
/* if (playerY > 570)
{
  playerY = 565;
} */

//------------------------
if (keyPressed){
 
  if (key == 'q'){
    
    playerY += 30;
    playerVelocityY = 0;
  }
 
  if (key == 'e'){
   
    playerY -= 30;
    playerVelocityY = 0;
  }
}

//------------------------

/* if (playerX > 870)
{
  playerX -= 30;
} */

/*if (playerX < 0)
{
  playerX += 30;
} */

/*if (playerY < 0)
{
  playerY += 30;
} */


if (keyPressed){
 if (key == ' ')
  {
    if (onGround == true)
    {
      playerVelocityY = playerJumpSpeed;
    }
  }
}

       
    

  for (int i = 0; i < 50; i++)
   {
    crescent[i].render();
    crescent[i].x -= 4;
   }

   
   if (timer > 14.5){
     
   for (int b = 0; b < 35; b++)
   {
     bolt[b].render();
     bolt[b].x -= 17.5;
   }
   }

   
   for (int i = 0; i < 50; i++){
     
     if (wPressed == true){
     
     if (shield.isOverlapping(crescent[i]) && crescent[i].destroyed == false)
     {
       crescent[i].destroyed = true;
       shield.destroyed = true;
       if (sHealth >= 0)
       {
       sHealth -= 0.75;
       }
       if (sHealth <= 0)
       {
         sHealth -= 0;
       }
     }
     shield.destroyed = false;
     }
   }
   
   //--------------------------
   
   for (int b = 0; b < 35; b++){
     
     if (wPressed == true){
     
     if (shield.isOverlapping(bolt[b]) && bolt[b].destroyed == false)
     {
       bolt[b].destroyed = true;
       shield.destroyed = true;
       if (sHealth >= 0)
       {
       sHealth -= 2.5;
       }
        if (sHealth <= 0)
       {
         sHealth -= 0;
       }
     }
     shield.destroyed = false;
     }
   }
   
   //---------------------------
   
   for (int i = 0; i < 50; i++){
     
     if (wPressed == true){
     
    if (aura.isOverlapping(crescent[i]) && crescent[i].destroyed == false)
    {
      crescent[i].destroyed = true;
      aura.destroyed = true;
      if (sHealth >= 0)
      {
      sHealth -= 0.75;
      }
       if (sHealth <= 0)
       {
         sHealth -= 0;
       }
    }
    aura.destroyed = false;
     }
   }
   
   //------------------------------
   
   for (int b = 0; b < 35; b++){
     
     if (wPressed == true){
     
     if (aura.isOverlapping(bolt[b]) && bolt[b].destroyed == false)
     {
       bolt[b].destroyed = true;
       aura.destroyed = true;
       if (sHealth >= 0)
       {
       sHealth -= 2.5;
       }
        if (sHealth <= 0)
       {
         sHealth -= 0;
       }
     }
     aura.destroyed = false;
     }
   }
   
   //-------------------------------
     for (int i = 0; i < 50; i++){
     
     if (akiha.isOverlapping(crescent[i]) && crescent[i].destroyed == false)
     {
        crescent[i].destroyed = true;
       
     fill(255,0,0,100);
     rect(0,0,900, 600);
     health -= 1;
     }
   }
   
   //------------------------------
   for (int b = 0; b < 35; b++){
   
   if (akiha.isOverlapping(bolt[b]) && bolt[b].destroyed == false)
   {
     bolt[b].destroyed = true;
     fill(255,0,0,100);
     rect(0,0,900, 600);
     health -= 2;
   }
   }
   
   //-----------------------------
   
   if (sHealth <= 0 && aura.destroyed == false)
   {
     aura.destroyed = true;
   }
   
   if (sHealth <= 0 && shield.destroyed == false)
   {
     shield.destroyed = true;
   }
   
   //-----------------------------
     
   
   if (health <= 0)
   {
     background(0);
     fill(255,0,0);
  textFont(sans);
  textSize(13);
   text("DEFEAT.", 150, 100);
   text("Hello? You there? Oh good, looks like you're still alive'n kicking.", 150, 125);
   text("Unfortunately, it seems Arcueid may have been a bit too much for you to handle...", 150, 150);
   text("What's that? You want to challenge her AGAIN?", 150, 200);
   text(".", 150, 160);
   text(".", 150, 170);
   text(".", 150, 180);
   text("Meh, fine. Whatever floats your boat, I guess.", 150, 225);
   text("Press R to restar-", 150, 250);
   text("...Oh wait, looks like the game restart function's bugging up...", 150, 275);
  text("This is rather embarrassing, If I do say so myself ( ﾟ_ゝﾟ)", 150, 300); 
  text(".", 150, 325);
  text(".", 150, 350);
  text(".", 150, 375);
  text(".", 150, 400);
  text(".", 150, 425);
  text(".", 150, 450); 
  text("ERRR, AS UNFORSEEN CIRCUMSTANCES HAVE TAKEN PLACE,", 150, 475);
  text("I BID YOU FAREWELL FOR NOW AND WISH YOU THE BEST IN YOUR FUTURE ENDEAVORS.", 150, 500);
  text("AND BEFORE I FORGET: MAY THE POWER OF PAGE REFRESH BE WITH YOU.", 150, 525);
  timer = 0;
   }
   
   if (timer > 18)
   {
     image(Vakiha, 0, 0, 900, 600);
     textFont(sans);
     textSize(25);
     fill(255);
   text("VICTORY.", 500, 100);
   textSize(14);
   text("Congratulations, you've managed to successfully fend off Arcueid's onslaught!", 335, 125);
   
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
      float drawWidth = (health / MAX_HEALTH) * 150;
      rect(0, 0, drawWidth, 50);
      
      stroke(0);
      noFill();
      rect(0,0, 150, 50);
      
      //-----------------------------
      if (sHealth <= 0)
      {
        noFill();
      }
      else if (sHealth < 6)
      {
        fill(0, 236, 255);
      }
      else if (sHealth < 14)
      {
        fill(0, 155, 255);
      }
     
     else if (sHealth <= 20)
      {
        fill(25, 100 , 255);
      }
       
      
      noStroke();
      float drawWidth2 = (sHealth / MAX_SHEALTH) * 400;
      rect(500, 0, drawWidth2, 50);
      
      stroke(0);
      noFill();
      rect(500, 0, 400, 50);
      
  
     
  
  if (wPressed == true)
  {
    
      
shield.render();


aura.render();
  
      shield.x = akiha.x - 95;
shield.y = akiha.y - 125;
shield.s = 0.3;
      
      aura.x = akiha.x - 105;
      aura.y = akiha.y - 25;
      aura.s = 0.6;
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
  if (key == 'w')
  {
    wPressed = false;
  }
  
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

   if (key == 'w')
   {
     wPressed = true;
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


