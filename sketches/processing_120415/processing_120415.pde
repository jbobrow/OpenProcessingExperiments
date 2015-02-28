
SpriteObject Ken;
SpriteObject ken1;
SpriteObject ken2;
SpriteObject HadoKen;
SpriteObject ShoryuKen;
SpriteObject KickKen;
SpriteObject WinKen;
SpriteObject HadokenShotKen;
PImage background;
float leftKey = 0;
float rightKey = 0;
float speed = 1;
float x = 0;


class Hadoken extends SpriteObject
{
  Hadoken(String filename)
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
 
int hadokenCount = 20;
Hadoken[] h = new Hadoken[hadokenCount];
int hadokenIndex = 0;


void setup()
{
 size (600, 500);
background = loadImage("background.JPG");

ken1 = new SpriteObject ("ken1.png");
ken2 = new SpriteObject ("ken2.png");
HadoKen = new SpriteObject ("HadoKen.png");
ShoryuKen = new SpriteObject ("ShoryuKen.png");
KickKen = new SpriteObject ("KickKen.png");
WinKen = new SpriteObject ("WinKen.png");

for (int i = 0; i < hadokenCount; i += 1)
{
 h[i] = new Hadoken ("HadokenShotKen.png");
 h[i].x = -1000;
 h[i].y = -1000;
 h[i].s = 0.2; 
}

Ken = new SpriteObject ("ken1.png");
Ken.x = 250;
Ken.y = 400;
Ken.s = 1.3;
Ken.speed = 4;
}

void draw()
{ 
  image (background, width/2, height/2, 600, 500);
  
Ken.x -= (leftKey - rightKey) * speed;
float left = Ken.x - (Ken.w * 1 * Ken.s);
float right = Ken.x + (Ken.w * 1 * Ken.s);
float top = Ken.y - (Ken.h * 1 * Ken.s);
float bottom = Ken.y + (Ken.h * 1 * Ken.s);

Ken.render();

for (int i = 0; i < hadokenCount; i += 1)
{
 h[i].update();
 h[i].render(); 
}
}

void keyPressed()
{
  if (key == 'q')
  {
 Ken.img = ken2.img;
  }
 if (key == 'w')
{
  Ken.img = KickKen.img;
} 
if (key == 'e')
{
 Ken.img = ShoryuKen.img; 
}
if (key == 'r')
{
Ken.img = HadoKen.img; 
h[hadokenIndex].x = Ken.x;
h[hadokenIndex].y = Ken.y;
h[hadokenIndex].speed = 10;
h[hadokenIndex].directionX = -1;
hadokenIndex += 1;
if (hadokenIndex >= hadokenCount)
{
hadokenIndex = 0;  
}
}

if (key == 't')
{
 Ken.img = WinKen.img;  
}

if ( key == CODED)
{
if (keyCode == LEFT)
{
 leftKey = 1; 
}
if (keyCode == RIGHT)
{
 rightKey = 1; 
}
}
}

void keyReleased()
{
 Ken.img = ken1.img; 

 if (keyCode == LEFT)
 {
  leftKey = 0; 
 }
 
 if (keyCode == RIGHT)
 {
  rightKey = 0; 
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




