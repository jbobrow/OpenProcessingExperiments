
float timer = 8;
int clickCount = 0;
int youCrashed = 0;
int gameState = 0;

float speed = 4.0;
float left = 0;
float right = 0;
float up = 0;
float down = 0;
float circleX = 0;
float circleY = 0;
float circleSize = random(2);
color circleColor;
float circleTimer = 0;


int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;
int WINNING_CLICK_COUNT = 5;
int WINNING_CRASH = 50;

PImage Back;

SpriteObject box;
SpriteObject circle;


 
void setup()
{
  size(800, 800);

  box = new SpriteObject("BOX.png");
  box.x = 0;
  box.y = 450;
  
  circle = new SpriteObject("cookie.png");
  
  Back = loadImage("back.png");
  
  


}
 
void draw()
{
  


  
  timer -= 0.0167;
   
  if (gameState == PLAY_STATE)
  {
    background(Back);
    textSize(30);
    fill(255, 0, 0);
    text("TIME: " + (int)timer, 0, 30);
    text("CLICKS: " + clickCount, 0, 400);
    text("COLLISION: " + youCrashed, 0, 450);
     
    circleTimer += 0.0167;
    

    box.x += (right - left) * speed;
    box.y += (down - up) * speed;
    box.render();
    
    if (box.isOverlapping(circle) == true)
    {
      youCrashed += 1;
    }
     
    if (circleTimer > 0.65)
    {   
      circleColor = color(random(255), random(255), random(255));
      circleX = random(width);
      circleY = random(height);
      circleTimer = 0;
    }
     
   
    circle.x = circleX;
    circle.y = circleY;
    circle.render();
     
    if (timer < 0)
    {
      if (clickCount < WINNING_CLICK_COUNT || youCrashed < WINNING_CRASH)
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
    background(0, 255, 0);
    fill(0, 0, 0);
    text("AWWWWW SHIT YOU WIN!!", 183, 380);
  }
  if (gameState == GAMEOVER_STATE)
  {
    background(255, 0, 0);
    fill(0, 0, 0);
    text("LOL YOU'RE BAD AT THIS", 183, 380);
  }
 
}
 
void mouseReleased()
{
  if (gameState == PLAY_STATE)
  {
    if (mouseInCircle(circleX, circleY, circleX, circleY) == true)
    {
      clickCount += 1;
    }
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }
    if (keyCode == UP)
    {
      up = 0;
    }
    if (keyCode == DOWN)
    {
      down = 0;
    }
  }
}
  
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 5;
    }
    if (keyCode == RIGHT)
    {
      right = 5;
    }
    if (keyCode == UP)
    {
      up = 5;
    }
    if (keyCode == DOWN)
    {
      down = 5;
    }
  }
}


 
boolean mouseInCircle(float x, float y, float w, float h)
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
  
}

  


