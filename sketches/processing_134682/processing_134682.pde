
SpriteObject luigi;
SpriteObject luigileft;
SpriteObject luigiright;
SpriteObject[] koopas = new SpriteObject[6];
SpriteObject[] stars = new SpriteObject[8];
PImage bg;
int KoopaScore = 0;
int StarScore = 0;
int gameState = 0;
float timer = 0;
 
void setup()
{
  size(1200,720);
  
  //Set up Luigi sprites as sprite objects
  luigi = new SpriteObject("luigidefault.png");
  luigileft = new SpriteObject("luigileft.png");
  luigiright = new SpriteObject("luigiright.png");
   
 luigi = new SpriteObject("luigidefault.png");
 luigi.x = width/2;
 luigi.y = 600;
 luigi.s = .5;
  
 for (int i = 0; i < 8; i++)
 {
  stars[i] = new SpriteObject("stargood.png");
  stars[i].x = random(width);
  stars[i].y = 0;
  stars[i].speed = random(2, 4);
 }
  
 for (int i = 0; i < 6; i++)
 {
  koopas[i] = new SpriteObject("koopabad.png");
  koopas[i].x = random (width);
  koopas[i].y =0;
  koopas[i].speed = random(3, 5);
 }
  
 bg = requestImage("mariobg.png");
  
}
 
void draw()
{
  background(0);
  image(bg,595.5,335,width,height);
   
  if (StarScore >= 10)
  {
    gameState = 1;
  }
  if (KoopaScore == 3)
  {
    gameState = 2;
  }
   
  if (gameState == 0)
  {
    fill(255);
    textSize(35);
    text("Stars Collected: " + StarScore + " Stars!", 125,75);
    text("Koopas Hit: " + KoopaScore + " Koopas hit.", 610,75);
     for (int i = 0; i < 8; i++)
     {
        if (stars[i].isOverlapping(luigi) && stars[i].destroyed == false)
      {
        StarScore += 1;
        stars[i].destroyed = true;
   
      }
        stars[i].render();
        stars[i].y += stars[i].speed;
         
        if (stars[i].y > height)
        {
          stars[i].y = -25;
          stars[i].x = random(width);
        }
     }
      
      for (int i = 0; i < 6; i++)
     {
        if (koopas[i].isOverlapping(luigi) && koopas[i].destroyed == false)
      {
        KoopaScore += 1;
        koopas[i].destroyed = true;
   
      }
        koopas[i].render();
        koopas[i].y += koopas[i].speed;
         
        if (koopas[i].y > height)
        {
          koopas[i].y = -25;
          koopas[i].x = random(width);
        }
     }
    
    luigi.render();
  }
  if (gameState == 1)
  {
     fill(255);
    textSize(40);
   text("YOU WON!!", 100,50);
  }
  if (gameState == 2)
  {
     fill(255);
    textSize(40);
   text("YOU LOSE!!", 100,50);
  }
   
   
}
 
  
  
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      luigi.img = luigileft.img;
      luigi.x -= 9.5;
     
    }
    if (keyCode == RIGHT)
    {
      luigi.img = luigiright.img;
      luigi.x += 9.5;
    }
  }
}
 
void keyReleased()
{
  luigi.img = luigi.img;
}
 
 
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  float speed;
  PImage img;
  boolean loaded = false;
  boolean destroyed = false;
    
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
    
   boolean isMouseOverlapping()
   {
     if (mouseX > (this.x - (this.w * 0.5 * this.s))
     && mouseX < (this.x + (this.w * 0.5 * this.s))
     && mouseY > (this.y - (this.h * 0.5 * this.s))
     && mouseX < (this.y + (this.h * 0.5 * this.s)))
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
      
     
        float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s);  
      
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
 
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
      
    if (loaded && destroyed == false)
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


