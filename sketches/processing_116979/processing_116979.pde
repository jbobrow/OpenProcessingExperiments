
SpriteObject ken1;
SpriteObject ken2;
SpriteObject ryu;
PImage background;
float timer = 11;
int hitCount = 0;
int gameState = 0;
int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;
int WINNING_HIT_COUNT = 50;

SpriteObject Ryu;
SpriteObject Ken;

void setup()
{
 size (600, 500);
background = loadImage("background.JPG");

ken1 = new SpriteObject ("ken1.png");
ken2 = new SpriteObject ("ken2.png");
ryu = new SpriteObject ("ryuCopy.png");

Ken = new SpriteObject ("ken1.png");
Ken.x = 420;
Ken.y = 400;
Ken.s = 2.0;

Ryu = new SpriteObject ("ryuCopy.png");
Ryu.x = 349;
Ryu.y = 400;
Ryu.s = 2.0;
}

void draw()
{ 
  timer -= 0.0167;
  
  if (gameState == PLAY_STATE)
  {
    image (background, width/2, height/2, 600, 500);
    textSize(30);
    fill(255, 0, 0);
    text("TIME: " + (int)timer, 400, 30);
    text("HITS" + hitCount, 0, 400);
     
    if (timer < 0)
    {
      if (hitCount < WINNING_HIT_COUNT)
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
    fill(0, 255, 0);
    rect(0,0,600,500);
    textSize(32);
    fill(0);
    text("CONGRADULATIONS, YOU WIN :D", 0, 70);
  }
  if (gameState == GAMEOVER_STATE)
  {
    fill(255, 0, 0);
    rect(0, 0, 600, 500);
    textSize(32);
    fill(0);
    text("GAME OVER, YOU LOSE :(", 0, 70);
  }
  
if (ken2.isOverlapping(ryu))
{
 tint(255,0,0);
}
else
{
tint(255); 
}
Ken.render();
Ryu.render();
}

void keyPressed()
{
 Ken.img = ken2.img; 
}

void keyReleased()
{
 Ken.img = ken1.img; 
 if (gameState == PLAY_STATE)
 {
   if (Ken.isOverlapping(Ryu) == true)
   {
     hitCount +=1;
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




