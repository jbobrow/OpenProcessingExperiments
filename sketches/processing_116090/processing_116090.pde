
/*float timer = 5;
int clickCount = 0;
int gameState = 0;*/


/*float rectX = 0;
float rectY = 0;
float rectSize = 100;
color rectColor;
float rectTimer = 0;
*/

/*int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;
int WINNING_CLICK_COUNT = 10;*/

SpriteObject tuskAct4;
SpriteObject lightning;
SpriteObject molten;
SpriteObject flood;
SpriteObject crumble;
SpriteObject wind;
SpriteObject energy;
SpriteObject dark;
SpriteObject light;

void setup()
{
  size(700,700);
  //textFont(createFont("Comic Sans", 32));
  tuskAct4 = new SpriteObject("tusk_4_color.jpg");
  tuskAct4.x = 300;
  tuskAct4.y = 550;
  tuskAct4.s = 0.5;
  
  lightning = new SpriteObject("lightning.jpg");
  lightning.y = 0;
  lightning.x = 10;
  lightning.s = 0.1;
  
  molten = new SpriteObject("fireball.jpg");
  molten.y = 0;
  molten.x = 400;
  molten.s = 0.1;
  
  flood = new SpriteObject("agua.jpg");
  flood.y = 0;
  flood.x = 200;
  flood.s = 0.1;
  
  crumble = new SpriteObject("earth.jpg");
  crumble.y = 0;
  crumble.x = 100;
  crumble.s = 0.1;
  
  wind = new SpriteObject("Rasengan.jpg");
  wind.y = 0;
  wind.x = 500;
  wind.s = 0.1;
  
  energy = new SpriteObject("energy.jpg");
  energy.y = 0;
  energy.x = 300;
  energy.s = 0.1;
  
  dark = new SpriteObject("Dark_Energy_Ball.jpg");
  dark.y = 0;
  dark.x = 600;
  dark.s = 0.1;
  
  light = new SpriteObject("light.jpg");
  light.y = 0;
  light.x = 610;
  light.s = 0.1;
  
}

void draw()
{
  background(0);
  
  tuskAct4.render();
  if (keyCode == LEFT)
  {
    tuskAct4.x -= 2;
  }
  if (keyCode == RIGHT)
  {
    tuskAct4.x += 2;
  }
  
  if (lightning.isOverlapping(tuskAct4) == true)
  {
    tint(255, 0, 0);
  }
  lightning.render();
  lightning.y += 0.8;
 
  if (molten.isOverlapping(tuskAct4) == true)
  {
    tint(255, 0, 0);
  }
  molten.render();
  molten.y += 0.8;
  
  if (flood.isOverlapping(tuskAct4) == true)
  {
    tint(255, 0, 0);
  }
  flood.render();
  flood.y += 0.8;
  
  if (crumble.isOverlapping(tuskAct4) == true)
  {
    tint(255, 0, 0);
  }
  crumble.render();
  crumble.y += 0.8;
  
  if (wind.isOverlapping(tuskAct4) == true)
  {
    tint(255, 0, 0);
  }
  wind.render();
  wind.y += 0.8;
  
  if (energy.isOverlapping(tuskAct4) == true)
  {
    tint(255, 0, 0);
  }
  energy.render();
  energy.y += 0.8;
  
  if (dark.isOverlapping(tuskAct4) == true)
  {
    tint(255, 0, 0);
  }
  dark.render();
  dark.y += 0.8;
  
  if (light.isOverlapping(tuskAct4) == true)
  {
    tint(255, 0, 0);
  }
  light.render();
  light.y += 0.8;
  
  /*timer -= 0.0167;
  if(gameState == PLAY_STATE)
  {
    background(0);
    textSize(30);
    fill(255,0,0);
    text("Time: " +int(timer), 0, 30);
    text("Clicks: " + clickCount, 0, 60);
    rectTimer += 0.0167;
    
    rectTimer += 0.0167;
     
    if (rectTimer > 0.5)
    {   
      rectColor = color(random(255), random(255), random(255));
      rectX = random(width);
      rectY = random(height);
      rectTimer = 0;
    }
     
    fill(rectColor);
    rect(rectX, rectY, rectSize, rectSize);
     
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
    text("You Win!", 0, 52);
  }
   if (gameState == GAMEOVER_STATE)
   {
     background(255,0,0);
     fill(0)
     text("Game Over, Yeah!!!", 0, 52);
   }*/
}

/*void mouseReleased()
{
  if(gameState == PLAY_STATE)
  {
    if (mouseInRect(rectX, rectY y, rectSize, rectSize) == true)
    {
    clickCount+=1;
    }
  } 
}*/

/*boolean mouseInRect(float x, float y, float w, float h)
{
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y + h)
  {
    return true;
  }
  else
  {
    return false
  }
}*/

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
  
    boolean isMouseOver()
  {
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y + h)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

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



