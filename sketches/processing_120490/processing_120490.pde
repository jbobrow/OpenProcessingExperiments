
float playerX = 100;
float playerY = 100;
float playerVelocityY = 0;
float velo[]=new float[11];
float playerVelocityX = 0;
float playerSpeed = 3;
float playerJumpSpeed = -5;
float playerSize = 10;
float upKey;
float rightKey;
float downKey;
float leftKey;
boolean onGround=true;
float gravity = .3;
int num = 40;
float mx[] = new float[num];
float my[] = new float[num];
float rockFall[] = new float[11];
float rockset[]=new float[11];
float timer;
int tracker;
boolean goingAll[]=new boolean[11];
int countertracker=5;
boolean starter=false;
int score;
SpriteObject player;
void setup()
{
size(500,500);
player=new SpriteObject("sman.jpg");
player.x=playerX+20;
player.y=playerY+50;
player.s=.2;
for(int count=0;count<11;count++)
{
  rockset[count]=random(10,490);
  rockFall[count]=-30;
  velo[count]=0;
  goingAll[count]=false;
}
}
void draw()
{
    player.x=playerX+20;
player.y=playerY+20;
  if (starter==true)
  gamering();
  
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
if (onGround == true)
{
playerVelocityY = playerJumpSpeed;
}
}


if(key==ENTER)
starter=true;
if(key=='q')
starter=false;
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

void fallingDown()
{

  velo[tracker]+=gravity;
rockFall[tracker]+=velo[tracker];

}

void gamering()
{
  background(100);


  timer+=0.03;
  println(timer);
  if(timer>1)
  {
    timer=0;
    tracker++;
    countertracker++;
  }
      goingAll[tracker]=true;
      goingAll[countertracker]=false;

// if (timer>9)
//  tracker+=1;
if(countertracker>9)
countertracker=0;
  if(tracker>9)
  {
  tracker=0;
  for(int count=0;count<11;count++)
{
  rockset[count]=random(10,490);
  rockFall[count]=-30;
  velo[count]=0;
 //   goingAll[count]=false;

}
  }
  for(int count=0;count<10;count++)
{
 // rockFall[count]=random(10,490);
 rect(rockset[count],rockFall[count],20,20);
}
//velo[tracker]+=gravity;
//rockFall[tracker]+=velo[tracker];
  for(int count=0;count<10;count++)
{
  if(goingAll[count]==true)
  {
    velo[count]+=gravity;
    rockFall[count]+=velo[tracker];
  }

}
fill(255);
noStroke();
int which = frameCount % num;
  mx[which] = playerX;
  my[which] = playerY;
playerVelocityY += gravity;
playerVelocityX = (rightKey - leftKey) * playerSpeed;

playerY += playerVelocityY;
playerX += playerVelocityX;
for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    rect(mx[index], my[index], i, i);
    player.render();

  }
if (playerX<-0)
    {
      playerX=0;
    }
    if (playerX>470)
    {
      playerX=470;
    }
    if (playerY<0)
    playerY=0;
    if (playerY>550)
    playerY=550;
//rect(playerX,playerY,playerSize,playerSize);
score+=10;
fill(255,0,0);
textSize(30);
//text(score,100,100);
 

}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
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
   
boolean isOverlappingCircle(float cx, float cy, float cr,float cry)
{
 float rx = this.x - (this.w * this.s);
 float ry = this.y - (this.h  * this.s);
 float rw = this.w * this.s;
 float rh = this.h * this.s;
   
  float circleDistanceX = abs(cx - rx - rw);
  float circleDistanceY = abs(cy - ry - rh);
   
  if (circleDistanceX > (rw + cr)) { return false; }
  if (circleDistanceY > (rh + cry)) { return false; }
  if (circleDistanceX <= rw) { return true; }
  if (circleDistanceY <= rh) { return true; }
   
  float cornerDistance = pow(circleDistanceX - rw, 2) + pow(circleDistanceY - rh, 2);
  return cornerDistance <= pow(cr, 2);
}
 boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
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
   
boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}


