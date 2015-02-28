
float timer = 10;
float left = 0;
float right = 0;
float up = 0;
float down = 0;
float speed = 3.0;

int gameState = 0;
int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;

PImage lake;
SpriteObject fish;
SpriteObject crystal;
SpriteObject boulder;
SpriteObject boulder2;
SpriteObject wallmaster;
SpriteObject wallmaster2;

void setup()
{
  size(500,500);
  lake = requestImage("lake_hylia.png");
  fish = new SpriteObject("fish.png");
  fish.x = 440;
  fish.y = 390;
  fish.s = 1;
  
  crystal = new SpriteObject("crystal.png");
  crystal.x = random(150,370);
  crystal.y = random(110,470);
  crystal.s = 1.2;
  
  boulder = new SpriteObject("boulder.png");
  boulder.x = 0;
  boulder.y = random(110,145); //NOTE TO SELF: original boulder y was 135,430
  boulder.s = 0.8;
  
  boulder2 = new SpriteObject("boulder.png");
  boulder2.x = 0;
  boulder2.y = random(250,430);
  boulder2.s = 0.8;
  
  wallmaster = new SpriteObject("wallmaster.png");
  wallmaster.x = 500;
  wallmaster.y = random(135,200);
  wallmaster.s = 0.8;
  
  wallmaster2 = new SpriteObject("wallmaster.png");
  wallmaster2.x = 500;
  wallmaster2.y = random(170,350);
  wallmaster2.s = 0.8;
}

void draw()
{
  timer -= 0.0167;
  
  if(gameState == PLAY_STATE)
  {
    if(lake.width > 0)
    {
      imageMode(CORNER);
      image(lake,0,0,width,height);
    }
    textSize(30);
    text("TIME: " + (int)timer, 18, 460); //NOTE TO SELF: could be 380 if flipped
    fish.x += (right-left)* speed;
    fish.y += (down-up)* speed;
    boulder.x += 2.8;
    boulder2.x += 2;
    wallmaster.x -= 2.5;
    wallmaster2.x -= 1.5;
    
    if(boulder.isOverlapping(fish) == true)
    {
      gameState = GAMEOVER_STATE;
    }
    if(boulder2.isOverlapping(fish) == true)
    {
      gameState = GAMEOVER_STATE;
    }
    if(wallmaster.isOverlapping(fish) == true)
    {
      gameState = GAMEOVER_STATE;
    }
    if(wallmaster2.isOverlapping(fish) == true)
    {
      gameState = GAMEOVER_STATE;
    }
    if(fish.isOverlapping(crystal) == true)
    {
      gameState = WIN_STATE;
    }
    
    crystal.render();
    fish.render();
    boulder.render();
    boulder2.render();
    wallmaster.render();
    wallmaster2.render();
    
    if(timer < 0)
    {
      if(fish.isOverlapping(crystal) == true)
      {
        gameState = WIN_STATE;
      }
      else
      {
        gameState = GAMEOVER_STATE;
      }
    }
  }
  
  if(gameState == WIN_STATE)
  {
    background(#FFFFFF);
    fill(0,255,0);
    textSize(70);
    text("YOU WIN!!!", 80, 250);
  }
  
  if(gameState == GAMEOVER_STATE)
  {
    background(0);
    textSize(50);
    text("GAME OVER", 110, 250);
    textSize(25);
    text("CONTINUE ?", 180, 310);
  }
}

void keyReleased()
{
  if(key == CODED)
  {
    if(keyCode == LEFT)
    {
      left = 0;
    }
    if(keyCode == RIGHT)
    {
      right = 0;
    }
    if(keyCode == UP)
    {
      up = 0;
    }
    if(keyCode == DOWN)
    {
      down = 0;
    }
  }
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == LEFT)
    {
      left = 1;
    }
    if(keyCode == RIGHT)
    {
      right = 1;
    }
    if(keyCode == UP)
    {
      up = 1;
    }
    if(keyCode == DOWN)
    {
      down = 1;
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
  
  boolean isOverlapping(SpriteObject other)
  {
    float left2 = this.x - (this.w*0.5*this.s);
    float right2 = this.x + (this.w*0.5*this.s);
    float top = this.y - (this.w*0.5*this.s);
    float bottom = this.y + (this.w*0.5*this.s);
    
    float otherLeft = other.x - (other.w*0.5*other.s);
    float otherRight = other.x + (other.w*0.5*other.s);
    float otherTop = other.y - (other.w*0.5*other.s);
    float otherBottom = other.y + (other.w*0.5*other.s);
    
    return !(left2 > otherRight || right2 < otherLeft || top > otherBottom || bottom < otherTop);
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


