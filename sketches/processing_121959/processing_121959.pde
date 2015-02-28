
wSpriteObject missel1;
SpriteObject missel2;
SpriteObject missel3;
SpriteObject missel4;
SpriteObject missel5;
SpriteObject missel6;
SpriteObject missel7;
SpriteObject missel8;
SpriteObject missel9;
SpriteObject missel10;
SpriteObject bomb;
PImage sky;
PImage lose;
PImage win;
float upKey;
float downKey;
float timer=7;
float rectTimer = 0;

int gameState = 0;
int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;
float health =1;


class AnimatedSpriteObject extends SpriteObject
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
    
  AnimatedSpriteObject(String filename)
  {
    super(filename);
    this.spriteSheet = this.img;
  }
    
  void setAnimation(int start, int end, boolean looping)
 
 {
    this.startFrame = start;
    this.endFrame = end;
    this.currentFrame = this.startFrame;
    this.loop = looping;
  }
    
  void update()
  {
    // Increment currentFrame by the frameRate related to current fps)
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
       
 /*      this.rotation = degrees(atan2(mouseY-this.y, mouseX-this.x)); */
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation)); 
      
    this.y += (up - down) * this.directionY * this.speed;
    this.x += (up - down) * this.directionX * this.speed; 
  }
}
  
AnimatedSpriteObject chopper;
AnimatedSpriteObject explotion;
 
 
// Bullet Class
class Bullet extends SpriteObject
{
  Bullet(String filename)
  {
    super(filename);
  }
      
  void update()
  {
    this.rotation = degrees(atan2(this.directionY, this.directionX));
    this.y -= this.directionY * this.speed;
    this.x -= this.directionX * this.speed;
  }
}
   
int bulletCount = 10;
Bullet[] b = new Bullet[bulletCount];
int bulletIndex = 0;
  
float up;
float down;
  
void setup()
{
  size(1000, 800);
  sky= requestImage("sky.png");
  win= requestImage("win.jpg");
  lose= requestImage("lose.jpg");
   
  chopper = new AnimatedSpriteObject("helicopter.jpg");
  chopper.x = 800;
  chopper.y = height/2;
  chopper.frameWidth = 750;
  chopper.frameHeight = 300;
  chopper.startFrame = 0;
  chopper.endFrame = 1;
  chopper.frameSpeed = 6.0;
  chopper.speed =5;
  chopper.s=.4;
  
  /*explotion = new AnimatedSpriteObject("bomb.png");
 
  explotion.frameWidth = 270;
  explotion.frameHeight = 200;
  explotion.startFrame = 0;
  explotion.endFrame = 3;
  explotion.frameSpeed = 6.0;
  explotion.speed =5;
  explotion.s=.4;         */
  
  
 /* car = new MouseRotatingCar("tank.jpg");
  car.x = width / 2;
  car.y = height / 2;
  car.speed = 5;  */
    
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i] = new Bullet("bullet.png");
    b[i].x = 1000;
    b[i].y = 1000;
    b[i].s = 0.1;
    
  }
  
  missel1 = new SpriteObject("missile.png");
  missel1.x = -40;
  missel1.y = 500;
  missel1.s = .25;
  
  missel2 = new SpriteObject("missile.png");
  missel2.x = -200;
  missel2.y = 50;
  missel2.s = .25;
  
  missel3 = new SpriteObject("missile.png");
  missel3.x = -350;
  missel3.y = 700;
  missel3.s = .25;
  
  missel4 = new SpriteObject("missile.png");
  missel4.x = -450;
  missel4.y = 300;
  missel4.s = .25;
  
  missel5 = new SpriteObject("missile.png");
  missel5.x = -700;
  missel5.y = 600;
  missel5.s = .25;
  
  missel6 = new SpriteObject("missile.png");
  missel6.x = -910;
  missel6.y = 240;
  missel6.s = .25;
  
  missel7 = new SpriteObject("missile.png");
  missel7.x = -1320;
  missel7.y = 560;
  missel7.s = .25;
  
  missel8 = new SpriteObject("missile.png");
  missel8.x = -1700;
  missel8.y = 70;
  missel8.s = .25;
  
  missel9 = new SpriteObject("missile.png");
  missel9.x = -180;
  missel9.y = 400;
  missel9.s = .25;
  
  missel10 = new SpriteObject("missile.png");
  missel10.x = -2200;
  missel10.y = 844;
  missel10.s = .25;
  
  bomb = new SpriteObject("explosion.png");
  bomb.x = 40;
  bomb.y = 500;
  bomb.s = 1;
}
  
void draw()
{
  timer -= 0.0167;
  if ( gameState == PLAY_STATE)
  {

  image(sky, 500,400,width,height);
  chopper.update();
  chopper.render();
  for (int i = 0; i < bulletCount; i += 1)
  {
    b[i].update();
    b[i].render();
  }
 
  
  if (missel1.isOverlapping(chopper) == true)
    {
      missel1.img= bomb.img;
    }
 
  missel1.render();
  missel1.x += 7;
  
  if (missel2.isOverlapping(chopper) == true)
    {
      missel2.img= bomb.img;
      health -=1;
    }
 
  missel2.render();
  missel2.x += 7;
  
  if (missel3.isOverlapping(chopper) == true)
    {
      missel3.img= bomb.img;
      health -=1;
    }
 
  missel3.render();
  missel3.x += 7;
  
  if (missel4.isOverlapping(chopper) == true)
    {
      missel4.img= bomb.img;
      health -=1;
    }
 
  missel4.render();
  missel4.x += 7;
  
  if (missel5.isOverlapping(chopper) == true)
    {
      missel5.img= bomb.img;
      health -=1;
    }
 
  missel5.render();
  missel5.x += 7;
  
  if (missel6.isOverlapping(chopper) == true)
    {
      missel6.img= bomb.img;
      health -=1;
    }
 
  missel6.render();
  missel6.x += 7;
  
  if (missel7.isOverlapping(chopper) == true)
    {
      missel7.img= bomb.img;
      health -=1;
    }
 
  missel7.render();
  missel7.x += 7;
  
  if (missel8.isOverlapping(chopper) == true)
    {
      missel8.img= bomb.img;
      health -=1;
    }
 
  missel8.render();
  missel8.x += 7;
  
  if (missel9.isOverlapping(chopper) == true)
    {
      missel9.img= bomb.img;
      health -=1;
    }
 
  missel9.render();
  missel9.x += 7;
  
  if (missel10.isOverlapping(chopper) == true)
    {
      missel10.img= bomb.img;
      health -=1;
    }
 
  missel10.render();
  missel10.x += 7;
  
  if (timer <0)
  {
    if( health >0)
   { 
      gameState = WIN_STATE;
   }
    else
    gameState = GAMEOVER_STATE;
  }
  if (health<1)
  {
    gameState= GAMEOVER_STATE;
  }
 }
  if (gameState == WIN_STATE)
  {
    image(win, 500,400,width,height);
    fill(0, 255, 0);
    textSize(100);
    text("YOU WON!!!!", 250, 100);
  }
  if( gameState == GAMEOVER_STATE)
  {
    image(lose, 500,400,width,height);
    textSize(100);
    text("BLACK HAWK DOWN ", 10, 700);
  }

}
/*

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    b[bulletIndex].x = chopper.x;
    b[bulletIndex].y = chopper.y;
    b[bulletIndex].speed = 10;
    b[bulletIndex].directionX = chopper.directionX;
    b[bulletIndex].directionY = chopper.directionY;
    bulletIndex += 1;
    if (bulletIndex >= bulletCount)
    {
      bulletIndex = 0;
    }
  }
}
        */
void keyPressed()
{
    if (key == 'w')
    {
      chopper.y -=20;
    }
    if (key == 's')
    {
      chopper.y += 20;
    }
}
    
void keyReleased()
{
    // Reset our key states to 0 when released.
    if (key == 'w')
    {
      up = 0;
    }
    if (key == 's')
    {
      down = 0;
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
  boolean dead = false;
         
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
          
    this.y += directionY * speed;
    this.x += directionX * speed;
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



