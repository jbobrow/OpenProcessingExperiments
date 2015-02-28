
float angle = 0.0;
float speed2 = 0.03;
float radius = 200.0;
float sx = 3.0;
float sy = 1.0;
float sinval = sin(angle);
float cosval = cos(angle);
float x2 = 20 + (cosval*radius); //originally 100
float y2 = 200 + (sinval*radius); //originally 300

float timer = 0.0;

PImage dA;

SpriteObject naviPlz;
SpriteObject happyPlz;
SpriteObject hatePlz;
SpriteObject killer;
SpriteObject dead;

void setup()
{
  size(600,600);
  dA = requestImage("da_thing.jpg");
  naviPlz = new SpriteObject("naviplz.png");
  naviPlz.s = 1.1;
  
  happyPlz = new SpriteObject("ihappyloveitplz.png");
  happyPlz.speed = 5.5;
  happyPlz.s = 1.2;
  //happyPlz.x = random(600);
  happyPlz.y = 200;
  happyPlz.directionX = random(-1,2);
  happyPlz.directionY = random(-1,2);
  
  hatePlz = new SpriteObject("ihateitplz.png");
  hatePlz.speed = 2;
  hatePlz.s = 1.2;
  hatePlz.x = random(600);
  hatePlz.y = random(600);
  hatePlz.directionX = 1;
  hatePlz.directionY = 1;
  
  killer = new SpriteObject("ikilleditplz.png");
  killer.s = 1.5;
  killer.speed = 3;
  killer.y = 400;
  killer.directionX = 1;
  killer.directionY = 1;
  
  dead = new SpriteObject("iwantitplz.png");
  dead.s = 1.2;
}

void draw()
{
  angle += speed2;
  timer = timer + 0.0167;
  
  if(dA.width > 0)
  {
    imageMode(CORNER);
    image(dA,0,0,width,height);
  }
  
  if(killer.isOverlapping(naviPlz) == true)
  {
    naviPlz.s = 0;
    killer.s = 2;
  }
  if(killer.isOverlapping(happyPlz) == true)
  {
    happyPlz.s = 0;
    killer.s = 2;
  }
  if(killer.isOverlapping(hatePlz) == true)
  {
    hatePlz.s = 0;
    killer.s = 2;
  }
  if(killer.isOverlapping(dead) == true)
  {
    dead.s = 0;
    killer.s = 3;
  }
  
  if(timer > 6)
  {
    hatePlz.speed = 0;
    dead.x = hatePlz.x;
    dead.y = hatePlz.y;
    dead.render();

  }
  if(timer > 4)
  {
    naviPlz.speed = 0;

  }
  if(timer > 8)
  {
    happyPlz.speed = 0;
    dead.x = happyPlz.x;
    dead.y = happyPlz.y;
    dead.render();
  }
  if(timer > 12)
  {
  dead.s = 0;
  }
  
  naviPlz.x = x2 + cos(angle*sx)*radius/2;
  naviPlz.y = y2 + sin(angle*sy)*radius/2;
  
  naviPlz.render();
  
  happyPlz.update();
  happyPlz.render();
  
  hatePlz.update();
  hatePlz.render();
  
  killer.update();
  killer.render();
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


