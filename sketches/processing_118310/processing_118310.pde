
SpriteObject[] mysprites = new SpriteObject[8];
PImage medievalCastle; 
int currentSprite = 0; 
float timer = 0; 
void setup()
{
 background(0); 
  size(500, 500);
  mysprites[0] = new SpriteObject ("soldier.png");
  mysprites[1] = new SpriteObject ("zombie.png");
  mysprites[2] = new SpriteObject ("boomer.png");
  mysprites[3] = new SpriteObject ("knight.png");
  mysprites[4] = new SpriteObject ("tombstone.png");
  mysprites[5] = new SpriteObject ("medievalCastle.jpg"); 
  mysprites[6] = new SpriteObject ("graveyard.jpg");
  mysprites[7] = new SpriteObject ("zombieCity.jpg");
  
  
  
  
  mysprites[0].y = 300;
  mysprites[0].x = 350;  
  mysprites[0].directionX = 1; 
  mysprites[0].directionY = 1; 
  mysprites[0].speed = 3; 
  mysprites[0].s = 0.2;
  
    mysprites[1].y = 300;
    mysprites[1].x = 350;  
    mysprites[1].directionX = .5; 
    mysprites[1].directionY = .5; 
    mysprites[1].speed = 2.50;
   
    mysprites[3].y = 300; 
    mysprites[3].directionX = 2; 
    mysprites[3].directionY =1; 
    mysprites[3].speed =4; 
    
    
    mysprites[4].y = 300;
    mysprites[4].x = 350;   
    mysprites[4].speed =4; 
    
    
    
    mysprites[2].y = 250; 
    mysprites[2].x = 200; 
    
    
    mysprites[5].x = 250; 
    mysprites[5].y = 250; 
    
    mysprites[6].x = 310; 
    mysprites[6].y = 250;
   
   mysprites[7].x = 310; 
   mysprites[7].y = 150;  


}



void draw()
{
  background(75);
  timer += .167; 
  println(timer); 
  
  if (timer<40)
  {
  mysprites[5].render();  
  mysprites[3].update(); 
  mysprites[3].render(); 
  mysprites[3].s=.5;
  }
  
  if (timer > 40 && timer <80)
  {
    
  mysprites[6].render();   
  mysprites[4].update(); 
  mysprites[4].render(); 
  mysprites[4].s=.5;
  
  }
  
  
  if (timer > 80 && timer <214)
  {
    
  mysprites[7].render();   
    
  mysprites[1].update();
  mysprites[1].render();
  mysprites[1].s =.5;
  
  
  mysprites[0].update(); 
  mysprites[0].render(); 
  mysprites[0].s =.3;
  }
  
  
  if(timer > 214)
  {
    
    mysprites[7].render();
  mysprites[2].update();
  mysprites[2].render(); 
  mysprites[2].s=.5;
  }
 
  
 
  
 
  
   

}


class Pray
{
  float x;
  float y;
  float directionX = 0;
  float directionY = 1;
  float speed = 3;
  color carColor;
   
   
  void bounce()
  {
    // Bounce the car if it goes off screen
     
    if (this.x > width - 25 && this.directionX > 0)
    {
      this.directionX *= -1;
      this.x = width - 25;
    }
    if (this.x < 25 && this.directionX < 0)
    {
      this.directionX *= -1;
      this.x = 25;
    }
    if (this.y > height - 50 && this.directionY > 0)
    {
      this.directionY *= -1;
      this.y = height - 50;
    }
    if (this.y < 50 && this.directionY < 0)
    {
      this.directionY *= -1;
      this.y = 50;
    }
     
    // Move the car by the direction and speed
    this.x += this.directionX * speed; 
    this.y += this.directionY * speed;
  }
   
  void stopit()
  {
    this.speed = 0;
  }
   
  void go(float s)
  {
    this.speed = s; 
  }
   
 
   
  void render()
  {
    rectMode(CENTER);
    fill(this.carColor);
    rect(this.x, this.y, 50, 100);
  }
}


class Predator extends SpriteObject {
  Predator(String filename) 
  { 
    super(filename); 
  } 
  void update()
  {
     
    this.y += mysprites[0].directionY *speed;
    this.x += mysprites[0].directionX *speed;
  }
}



class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float directionX;
  float directionY;
  float speed;
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
    
  boolean isOverlappingRect(float otherLeft, float otherTop, float rwidth, float rheight)
  {
   float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
      
    float otherRight = otherLeft + rwidth;
    float otherBottom = otherTop + rheight;
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
   
  void update()
  {
    
    // If hitting Right
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
        
    }
     
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      ; 
    }
     
    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height -(this.h * this.s * .5);
      this.directionY = -this.directionY;
        

    }
     
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * .5);
      this.directionY = -this.directionY;
      ; 
    }
     
    // Move the sprite
    this.y += random(directionY) * random(speed);
    this.x += directionX * random(speed);
     
  
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



