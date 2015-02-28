
SpriteObject troll;
SpriteObject troll2;
SpriteObject troll3;
SpriteObject troll4;
SpriteObject troll5;
SpriteObject troll6;
SpriteObject troll7;
SpriteObject forest;

int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;
int WINNING_CLICK_COUNT = 300;
int gameState = 0;
float timer = 15;
int clickCount = 0;
float left = 0;
float right = 0;
float x = 0;
float speed = 3.0;

void setup()
{
  size(500, 500);
  forest = new SpriteObject("forest.jpg");
  forest.x = width/2;
  forest.y = height/2;
  troll = new SpriteObject("child.jpg");
  troll.x = width/2;
  troll.y = height/2;
  troll.s= 0.1;
  troll2 = new SpriteObject("red-meat.jpg");
  troll2.y = 0;
  troll2.x = random(500);
  troll2.s = 0.05;
   
  troll3 = new SpriteObject("walf.jpg");
  troll3.y = 0;
  troll3.x = random(500);
  troll3.s = 0.05;
  
  troll4 = new SpriteObject("red-meat.jpg");
  troll4.y = 0;
  troll4.x = random(500);
  troll4.s = 0.05;
   
  troll5 = new SpriteObject("walf.jpg");
  troll5.y = 0;
  troll5.x = random(500);
  troll5.s = 0.05;
  
  troll6 = new SpriteObject("red-meat.jpg");
  troll6.y = 0;
  troll6.x = random(500);
  troll6.s = 0.05;
   
  troll7 = new SpriteObject("walf.jpg");
  troll7.y = 0;
  troll7.x = random(500);
  troll7.s = 0.05;
  
}
  
void draw()
{
    timer -= 0.0167;
   if (gameState == PLAY_STATE)
  {
  background(0);
  forest.render();
  textSize(30);
  text("eat me to survive child", 0, 300);
  text("TIME: " + (int)timer, 0, 30);
  text("CLICKS: " + clickCount, 0, 400);

   
  if (troll2.isOverlapping(troll) == true)
  {
    clickCount +=1;
  }
  if (troll4.isOverlapping(troll) == true)
  {
    clickCount +=1;
  }
    if (troll6.isOverlapping(troll) == true)
  {
    clickCount +=1;
  }  
  troll2.render();
  troll2.y += 0.8;
  troll4.render();
  troll4.y += 0.5;
  troll6.render();
  troll6.y += 0.31;

  if (troll3.isOverlapping(troll) == true)
  {
    gameState=1;
  }
  if (troll5.isOverlapping(troll) == true)
  {
    gameState=1;
  }
    if (troll7.isOverlapping(troll) == true)
  {
    gameState=1;
  }
  troll3.render();
  troll3.y += 0.6;
  troll5.render();
  troll5.y += 0.8;
  troll7.render();
  troll7.y += 0.4;
  
  x += (right - left) * speed;
  translate(x,0);
    troll.render();
  

  
  } 

  
     if (timer < 0)
    {
      if (clickCount < WINNING_CLICK_COUNT)
      {
        gameState = GAMEOVER_STATE;
      }
      else
      {
        gameState = WIN_STATE;
      }
    }
    
     if (gameState == WIN_STATE)
  {
    background(255);
    fill(0, 255, 0);
    text("You ate your mother", 0, 30);
  }
  if (gameState == GAMEOVER_STATE)
  {
    background(255, 0, 0);
    fill(0);
    text("Wolves feasted on your marrow", 0, 30);
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
  }
}
  
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }
  }
}



