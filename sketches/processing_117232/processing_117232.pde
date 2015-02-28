
float timer = 10;
int gameState = 0;
int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;
//int enemyDestroyed = 0;
int itemGet = 0;
PImage stars;
SpriteObject zodiac;
//SpriteObject bullet;
SpriteObject item;
SpriteObject itemGotten;
SpriteObject enemy1;
SpriteObject enemy2;
/*SpriteObject enemy1Destroyed;
SpriteObject enemy2Destroyed;*/

void setup()
{
  size(700,700);
  stars = requestImage("Star-field.jpg");
  
  zodiac = new SpriteObject("Zodiac_Ophiuchus.jpg");
  zodiac.x = 300;
  zodiac.y = 550;
  zodiac.s = 0.5;
  
  item = new SpriteObject("item.jpg");
  item.x = random(255);
  item.y = 0;
  itemGotten = new SpriteObject("itemGotten.jpg");
  
  enemy1 = new SpriteObject("enemy1.jpg");
  enemy1.x = random(200);
  enemy1.y = 0;
  enemy2 = new SpriteObject("enemy2.jpg");
  enemy2.x = random(500);
  enemy2.y = 0;
  /*enemy1Destroyed = new SpriteObject("enemy1Destroyed.jpg");
  enemy2Destroyed = new SpriteObject("enemy2Destroyed.jpg");*/
  
}

void draw()
{
  if(stars.width > 0)
 {
  image(stars, 0, 0, width*2, height*2);
 }
 if (gameState == PLAY_STATE)
  {
    timer -= 0.0167;
    
    zodiac.render();
    if (keyCode == LEFT)
    {
      zodiac.x -= 2;
    }
    if (keyCode == RIGHT)
    {
      zodiac.x += 2;
    }
    /*if (key == 'b')
    {
      bullet.render();
      bullet.y -=2;
    }*/
    
    /*if (zodiac.x < 0)
    {
      zodiac.x += 100;
    }
    if (zodiac.x > 700)
    {
      zodiac.x -= 500;
    }*/
    
    item.render();
    item.y += 4;
    
    if (item.isOverlapping(zodiac) == true)
    {
      item.img = itemGotten.img;
      itemGet +=1;
    }
    
    if (enemy1.isOverlapping(zodiac) == true)
    {
      //tint(255, 0, 0);
      gameState = GAMEOVER_STATE;
    }
    enemy1.render();
    enemy1.y += 1;
    if (enemy2.isOverlapping(zodiac) == true)
    {
      //tint(255, 0, 0);
      gameState = GAMEOVER_STATE;
    }
    enemy2.render();
    enemy2.y += 1;
    if (enemy2.isOverlapping(enemy1) == true)
    {
      enemy2.x = random(200, 650);
    }
    if (enemy1.isOverlapping(enemy2) == true)
    {
      enemy1.x = random(10, 150);
    }
   /*if (bullet.isOverlapping(enemy1) == true)
   {
     tint(255, 0, 0);
     enemy1.img = enemy1Destroyed.img;
     enemyDestroyed +=1;
   }
   if (bullet.isOverlapping(enemy2) == true)
   {
     tint(255, 0, 0);
     enemy2.img = enemy2Destroyed.img;
     enemyDestroyed +=1;
   }*/
   
    if (timer < 0)
    {
      if (itemGet > 0)
      {
        gameState = WIN_STATE;
      }
      else
      {
        gameState = GAMEOVER_STATE;
      }
    }
  }
  
  if (gameState == WIN_STATE)
  {
    background(255);
    fill(0, 255, 0);
    text("You Win!", 250, 250);
  }
 if (gameState == GAMEOVER_STATE)
 {
   background(255,0,0);
   fill(0);
   text("Game Over, Yeah!!!", 250, 250);
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
  
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - ( this.w * 0.5 * this.s);
    float right = this.x + ( this.w * 0.5 * this.s);
    float top = this.y - ( this.h * 0.5 * this.s);
    float bottom = this.y + ( this.h * 0.5 * this.s);
    
    float otherLeft = other.x - ( other.w * 0.5 * other.s);
    float otherRight = other.x + ( other.w * 0.5 * other.s);
    float otherTop = other.y - ( other.h * 0.5 * other.s);
    float otherBottom = other.y + ( other.h * 0.5 * other.s);
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
   
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
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



