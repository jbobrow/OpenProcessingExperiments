
SpriteObject ast;
SpriteObject ast1;
SpriteObject ast2;
int go = 0;
int lose = 1;
int win = 2;
int gamestate = 0;
float timer = 30;
class MouseRotatingUFO extends SpriteObject
{
  MouseRotatingUFO(String filename)
  {
    super(filename);
  }
    
  void lookAt(float otherX, float otherY)
  {
    this.rotation = degrees(atan2(otherY-this.y, otherX-this.x));
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
  }
    
  void update()
  {
    this.lookAt(mouseX, mouseY);
    this.x += (up - down) * this.directionX * this.speed;
    this.y += (up - down) * this.directionY * this.speed;
  }
}
MouseRotatingUFO UFO;
   
float down = 0;
float up = 0;
 
class Lazers extends SpriteObject
{
  Lazers(String filename)
  {
    super(filename);
  }
     
  void update()
  {
    this.rotation = degrees(atan2(this.directionY, this.directionX));
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
  }
}
  
int lazersCount = 25;
Lazers[] b = new Lazers[lazersCount];
int lazersIndex = 0;
PImage background;
    
void setup()
{
   
  
  size(1000, 1000);
  background = requestImage("background.jpg");

  UFO = new MouseRotatingUFO("UFO_clipped_rev_3.png");
  
  ast = new SpriteObject("asteroid.png");
  ast.x = 900;
  ast.directionX = 5;
  ast.directionY = 4;
  ast.speed = 1;
    
  ast1 = new SpriteObject("asteroid.png");
  ast1.x = 100;
  ast1.directionX = 2;
  ast1.directionY = 3;
  ast1.speed = 2;
     
  ast2 = new SpriteObject("asteroid.png");
  ast2.x = 250;
  ast2.directionX = -2;
  ast2.directionY = 1;
  ast2.speed = 3; 

  UFO.x = 500;
  UFO.y = 500;  
  UFO.directionX = 0;
  UFO.directionY = 1;
  UFO.speed = 4;
   
     
  for (int i = 0; i < lazersCount; i += 1)
  {
    b[i] = new Lazers("fireball.gif");
    b[i].x = -1000;
    b[i].y = -1000;
    b[i].s = 0.2;
  }
}
   
void draw()
{
image(background, width/2, height/2);
if (gamestate == go)
{
    imageMode(CORNER);
    timer-=0.0167;
    textSize(48);
    fill(0, 0, 255);
    text("VICTORY IN: "+(int)timer,640,50);
}

  ast.update();
  ast.render();
 
  ast1.update();
  ast1.render();
   
  ast2.update();
  ast2.render();
   
  UFO.update();
  UFO.render();

   if (UFO.isOverlapping(ast))
  {
   gamestate = lose;
  }
   
     if (UFO.isOverlapping(ast1))
  {
   gamestate = lose;
  }
   
     if (UFO.isOverlapping(ast2))
  {
   gamestate = lose;
  }

  for (int i = 0; i < lazersCount; i += 1)
  {
    b[i].update();
    b[i].render();
     
    if (b[i].isOverlapping(ast))
    {
      if (random(1) > 0.5)
      {
        ast.y = -500;
        ast.x = random(width);
      }
      else
      {
        ast.y = height + 500;
        ast.x = random(width);
      }
      
      ast.directionX = (UFO.x - ast.x) * 0.004;
      ast.directionY = (UFO.y - ast.y) * 0.004;
      ast.speed = 3;
    }
     if (b[i].isOverlapping(ast1))
    {
      if (random(1) > 0.5)
      {
        ast1.y = -200;
        ast1.x = random(width);
      }
      else
      {
        ast1.y = height + 200;
        ast1.x = random(width);
      }
     
      ast1.directionX = (UFO.x - ast1.x) * 0.004;
      ast1.directionY = (UFO.y - ast1.y) * 0.004;
      ast1.speed = 3;
    } 
     if (b[i].isOverlapping(ast2))
    {
      if (random(1) > 0.5)
      {
        ast2.y = -350;
        ast2.x = random(width);
      }
      else
      {
        ast2.y = height + 350;
        ast2.x = random(width);
      }
      
      ast2.directionX = (UFO.x - ast2.x) * 0.004;
      ast2.directionY = (UFO.y - ast2.y) * 0.004;
      ast2.speed = 2;
    }
  }

  if (gamestate==lose)
{
  
  fill(255, 0, 0);
  rect(0,0,1000,1000);
  fill(0);
  textSize(64);
  text("YOU LOST",360,500);
   
}
   if ( timer < 0)
   {
     timer = 0;
     gamestate = win;
   }
  if (gamestate == win)
  {
  fill(0, 255, 0);
  rect(0,0,1000,1000);
  textSize(64);
  fill(0);
  text("WINNER", 360, 500);
  }

}
  
void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    b[lazersIndex].directionX = UFO.directionX;
    b[lazersIndex].directionY = UFO.directionY;
    b[lazersIndex].x = UFO.x;
    b[lazersIndex].y = UFO.y;
    b[lazersIndex].speed = 20;
    lazersIndex += 1;
    if (lazersIndex >= lazersCount)
    {
      lazersIndex = 0;
    }
  }
}
   
void keyPressed()
{
    if (key == 'w')
    {
      up = 1;
    }
    if (key == 's')
    {
      down = 1;
    }
}
   
void keyReleased()
{
    if (key == 'w')
    {
      up = 0;
    }
    if (key == 's')
    {
      down = 1;
    }
}
  
  
class SpriteObject
{
  float directionX;
  float directionY;
  float rotation = 0.0;
  float speed;

  float s = 0.25;
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  
  PImage img;
  boolean loaded = false;
  boolean dead = false;
        
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
     
  void update()
  {
     
     
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
         
    this.y += directionY * speed;
    this.x += directionX * speed;
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
      rotate(radians(0));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



