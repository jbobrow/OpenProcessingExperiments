
SpriteObject ship;
SpriteObject[] asteroid = new SpriteObject[100];
SpriteObject item;

float timer = 0;
float timer2 = 10;
float timer3 = 0;
float rate = 0;
boolean gameStart, gameEnd, collision;
float  r1 = random(600);
float r2 = random(600);
PImage space;
float score = 0;

void setup()
{
  size(600,600);
  
  space = loadImage("space.jpg");
  ship = new SpriteObject("ship.png");
  item = new SpriteObject("item.png");
  for ( int i = 0; i < 100; i++)
 {

  asteroid[i] = new SpriteObject("asteroid.png");
  asteroid[i].x = random(600);
  asteroid[i].y = random (-4000,0);
 }
  
  gameStart = false;
  gameEnd = false;
  
}

void draw()
{
  
  image(space,300,300,600,600);
  
  
  if(collision)
    {
      
      fill(#FF0D00,200);
      rect(-10,-10,610,610);
      score = score - 3;
    }
    
    collision = false;
    
  if(gameStart == false)
  {
    background(#040A48);
  textSize(32);
  text("CLICK TO START",190,250);
  }
  if(mousePressed)
  {
    gameStart = true;
  }
  if (gameStart == true)
  {
  timer3 += .016;
  
  if(timer3 >1)
  {
    timer2 -= 1;
    timer3 = 0;
  }
  timer += rate ;
  
  for ( int i = 0; i < 100; i++)
    {
    asteroid[i].render();
    asteroid[i].y += 5;
    asteroid[i].rotation += .01;
    
      if(asteroid[i].isOverlapping(ship))
    {
      collision = true;
    }
    
    
    }
  if(timer > 1)
  {
    rate += 10;
    timer = 0;
  }
  ship.x = mouseX;
  ship.y = mouseY;
  ship.render();

if(score <1)
  {
    score = 0;
  }
  
 
  fill(#FFFFFF);
  textSize(25);
  text("TIME REMAINING: "+(int)timer2,0,26);
  textSize(20);
  text("SCORE: " + (int)score,0,50);
  
  item.render();
  item.x=r1;
  item.y=r2;
  
  if(item.isOverlapping(ship))
  {
    r1=random(600);
    r2=random(600);
    score = score + 50;
  }
  }
  
   if(timer2 < 1)
  {
    gameEnd = true;
    gameStart = false;
  }
  if(gameEnd == true)
  {
    fill(#040A48);
    rect(-10,-10,605,605);
    fill(#FFFFFF);
    textSize(32);
    text("GAME OVER",210,250);
    text("FINAL SCORE: " + (int)score,170,300);
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
 



