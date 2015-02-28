
float timer = 50;
int gamestate = 0;
int play = 0;
int gameover = 1;
int winstate = 2;
SpriteObject rock;
SpriteObject rock1;
SpriteObject rock2;
var beta = new Audio("beta.mp3");


class MouseRotatingRocket extends SpriteObject
{
  MouseRotatingRocket(String filename)
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
  

MouseRotatingRocket rocket;
  

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
 
int lazersCount = 10;
Lazers[] b = new Lazers[lazersCount];
int lazersIndex = 0;
 PImage background;
   
void setup()
{
  
    textSize(30);
  
  size(800, 800, P2D);
    
  background = requestImage("trip.png");
  beta.play();


    
  rocket = new MouseRotatingRocket("rocket.png");
  rock = new SpriteObject("rock.png");
  rock.directionX = 1;
  rock.directionY = 1;
  rock.speed = 1;
   
  rock1 = new SpriteObject("rock.png");
  rock1.directionX = 1;
  rock1.directionY = 3;
  rock1.speed = 1.5;
    
   rock2 = new SpriteObject("rock.png");
  rock2.directionX = -3;
  rock2.directionY = 1;
  rock2.speed = 1.5;  
   
    
    
  rocket.x = 400;
  rocket.y = 400;
    
  rocket.directionX = 0;
  rocket.directionY = 1;
    
  rocket.speed = 4;
  
    
  for (int i = 0; i < lazersCount; i += 1)
  {
    b[i] = new Lazers("lazers.png");
    b[i].x = -1000;
    b[i].y = -1000;
    b[i].s = 0.2;
  }
  
 
 
}
  
void draw()
{

  
if(background.width > 0)
image(background, width/2, height/2);


if (gamestate == play)
{
 
    imageMode(CORNER);
    timer-=0.0167;
    textSize(32);
    fill(#E468F5);
    text("Time: "+(int)timer,0,50);
}


  
  stroke(random(50, 255), random(50, 255), random(50, 255));
  strokeWeight(random(.00000000001, 10));
  line(50, 0, 50, 900);
  line(100, 0, 100, 900);
  line(150, 0, 150, 900);
  line(200, 0, 200, 900);
  line(250, 0, 250, 900); 
  line(300, 0, 300, 900);
  line(350, 0, 350, 900);
  line(400, 0, 400, 900);
  line(450, 0, 450, 900);
  line(500, 0, 500, 900);
  line(550, 0, 550, 900);
  line(600, 0, 600, 900);  
  line(650, 0, 650, 900);
  line(700, 0, 700, 900);
  line(750, 0, 750, 900);
  line(800, 0, 800, 900);






  rock.update();
  rock.render();

  rock1.update();
  rock1.render();
  
  rock2.update();
  rock2.render();
  
  rocket.update();
  rocket.render();



    
   if (rocket.isOverlapping(rock))
  {
   gamestate = gameover;
  }
  
     if (rocket.isOverlapping(rock1))
  {
   gamestate = gameover;
  }
  
     if (rocket.isOverlapping(rock2))
  {
   gamestate = gameover;
  }
  
  
  
  
  
  
  for (int i = 0; i < lazersCount; i += 1)
  {
    b[i].update();
    b[i].render();
    
    if (b[i].isOverlapping(rock))
    {
      if (random(1) > 0.5)
      {
         // come from the top
        rock.y = -200;
        rock.x = random(width);
      }
      else
      {
        // come from the bottom
        rock.y = height + 200;
        rock.x = random(width);
      }
      rock.speed = 3;
      rock.directionX = (rocket.x - rock.x) * 0.003;
      rock.directionY = (rocket.y - rock.y) * 0.003;
    }
    
    
    
    
    
    
     if (b[i].isOverlapping(rock2))
    {
      if (random(1) > 0.5)
      {
         // come from the top
        rock2.y = -200;
        rock2.x = random(width);
      }
      else
      {
        // come from the bottom
        rock2.y = height + 200;
        rock2.x = random(width);
      }
      rock2.speed = 2.5;
      rock2.directionX = (rocket.x - rock2.x) * 0.004;
      rock2.directionY = (rocket.y - rock2.y) * 0.004;
    }
    
    
        
     if (b[i].isOverlapping(rock1))
    {
      if (random(1) > 0.5)
      {
         // come from the top
        rock1.y = -200;
        rock1.x = random(width);
      }
      else
      {
        // come from the bottom
        rock1.y = height + 200;
        rock1.x = random(width);
      }
      rock1.speed = 3;
      rock1.directionX = (rocket.x - rock1.x) * 0.002;
      rock1.directionY = (rocket.y - rock1.y) * 0.002;
    }  
    
    
  }
  
  
  
  
  
  
  if (gamestate==gameover)
{
 
  fill(#B90606);
  rect(0,0,800,800);
  fill(#000000);
  textSize(35);
  text("YOU LOSE!",300,400);
  
}
 
   if ( timer < 0)
   {
     timer = 0;
     gamestate = winstate;

   }
   if (gamestate == winstate)
   {
  
  fill(#000000);
  rect(0,0,800,800);
  textSize(35);
  fill(#91F568);
  text("YOU WIN!", 300, 400);
      
      
   rock.directionX = (rocket.x - rock.x) * 0.0000000000001;
   rock.directionY = (rocket.y - rock.y) * 0.0000000000001;
      
   rock1.directionX = (rocket.x - rock1.x) * 0.000000000001;
   rock1.directionY = (rocket.y - rock1.y) * 0.000000000001;
   
   rock2.directionX = (rocket.x - rock2.x) * 0.000000000001;
   rock2.directionY = (rocket.y - rock2.y) * 0.000000000001;
  
  
  
  
  
  
}
    
  

  
}
 
void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    b[lazersIndex].x = rocket.x;
    b[lazersIndex].y = rocket.y;
    b[lazersIndex].speed = 15;
    b[lazersIndex].directionX = rocket.directionX;
    b[lazersIndex].directionY = rocket.directionY;
    lazersIndex += 1;
    if (lazersIndex >= lazersCount)
    {
      lazersIndex = 0;
    }
  }
}
  
void keyPressed()
{
    if (key == 'u')
    {
      up = 2;
    }

}
  
void keyReleased()
{
    if (key == 'u')
    {
      up = 0;
}
}
 
 
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
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
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



