
SpriteObject background;
SpriteObject sword;
SpriteObject stone;
SpriteObject stone2;
PImage zeldaWin;
PImage ganon;
float moveX = 370;
float moveY = 450;
int gameState = 1;
int playState = 0;
int winState = 2;
int loseState = 3;
float timer = 2;
float hue = 0;

void setup()
{
  size(700, 580);
  
  background = new SpriteObject("background.png");
  background.x = width / 2;
  background.y = height / 2;
  background.s = 0.8;
  
  stone = new SpriteObject("stone.png");
  stone.x = width / 2;
  stone.y = 830;
  stone.s = 0.8;
  
  stone2 = new SpriteObject("stone.png");
  stone2.x = width / 2;
  stone2.y = 290;
  stone2.s = 0.8;  
  
  sword = new SpriteObject("linksword.png");
  sword.x = moveX;
  sword.y = moveY;
  
  zeldaWin = requestImage("zeldawin.png");
  ganon = requestImage("ganon.png");

}

void draw()
{
  background.render();

  if (playState == 0)
  {
    textSize(30);
    text("PUSH SPACEBAR TO PLAY", 200, 50);
  }

  if (gameState == playState)
  {
    textSize(30);
    text("TIME: " + (int)timer, 0, 50);
    tint(255);
    timer -= 0.0167;
    println(timer);
    sword.x = moveX;
    sword.y = moveY;
  }

  if (timer < 0)
  {
    if (sword.isOverlapping(stone) == true)
    {
      gameState = loseState;
    }
    else
    {
      gameState = winState;
    }
  }
    
  if (gameState == winState)
   {
     image(zeldaWin, width / 2, 220, 700, 800);
     text("YOU", 100, 100);
     text("WON!!!", 400, 100);
     fill(random(360), random(360), random(360));
     textSize(80);
   }
  if (gameState == loseState)
  {
    image(ganon, 350, 290, 1400, 580);
    fill(234, 7, 11);
    textSize(80);
    text("YOU", 100, 100);
    text("LOSE!!!", 400, 100);
  }

  sword.render();
  stone2.render();
  stone.render();
}

void keyReleased()
{
  if (keyCode == UP)
  {
    moveY -= 5;
  }
  if (keyCode == ' ')
  {
    playState = 1;
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



