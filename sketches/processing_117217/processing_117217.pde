
float x = 0;
float speed = 3.0;
float left = 0;
float right = 0;
float timer = 11;

int gameState = 0;
int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;

int ellipseX = 25;
PImage StarField1;

SpriteObject Asteroid;
SpriteObject Asteroid2;
SpriteObject Asteroid3;
SpriteObject Asteroid4;
SpriteObject Asteroid5;
SpriteObject Asteroid6;
SpriteObject Asteroid7;
SpriteObject Asteroid8;
SpriteObject Asteroid9;
 
void setup()
{
  size(500, 500);
  
  StarField1 = requestImage("Star Field.jpg");
  
  Asteroid = new SpriteObject("UFO.png");
  Asteroid.x = ellipseX;
  Asteroid.y = height/1.1;
   
  Asteroid2 = new SpriteObject("Asteroid.png");
  Asteroid2.y = width/2;
  Asteroid2.x = 30;
  Asteroid2.s = 0.3;
  
  Asteroid3 = new SpriteObject("Asteroid.png");
  Asteroid3.y = 0;
  Asteroid3.x = 400;
  Asteroid3.s = .4;
  
  Asteroid4 = new SpriteObject("Asteroid.png");
  Asteroid4.y = 0;
  Asteroid4.x = 340;
  Asteroid4.s = .2;
  
  Asteroid5 = new SpriteObject("Asteroid.png");
  Asteroid5.y = -50;
  Asteroid5.x = 2250;
  Asteroid5.s = .15;
  
  Asteroid6 = new SpriteObject("Asteroid.png");
  Asteroid6.y = -120;
  Asteroid6.x = 150;
  Asteroid6.s = .35;
  
  Asteroid7 = new SpriteObject("Asteroid.png");
  Asteroid7.y = -40;
  Asteroid7.x = 100;
  Asteroid7.s = .075;
  
  Asteroid8 = new SpriteObject("Asteroid.png");
  Asteroid8.y = 10;
  Asteroid8.x = 80;
  Asteroid8.s = .45;
  
  Asteroid9 = new SpriteObject("Asteroid.png");
  Asteroid9.y = 40;
  Asteroid9.x = 275;
  Asteroid9.s = .43;
  
}
 
void draw()
{
  Asteroid.x += (right - left) * speed;
  timer -= 0.0167;
  
  if (gameState == PLAY_STATE)
  {
  image(StarField1, 0, 0, width * 2, height * 2);
  tint(255);
  Asteroid.render();
   
  if (Asteroid2.isOverlapping(Asteroid) == true)
  {
    gameState = 1;
  }
  else
  {
    tint(255);
  }
    
  Asteroid2.render();
  Asteroid2.y += 1;
 
  if (Asteroid3.isOverlapping(Asteroid) == true)
  {
    gameState = 1;
  }
  else
  {
    tint(255);
  }
   
  Asteroid3.render();
  Asteroid3.y += 0.8;
  
  if (Asteroid4.isOverlapping(Asteroid) == true)
  {
    gameState = 1;
  }
  else
  {
    tint(255);
  }
    
  Asteroid4.render();
  Asteroid4.y += 1.2;
  
  if (Asteroid5.isOverlapping(Asteroid) == true)
  {
    gameState = 1;
  }
  else
  {
    tint(255);
  }
    
  Asteroid5.render();
  Asteroid5.y += 1.8;
  
  if (Asteroid6.isOverlapping(Asteroid) == true)
  {
    gameState = 1;
  }
  else
  {
    tint(255);
  }
    
  Asteroid6.render();
  Asteroid6.y += 1;
  
  if (Asteroid7.isOverlapping(Asteroid) == true)
  {
    gameState = 1;
  }
  else
  {
    tint(255);
  }
    
  Asteroid7.render();
  Asteroid7.y += .7;
  
  if (Asteroid8.isOverlapping(Asteroid) == true)
  {
    gameState = 1;
  }
  else
  {
    tint(255);
  }
    
  Asteroid8.render();
  Asteroid8.y += 1.2;
  
  if (Asteroid9.isOverlapping(Asteroid) == true)
  {
    gameState = 1;
  }
  else
  {
    tint(255);
  }
    
  Asteroid9.render();
  Asteroid9.y += 1.4;
  
  textSize(70);
  text("TIME: " + (int)timer, 125, 60);
  }
  
  if (timer <= 1)
  {
    gameState = 1;
  }
  else if (Asteroid.x >= (width))
  {
    gameState = 2;
  }
  
  if (gameState == GAMEOVER_STATE)
  {
    background(255, 0, 0);
    fill(0);
    textSize(70);
    text("GAME OVER", 45, 60);
  }
  
    if (gameState == WIN_STATE)
  {
    background(255, 255, 255);
    fill(0);
    textSize(70);
    text("YOU WON!", 70, 60);
    timer = 10000;
  }
  
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = .15;
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
      left = .375;
    }
    if (keyCode == RIGHT)
    {
      right = .375;
    }
  }
  
}


