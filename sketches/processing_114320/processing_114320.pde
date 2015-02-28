
SpriteObject[] mysprites = new SpriteObject [10];
int currentSprite = 0; 
float timer = 0; 


void setup()
{
  size(500, 500); 

  mysprites[0] = new SpriteObject("animal0.jpg"); 
  mysprites[1] = new SpriteObject("animal1.jpg"); 
  mysprites[2] = new SpriteObject("animal2.jpg"); 
  mysprites[3] = new SpriteObject("animal3.jpg"); 
  mysprites[4] = new SpriteObject("animal4.jpg"); 
  mysprites[5] = new SpriteObject("animal5.jpg"); 
  mysprites[6] = new SpriteObject("animal6.jpg"); 
  mysprites[7] = new SpriteObject("animal7.jpg"); 
  mysprites[8] = new SpriteObject("animal8.jpg");
  mysprites[9] = new SpriteObject("animal9.jpg");  
          


}



void draw()
{
  background(0); 
  timer += 0.1;
  
  if (timer > 6)
  {
    currentSprite += 1; 
    timer = 0; 
  }
  
  if (currentSprite > 9)
  {
   currentSprite = 0; 
  }
  
   if (keyCode == RIGHT)
 {
   timer = timer + 0.1;
   println("right arrow pressed"); 
 }
   if (keyCode == LEFT)
   {
     timer = timer - 0.1;
     println("left arrow pressed"); 
   }
   
   if (timer < 0.1)
   {
     timer = 0.1; 
   }


  
  
    if (currentSprite < 0)
  {
   currentSprite = 0; 
  }

  
  
    mysprites[currentSprite].render(); 
}
  
 void keyReleased()
 {
  if (key == CODED)
  {
  if (keyCode == DOWN)
  {
     currentSprite -= 1;   
     
  }
   if (keyCode == UP)
  {
    currentSprite = (int)random(0, 9); 
  }
 
  }
 }
  
class SpriteObject
{
  float x = width/2;
  float y = height/2;
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
}





