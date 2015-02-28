
SpriteObject drums;
SpriteObject egg;
SpriteObject flower;
SpriteObject phone;
SpriteObject pottery;
SpriteObject puppy;
SpriteObject rock;
SpriteObject ship;
SpriteObject winner;
SpriteObject toaster;
float timer = 8;
int clickCount = 0;
int gameState = 0;
 
float winnerX = 0;
float winnerY = 0;
float drumsX = 0;
float drumsY = 0;
float eggX = 0;
float eggY = 0;
float flowerX = 0;
float flowerY = 0;
float phoneX = 0;
float phoneY = 0;
float puppyX = 0;
float puppyY = 0;
float rockX = 0;
float rockY = 0;
float shipX = 0;
float shipY = 0;
float toasterX = 0;
float toasterY = 0;
float rectSize = 100;
color rectColor;
float rectTimer = 0;
 
int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;
int WINNING_CLICK_COUNT = 1;
 
void setup()
{
  size(500, 500);
  drums = new SpriteObject("drums.jpg");
  egg = new SpriteObject("egg.jpg");
  flower = new SpriteObject("drums.jpg");
  phone = new SpriteObject("phone.jpg");
  pottery = new SpriteObject("pottery.jpg");
  puppy = new SpriteObject("puppy.jpg");
  rock = new SpriteObject("rock.jpg");
  ship = new SpriteObject("ship.jpg");
  winner = new SpriteObject("winner.jpg");
  toaster = new SpriteObject("toaster.jpg");
}
 
void draw()
{
  timer -= 0.0167;
   
  if (gameState == PLAY_STATE)
  {
    background(0);
    textSize(30);
    fill(255, 0, 0);
    text("find Skrillex",0,30);
     
    rectTimer += 0.0167;
     
    if (rectTimer > 1.5)
    {   
      
      winnerX = random(width);
      winnerY = random(height);
      drumsX = random(width);
      drumsY = random(height);
      eggX = random(width);
      eggY = random(height);
      flowerX = random(width);
      flowerY = random(height);
      phoneX = random(width);
      phoneY = random(height);
      puppyX = random(width);
      puppyY = random(height);
      rockX = random(width);
      rockY = random(height);
      shipX = random(width);
      shipY = random(height);
      toasterX = random(width);
      toasterY = random(height);
      rectTimer = 0;
    }
    winner.render();
    winner.x = winnerX;
    winner.y =  winnerY;
    winner.s = 0.3;
    drums.render();
    drums.x = drumsX;
    drums.y =  drumsY;
    drums.s = .5;
    egg.render();
    egg.x = eggX;
    egg.y = eggY;
    egg.s = .2;
    flower.render();
    flower.x = flowerX;
    flower.y = flowerY;
    flower.s = .5;
    phone.render();
    phone.x = phoneX;
    phone.y = phoneY;
    phone.s = .5;
    puppy.render();
    puppy.x = puppyX;
    puppy.y = puppyY;
    puppy.s = .5;
    rock.render();
    rock.x = rockX;
    rock.y = rockY;
    rock.s = .5;
    puppy.s = .5;
    ship.render();
    ship.x = shipX;
    ship.y = shipY;
    ship.s = .5;
    toaster.render();
    toaster.x = toasterX;
    toaster.y = toasterY;
    ship.s  = .5;
    

    
     
    if (timer < 0)
    {
      if (clickCount <= WINNING_CLICK_COUNT)
      {
        gameState = GAMEOVER_STATE;
      }
      else
      {
        gameState = WIN_STATE;
      }
    }
  }
   
  if (gameState == WIN_STATE)
  {
    background(0,255,0);
    fill(255,255,0);
    text("you know how Skrillex looks like,",0,300);
    text(" but does that make you a winner???",0,330);
  }
  if (gameState == GAMEOVER_STATE)
  {
    background(255,0,0);
    fill(0);
    text("you couldn't find Skrillex.",0,50);
    text(" I'm sorry i made this so hard",0,100);
  }
 
}
 
void mouseReleased()
{
  if (gameState == PLAY_STATE)
  {
    if (mouseInRect(winnerX, winnerY, rectSize, rectSize) == true)
    {
      clickCount += 1;
    }
  }
}
 
boolean mouseInRect(float x, float y, float w, float h)
{
  if (mouseX > x  && mouseX < x + w && mouseY > y && mouseY < y + h)
  {
    return true;
  }
  else
  {
    return false;
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
 
  boolean isOverlappingMouse()
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


