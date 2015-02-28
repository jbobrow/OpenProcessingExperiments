
/* @pjs preload="mansheet.png"; */
PImage background;
PImage box;
PImage win;
PImage lost;

String w = "CONGRATULATIONS YOU SAVED THE WORLD";
String l = "EARTH HAS BEEN DESTROYED";
float textmove = 0;
float textmoveX = 0;
float textmoveY = 0;




Man myMan;
Boss myBoss;
  

boolean forwardKeyPressed = false;
boolean backwardKeyPressed = false;
boolean spaceKeyPressed = false;


int bulletCount = 10;
Bullet[] bullets = new Bullet[bulletCount];
int bulletIndex = 0;
 
void setup()
{
  size(800, 800);
  background = requestImage("background.png");
  box = requestImage("Barrel.png");
  win = requestImage("youwin.jpg");
  lost = requestImage("youlost.jpg");
    
  myMan = new Man();
  myBoss = new Boss();
    
  myMan.x = 100;
  myMan.y = 400;
    
  myMan.directionX = 0;
  myMan.directionY = 1;
    
  myMan.speed = 3; 
    
  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i] = new Bullet();
    bullets[i].x = -1000;
    bullets[i].y = -1000;
  }
}
  
void draw()
{

  image(background, 0, 0, 800, 800);
 
  myMan.draw();
  myBoss.draw();
  
  
  if (myMan.hp < 45)
  {
    fill(255, 0, 0);
  }
  else if (myMan.hp < 75)
  {
    fill(255, 255, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
   if (myMan.hp < 45)
  {
    fill(255, 0, 0);
  }
  else if (myMan.hp < 75)
  {
    fill(255, 255, 0);
  }
  else
  {
    fill(0, 255, 0);
  }


   
  // player hp bar
  noStroke();
  rect(myMan.x - 40, myMan.y + 30, 80 * (myMan.hp / 100), 20);
   
  noFill();
  stroke(255);
  rect(myMan.x - 40, myMan.y + 30, 80, 20);
   
  fill(255);
   
  // boss hp bar
  fill(0, 255, 0);
  rect(myBoss.x, myBoss.y + 100, 40 * (myBoss.hp / 100), 20);
   
  noFill();
  stroke(255);
  rect(myBoss.x, myBoss.y + 100, 80, 20);
   
  fill(255);
  
  if (myMan.hp <= 0)
  {
   image(lost, 0, 0, width, height);
   textAlign(LEFT, TOP);
   fill(255, 0, 0);
   float nextY = textmoveY + 2;
   textSize(40);
   text(l, textmoveX, textmoveY, 1000, 200);
   textmoveY = nextY;
   if (textmoveY >= height - 50)
   {
     textmoveY = 0;
   }

  }
  
  if (myBoss.hp <= 0)
  {
    image(win, 0, 0, width, height);
    textAlign(CENTER, TOP);
    fill(0, 255, 0);
    float nextY = textmoveY + 2;
    textSize(40);
    text(w, textmoveX, textmoveY, width, height);
    textmoveY = nextY;
    if (textmoveY >= height - 50)
    {
      textmoveY = 0;
    }
  }
}
  
  
void keyPressed()
{
    if (keyCode == UP)
    {
      forwardKeyPressed = true;
      myMan.sprite.setAnimation(0, 2, true);
      spaceKeyPressed = true;
    }
    if (keyCode == DOWN)
    {
      backwardKeyPressed = true;
      myMan.sprite.setAnimation(0, 2, true);
      spaceKeyPressed = true;
    }
    
     
}
  
void keyReleased()
{
    
    if (keyCode == UP)
    {
      forwardKeyPressed = false;
      myMan.sprite.setAnimation(0, 0, true);
      spaceKeyPressed = false;
    }
    if (keyCode == DOWN)
    {
      backwardKeyPressed = false;
      myMan.sprite.setAnimation(0, 0, true);
      spaceKeyPressed = false;
    }
     
    if (keyCode == ' ')
  {
    bullets[bulletIndex].x = myMan.x;
    bullets[bulletIndex].y = myMan.y;
    bullets[bulletIndex].speed = 10;
    bullets[bulletIndex].directionX = myMan.directionX;
    bullets[bulletIndex].directionY = myMan.directionY;
    bulletIndex += 1;
    if (bulletIndex >= bulletCount)
    {
      bulletIndex = 0;
    }
  }
}
 
class AnimatedSprite
{
  int frameRow;
  int frameColumn;
  int frameWidth;
  int frameHeight;
  int startFrame;
  int endFrame;
  float currentFrame;
  boolean loop = true;
  float frameSpeed = 12.0;
  PImage spriteSheet;
  PImage img;
   
  AnimatedSprite(String filename, int widthOfOneFrame, int heightOfOneFrame)
  {
    this.spriteSheet = requestImage(filename);
    this.frameWidth = widthOfOneFrame;
    this.frameHeight = heightOfOneFrame;
  }
   
  void setAnimation(int start, int end, boolean looping)
  {
    if (start != this.startFrame || end != this.endFrame)
    {
      this.startFrame = start;
      this.endFrame = end;
      this.currentFrame = this.startFrame;
    } 
       
    this.loop = looping;
  }
   
  void draw()
  {
    if (this.spriteSheet.width <= 0)
    {
      return;
    }
     
    this.currentFrame += (this.frameSpeed / frameRate);
    if ((int)this.currentFrame > this.endFrame)
    {
      if (this.loop == true)
      {
        this.currentFrame = this.startFrame;
      }
      else
      {
        this.currentFrame = this.endFrame;
      }
    }
     
    int colCount = this.spriteSheet.width / this.frameWidth;
    this.frameColumn = (int)this.currentFrame ;
    if (colCount > 0)
    {
      this.frameColumn =(int)((int)this.currentFrame % colCount);
      this.frameRow = (int)(this.currentFrame / colCount);
    }
    this.img = this.spriteSheet.get(
      this.frameColumn * this.frameWidth,
      this.frameRow * this.frameHeight,
      this.frameWidth,
      this.frameHeight);
       
    image(this.img, 0, 0, frameWidth, frameHeight);
  }
   
}
  
 
class Man
{
  float x = 0.0;
  float y = 0.0;
  float rotation = 0.0;
  float speed = 10;
  float directionX;
  float directionY;
  float s = 2.0;
  float hp = 100;
   
  AnimatedSprite sprite;
   
  Man()
  {
    this.sprite = new AnimatedSprite("mansheet.png", 60, 61);
  }
  
  void lookAt (float otherX, float otherY)
  {
    this.rotation = degrees(atan2(otherY-this.y, otherX-this.x));
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
  }


  void draw()
  {
    if (forwardKeyPressed)
    {
      this.y -= this.directionY * this.speed;
    }
    
    if (backwardKeyPressed)
    {
     this.y += this.directionY * this.speed;
    }
    
    float distancetoshot = dist(this.x, this.y, myBoss.shot.x, myBoss.shot.y);
      if (distancetoshot < 50)
      {
        this.hp -= 1;
        tint(255, 0, 0);
      }
    
 
    imageMode(CENTER);
    pushMatrix();
    translate(this.x, this.y);
    rotate(radians(this.rotation));
     
    // draw and animate the animated sprite
    this.sprite.draw();
     
    popMatrix();
     
    imageMode(CORNER);
    
    if (this.y >= height - 30)
    {
      if (backwardKeyPressed)
      {
       this.speed = 0;
      }
      else
      {
        this.speed = 3;
      }
    }
    
    if (this.y <= 0 + 30)
    {
      if (forwardKeyPressed)
      {
        this.speed = 0;
      }
      else
      {
        this.speed = 3;
      }
    }
  } 
}
 
class Bullet
{
  float x = 0.0;
  float y = 0.0;
  float w = 30.0;
  float h = 30.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = -1.0;
  PImage img;
   
  Bullet()
  {
    this.img = requestImage("fire.png");
  }
    
  void draw()
  {
    this.x += this.speed;
     
    if (this.img.width > 0)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
      
       
      imageMode(CORNER);
      
    }
  }
}

class Shot
{
  float x = 100;
  float y = 400;
  float w = 50;
  float h = 10;
  float speed = -10;
  PVector direction = new PVector(-1, 0);
  boolean active = false;
   
  void draw()
  {
    this.y += this.direction.y * this.speed;
    this.x += this.direction.x * this.speed;
    ellipse(this.x, this.y, this.w, this.h);
  }
}


class Boss
{
  float x = 700;
  float y = 400;
  float speed = 5;
  Shot shot;
  float hp = 200;
  PImage boss;
  boolean hitTarget = false;
  float shottimer = 0;
  
  Boss()
  {
    this.shot = new Shot();
    this.shot.speed = 10;
    this.shot.x = this.x;
    this.shot.y = this.y;
    this.shot.h = 25;
    this.boss = requestImage("enemy.png");
  
   }
   void draw()
   {
     for (int i = 0; i < bulletCount; i += 1)
    {
      bullets[i].draw();
      
      float distancetotarget = dist(this.x, this.y, bullets[i].x, bullets[i].y);
      if (distancetotarget < 100)
      {
        this.hp -= 1;
        hitTarget = true;
        tint(255, 0, 0);
      }
     }
     if (this.y <= 0)
     {
       this.speed = 5;
     }
     if (this.y >= height - 100)
     {
       this.speed = -5;
     }
     this.y += this.speed;
    
     image(this.boss, this.x, this.y, 100, 100);
     tint(255);
     
     this.shot.draw();
     if (this.shot.x < 0)
          {
       
            this.shot.y = this.y;
            this.shot.x = this.x;
       
            PVector direction = new PVector(myMan.x - this.x, myMan.y - this.y);
            direction.normalize();
            this.shot.direction = direction;
          }
   }
}






