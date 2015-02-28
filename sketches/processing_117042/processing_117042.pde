
SpriteObject daddy;
SpriteObject[] yoshis = new SpriteObject[8];
float x = 0;
float speed = 3.0;
float left = 0;
float right = 0;
color daddyColor = color(255);
boolean gameStart, gameEnd, gameWin, gameNew;
float timer = 0;
float timer2 = 10;
float timer3 = 0;
float rate = 0;
PImage  bioImage;


 
 
 
void setup()
 
{
    size(500,500);
    bioImage = requestImage("bio.jpg");
    daddy = new SpriteObject("daddy.png");
    daddy.x =50.0;
    daddy.y = width / 1.1;
    daddy.s =1.0;
 
     
    for (int i = 0; i < 8; i++)
    {
      yoshis[i] = new SpriteObject("yoshi.png");
      yoshis[i].x = random(500 +50);
      yoshis[i].y = width / 12.0;
      yoshis[i].s =.70;
       yoshis[i].speed =random(1.0, 2.0);
    }
    
    gameStart = false;
    //gameEnd = false;
}
 
 
void draw()
{
  if (gameStart==false)
  {
  background(#040A48);
  textSize(32);
  text("CLICK TO START",190,250);
  }
  
  
  background(0);
  //fill (255);
    if (bioImage.width > 0)
{
  image(bioImage, 250,250,500,500);
 
}


   
   
  for (int i = 0; i < 8; i++)
    {
      if (yoshis[i].isOverlapping(daddy) && yoshis[i].destroyed == false)
      {
        tint(255,0,0);
        daddyColor = color(0, 225, 0 );
        gameEnd=true;
        gameStart = false;
      }
      
        yoshis[i].render();
        yoshis[i].y += yoshis[i].speed;
         
        if (yoshis[i].y > height)
        {
          yoshis[i].y = -50;
          yoshis[i].x = random(width);
        }

      //else
      //{
      //tint(255);
      //}
      //yoshis[i].render();
      //yoshis[i].y += yoshis[i].speed;  
   
     // if (yoshis[i].y > height)
      //{
       // yoshis[i].y = random(width);
      //}

    }
   
   //move spriteObject
  x += (right - left) * speed;
  daddy.x = x;
  if (daddy.isMouseOverlapping() == false)
  {
    tint(daddyColor);
    daddy.render();
    daddyColor = color(255);
    
    
  }
  
  if (gameStart==false)
  {
  background(#C60202);
  textSize(32);
  text("MOUSE CLICK TO START",65,250);
  textSize(10);
  text("LEFT ARROW MOVES LEFT", 50, 350);
  textSize(10);
  text("RIGHT ARROW MOVES RIGHT", 315, 350);
  fill(0);
  textSize(20);
  text("AVOID THE EGGS", 165, 450);
  }
   if(mousePressed)
  {
    gameStart = true;
  }
  if (gameStart == true)
  {
  timer3 += .016;
   
  if(timer3 >1)
  {
    timer2 -= 1;
    timer3 = 0;
  }
  timer += rate ;
  }
  
  fill(#FFFFFF);
  textSize(18);
  text("TIME REMAINING: "+(int)timer2,0,26);
  
  if (gameEnd==true)
  {
  background(#C60202);
  textSize(30);
  text("DONE.",65,250);
  }
  
   if (gameWin==true)
  {
  background(#62d4ff);
  textSize(50);
  text("NICE",65,250);
  textSize(25);
  text("PRESS R FOR REPLAY",65,350);
  }
  
  if(timer2 < 1)
  {
    gameWin = true;
    gameStart = false;
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
 
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float speed;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
  boolean destroyed = false;
    
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
    
   boolean isMouseOverlapping()
   {
     if (mouseX> (this.x - (this.w * 0.5 * this.s))
       && mouseX <(this.x + (this.w * 0.5 * this.s))
       &&mouseY > (this.y - (this.w * 0.5 * this.s))
       &&mouseY < (this.y + (this.w * 0.5 * this.s)))
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



