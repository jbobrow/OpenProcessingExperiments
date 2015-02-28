
SpriteObject[] mysprites = new SpriteObject[10];
int currentSprite = 0; 
float timer = 0; 
float hue = 0;
float offset = 1;
float stars = 0; 
float counter = 1;

void setup()
{
  size(500, 500); 
 
 
 
  mysprites[0] = new SpriteObject("Galaga_HomeScreen.gif"); 
  mysprites[1] = new SpriteObject("Galaga_SpaceShip.jpg"); 
  mysprites[2] = new SpriteObject("Galaga_Bee.png"); 
  mysprites[3] = new SpriteObject("Galaga_Butterfly.jpg"); 
  mysprites[4] = new SpriteObject("Galaga_FlagshipBlue.png"); 
  mysprites[5] = new SpriteObject("Galaga_FlagshipGreen.png"); 
  mysprites[6] = new SpriteObject("Galaga_Level2.jpg"); 
  mysprites[7] = new SpriteObject("Galaga_YouWin.jpg"); 
  mysprites[8] = new SpriteObject("SuperExplosion.jpg");
  mysprites[9] = new SpriteObject("Missile.gif");
  



}


void draw()
{
  background(0);
 
  
  if (currentSprite == 0)
  {
   mysprites[currentSprite].render();
  
  }
  else if (currentSprite == 1)
  {
  mysprites[1].renderSpaceShip();
  mysprites[2].renderBee();
  mysprites[3].renderButterfly();
  mysprites[4].renderFlagshipBlue();
  mysprites[5].renderFlagshipGreen();

  counter += .1 ;
    
    
    
    if (counter > 10 && counter < 20)
    {
    mysprites[9].renderMissile(); 
    
    }
    
    
    if (counter > 30 && counter < 50)
    {
    mysprites[8].renderExplosion(); 
    
    }
    
    
    if (counter > 50)
    {
    
    mysprites[7].renderGalagaYouWin(); 
    }

  }
  
  
  
  
/*if (stars < 100)
  {
    int starPosition1 = 1; 
    int starPosition2 = 2; 
    starPosition1 += 2; 
    starPosition2 +=1; 
    stars = stars +=.1;
    pushMatrix(); 
    translate(starPosition1, starPosition2); 
    fill (random(0,255), random(0, 255), random(255));
    ellipse (5,5,5,5);
    popMatrix();
  }
 */
 
 
 
 
 
 
 
 


}




void keyReleased()
{
  if (currentSprite == 0)
  {
    if(key == ENTER)
    {
     currentSprite = currentSprite + 1; 
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
  float s = 1;
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
      scale(2);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
void renderSpaceShip()
  {
    float x = width/2;
    float y = height/2;
    float w = -1.0;
    float h = -1.0;
    float rotation = 0.0;
    float s = 1;
    PImage img;
    boolean loaded = false;
    
    
    
    
    
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
      translate(250, 450);
      rotate(radians(this.rotation));
      scale(0.2);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
void renderBee()
  {
    float x = width/2;
    float y = height/2;
    float w = -1.0;
    float h = -1.0;
    float rotation = 0.0;
    float s = 1;
    PImage img;
    boolean loaded = false;
    
    
    
    
    
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
      translate(250, 150);
      rotate(radians(this.rotation));
      scale(0.2);
      image(this.img, 0, 0, this.w, this.h);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }

void renderButterfly()
  {
    float x = width/2;
    float y = height/2;
    float w = -1.0;
    float h = -1.0;
    float rotation = 0.0;
    float s = 1;
    PImage img;
    boolean loaded = false;
    
    
    
    
    
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
      translate(250, 125);
      rotate(radians(this.rotation));
      scale(0.2);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
void renderExplosion()
  {
    float x = width/2;
    float y = height/2;
    float w = -1.0;
    float h = -1.0;
    float rotation = 0.0;
    float s = 1;
    PImage img;
    boolean loaded = false;
    
    
    
    
    
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
      translate(250, 130);
      rotate(radians(this.rotation));
      scale(.7);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
      
       
    }
  }
void renderFlagshipBlue()
  {
    float x = width/2;
    float y = height/2;
    float w = -1.0;
    float h = -1.0;
    float rotation = 0.0;
    float s = 1;
    PImage img;
    boolean loaded = false;
    
    
    
    
    
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
      translate(250, 100);
      rotate(radians(this.rotation));
      scale(0.2);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
void renderFlagshipGreen()
  {
    float x = width/2;
    float y = height/2;
    float w = -1.0;
    float h = -1.0;
    float rotation = 0.0;
    float s = 1;
    PImage img;
    boolean loaded = false;
    
    
    
    
    
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
      translate(250, 70);
      rotate(radians(this.rotation));
      scale(0.2);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
void renderGalagaYouWin()
  {
    float x = width/2;
    float y = height/2;
    float w = -1.0;
    float h = -1.0;
    float rotation = 0.0;
    float s = 1;
    PImage img;
    boolean loaded = false;
    
    
    
    
    
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
      translate(width/2, height/2);
      rotate(radians(this.rotation));
      scale(1);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
  
void renderMissile()
  {
    float x = width/2;
    float y = height/2;
    float w = -1.0;
    float h = -1.0;
    float rotation = 0.0;
    float s = 3;
    PImage img;
    boolean loaded = false;
    
    
    
    
    
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
      translate(250, 300);
      
      scale(.3);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}
  


