
float left=0;
int health=100;
PImage chocobomb;
int bombtime=1;
int gametime=0;
float chocobombcount=1;
float chocobombtimer=30;
float chocobombduration=0;
float right=0;
float up=0;
float down=0;
PImage collisionImage;
PImage displayImage;
float playerY=400;
float playerX=20;
float playerVelocityY=0;
float playerVelocityX=0;
float playerSpeed=3;
float JumpSpeed= -5;
float playerSize=26;
float upKey;
float rightKey;
float downKey;
float leftKey;
float gravity=.3;
boolean onGround=true;
boolean isRectOverlapping(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}

BulletObject[] bullet=new BulletObject[10];
int currentBullet=0;
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
    if (startFrame!=start && endFrame!=end)
    {
    this.startFrame = start;
    this.endFrame = end;
    this.currentFrame = this.startFrame;
    this.loop = looping;
    }
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
      this.directionX=(right-left);
      this.x+=directionX*speed;
      this.directionY=(down-up);
      this.y+=directionY*speed;
  }
  
   
}
 
AnimatedSpriteObject knight;
 
void setup()
{
  size(500,500);
  chocobomb=requestImage("chocobomb.png");
  collisionImage=requestImage("levels2.png");
  displayImage=requestImage("levelsdetail2.png");
  knight = new AnimatedSpriteObject("chocobosprites.png");
 // knight.x = width/2;
  //knight.y = 400;
  knight.frameWidth = 24;
  knight.frameHeight = 32;//.5;
  knight.startFrame = 7;
  knight.endFrame = 7;
  knight.currentFrame = 7;
  knight.frameSpeed = 3.0; // 6fps
  knight.speed=4;
  knight.w = 30;
  knight.h = 30;
  
  for (int i=0; i<10;i++)
  {
    bullet[i]=new BulletObject("greens.png");
    bullet[i].w=20;
    bullet[i].h=20;
    bullet[i].x=-1000;
    bullet[i].y=-1000;
  }
}
boolean chocoboProcessed = false;
void draw()
{
  chocobombtimer-=0.0167;
  if (chocobombtimer<0)
  {
    chocobombcount+=1;
    chocobombtimer=30;
  }
  if (gametime==0)
  {
  if (knight.loaded == true && chocoboProcessed == false)
  {
  if(knight.spriteSheet.width>0)
  {
    knight.spriteSheet .loadPixels();
    for (int y=0; y<knight.spriteSheet .height;y+=1)
    {
    for (int x=0;x<knight.spriteSheet .width;x+=1)
    {
      color pixelColor=knight.spriteSheet .pixels[y*knight.spriteSheet .width+x];

      if (green(pixelColor) == 156)
      {
        //println("found color");
        knight.spriteSheet .pixels[y*knight.spriteSheet .width+x] = color(255,255,255,0);
      }
    }
    }
    knight.spriteSheet .updatePixels();
    chocoboProcessed = true;
  }
  }
  background(0);
    fill(0);


    onGround=false;
  if(collisionImage.width>0)
  {
    playerVelocityY+=gravity;
  playerVelocityX=(rightKey-leftKey)*playerSpeed;
  float nextX=playerX+playerVelocityX;
  float nextY=playerY+playerVelocityY;
    collisionImage.loadPixels();
    for (int y=0; y<collisionImage.height;y+=1)
    {
    for (int x=0;x<collisionImage.width;x+=1)
    {
      color pixelColor=collisionImage.pixels[y*collisionImage.width+x];
         float platformSize=10;
       float platformX= x*platformSize;
  float platformY=y*platformSize;
  boolean collided=isRectOverlapping(nextX,playerY, nextX+playerSize, playerY+playerSize,
  platformX,platformY, platformX+platformSize,platformY+platformSize);
  
  if (collided==true && red(pixelColor)==0)
 
  {
if(playerVelocityX<0 && playerX>=platformX+platformSize)
{
  playerVelocityX=0;
}
if (playerVelocityX >0 &&playerX+playerSize<platformX)
  {
    playerVelocityX=0;
  }
  }
  collided=isRectOverlapping(playerX,nextY, playerX+playerSize, nextY+playerSize,
  platformX,platformY, platformX+platformSize,platformY+platformSize);

  if (collided==true && red(pixelColor)==0)
  {
    if (playerVelocityY>0 && playerY + playerSize <platformY)
    {
      playerVelocityY=0;
      onGround=true;
    }
    if (playerVelocityY<0&& playerY>platformY+platformSize)
    {
      playerVelocityY=0;
    }
  }
  }  
  }
  }

  if(displayImage.width>0)
  {
    imageMode(CORNER);
    image(displayImage,0,0,500,500);
  }
  playerX+=playerVelocityX;
  playerY+=playerVelocityY;
  //fill(255, 0, 0);
  //rect(playerX,playerY,20,20);
  knight.update();
  knight.render();
  knight.x=playerX;
  knight.y=playerY;

   for(int i=0; i<10; i++)
   {
     bullet[i].update();
     bullet[i].render();
   }
   fill(255,255,255);
   textSize(20);
   text("Time Until Next Chocobo Bomb: "+int(chocobombtimer),0,52);
   text("Chocobo Bomb Count: "+int(chocobombcount),0,20);
   fill(255,0,0);
   text("Health: "+int(health),380,20);
 }

  //chocobomb

  if(gametime==1)
  {
    chocobombduration+=0.0167;
    //chocobomb animation
    fill(random(255),random(255),random(255));
    rect(0,0,500,500);
    image(chocobomb,0,0,height,width);
    
    if (chocobombduration>2)
    {
      gametime=0;
      chocobombduration+=0;
      chocobombduration=0;
    }
  }
}
    
 
void keyReleased()
{
 if (key=='1')
 {
   bullet[currentBullet].x=knight.x;
   bullet[currentBullet].y=knight.y;
   bullet[currentBullet].speed=5;
    if (shootdirectionX != 0)
    {
      bullet[currentBullet].directionX = shootdirectionX;
      bullet[currentBullet].directionY = 0;
    }
    currentBullet += 1;
    if (currentBullet >= 10)
    {
      currentBullet = 0;
    }
  }
if(key=='2' && chocobombcount>0)
{
  gametime=1;
  chocobombcount-=1;
}
if(key=='r'&&knight.y>600)
{
  playerX=20;
  playerY=400;
}
 
if (key==CODED)
{
  if (keyCode==LEFT)
  {
    left=0;
    leftKey=0;
  }
  if(keyCode==RIGHT)
  {
    right=0;
    rightKey=0;
  }
  if (keyCode==UP)
  {
    up=0;
    upKey=0;
  }
  if(keyCode==DOWN)
  {
    down=0;
    downKey=0;
  }
}
}
float shootdirectionX;
void keyPressed()
{
  if(key==' ')
{
  if (onGround==true)
  {
    playerVelocityY=JumpSpeed;
  }
}
   if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      knight.setAnimation(9,11,true);
      shootdirectionX = -1;
      leftKey=1;
    }
    if (keyCode == RIGHT)
    {
      // or use the helper function that does the same thing.
      // start, end, looping
      knight.setAnimation(3, 5, true);
      shootdirectionX = 1;
      rightKey=1;
    }
    if (keyCode == UP)
    {
      knight.setAnimation(0, 2, true);
    }
    if (keyCode == DOWN)
    {
      knight.setAnimation(6,8,true);
    }
 
  }


  if (key == CODED)
  {
  /*  if(keyCode==UP)
    {
      up=1;
    }
    if (keyCode==DOWN)
    {
      down=1;
    }*/
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }
  }
}
class BulletObject extends AnimatedSpriteObject
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
  float scaleX = 1.0;
  float scaleY = 1.0;
  PImage img;
  boolean loaded = false;
  boolean alive = true;
       
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
      
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.scaleX))
      && mouseX < (this.x + (this.w * 0.5 * this.scaleX))
      && mouseY > (this.y - (this.h * 0.5 * this.scaleY))
      && mouseY < (this.y + (this.h * 0.5 * this.scaleY)))
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
    float left = this.x - (this.w * 0.5 * this.scaleX);
    float right = this.x + (this.w * 0.5 * this.scaleX);
    float top = this.y - (this.h * 0.5 * this.scaleY);
    float bottom = this.y + (this.h * 0.5 * this.scaleY);
         
    float otherLeft = other.x - (other.w * 0.5 * other.scaleX);
    float otherRight = other.x + (other.w * 0.5 * other.scaleX);
    float otherTop = other.y - (other.h * 0.5 * other.scaleY);
    float otherBottom = other.y + (other.h * 0.5 * other.scaleY);
         
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
    
  void update()
  {
    if (this.x > width - (this.w * this.scaleX * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.scaleX * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.scaleX * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.scaleX * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.scaleY * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.scaleY * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.scaleY * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.scaleY * 0.5);
      this.directionY = -this.directionY;
    }
       this.y+=directionY*speed;
       this.x+=directionX*speed;
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
         
    if (loaded && alive)
    {
      imageMode(CORNER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.scaleX, this.scaleY);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



