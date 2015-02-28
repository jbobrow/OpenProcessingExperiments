
SpriteObject link;
SpriteObject wallmaster;
SpriteObject wallmaster1;
SpriteObject wallmaster2;
SpriteObject wallmaster3;
SpriteObject wallmaster4;
SpriteObject wallmaster5;
SpriteObject wallmaster6;
SpriteObject wallmaster7;
SpriteObject wallmaster8;
SpriteObject wallmaster9;
SpriteObject wallmaster10;
SpriteObject wallmaster11;
SpriteObject wallmaster12;
SpriteObject wallmaster13;
SpriteObject wallmaster14;
SpriteObject wallmaster15;
SpriteObject wallmaster16;
SpriteObject wallmaster17;
SpriteObject wallmaster18;
SpriteObject wallmaster19;
SpriteObject wallmaster20;



PImage dungeon;
float timer = 10;
int gamestate = 0;
int play = 0;
int gameover = 1;
int winstate = 2;




void setup()
{
  
  
  textSize(25);
  
  
  
  size(700,700);
  link = new SpriteObject("link.png");
  link.x = width/2;
  link.y = 600;
  link.s = .1;
   
  wallmaster = new SpriteObject("wallmaster.png");
  wallmaster.x = random(700);
  wallmaster.y = 0;
  wallmaster.s = .5;
  
  
  
  wallmaster1 = new SpriteObject("wallmaster.png");
  wallmaster1.x = random(600);
  wallmaster1.y = 0;  
  wallmaster1.s = .5;


  wallmaster2 = new SpriteObject("wallmaster.png");
  wallmaster2.x = random(700);
  wallmaster2.y = 0;
  wallmaster2.s = .5;
  
  
  wallmaster3 = new SpriteObject("wallmaster.png");
  wallmaster3.x = random(600);
  wallmaster3.y = 0;
  wallmaster3.s = .5;
  
  wallmaster4 = new SpriteObject("wallmaster.png");
  wallmaster4.x = random(700);
  wallmaster4.y = 0; 
  wallmaster4.s = .5;

  wallmaster5 = new SpriteObject("wallmaster.png");
  wallmaster5.x = random(600);
  wallmaster5.y = 0;
  wallmaster5.s = .5;
  
  
  wallmaster6 = new SpriteObject("wallmaster.png");
  wallmaster6.x = random(700);
  wallmaster6.y = 0;
  wallmaster6.s = .5;
  
  wallmaster7 = new SpriteObject("wallmaster.png");
  wallmaster7.x = random(600);
  wallmaster7.y = 0; 
  wallmaster7.s = .5;

  wallmaster8 = new SpriteObject("wallmaster.png");
  wallmaster8.x = random(700);
  wallmaster8.y = 0;
  wallmaster8.s = .5;
  
  
  wallmaster9 = new SpriteObject("wallmaster.png");
  wallmaster9.x = random(600);
  wallmaster9.y = 0;
  wallmaster9.s = .5;
 
  wallmaster10 = new SpriteObject("wallmaster.png");
  wallmaster10.x = random(700);
  wallmaster10.y = 0; 
  wallmaster10.s = .5;

  wallmaster11 = new SpriteObject("wallmaster.png");
  wallmaster11.x = random(600);
  wallmaster11.y = 0;
  wallmaster11.s = .5;


  wallmaster12 = new SpriteObject("wallmaster.png");
  wallmaster12.x = random(700);
  wallmaster12.y = 0; 
  wallmaster12.s = .5;

  wallmaster13 = new SpriteObject("wallmaster.png");
  wallmaster13.x = random(600);
  wallmaster13.y = 0;
  wallmaster13.s = .5;
  
  
  wallmaster14 = new SpriteObject("wallmaster.png");
  wallmaster14.x = random(700);
  wallmaster14.y = 0;
  wallmaster14.s = .5;
 
  wallmaster15 = new SpriteObject("wallmaster.png");
  wallmaster15.x = random(600);
  wallmaster15.y = 0; 
  wallmaster15.s = .5;
  
  wallmaster16 = new SpriteObject("wallmaster.png");
  wallmaster16.x = random(700);
  wallmaster16.y = 0;
  wallmaster16.s = .5;
 
  wallmaster17 = new SpriteObject("wallmaster.png");
  wallmaster17.x = random(600);
  wallmaster17.y = 0; 
  wallmaster17.s = .5;
  
  wallmaster18 = new SpriteObject("wallmaster.png");
  wallmaster18.x = random(700);
  wallmaster18.y = 0;
  wallmaster18.s = .5;
    
  wallmaster19 = new SpriteObject("wallmaster.png");
  wallmaster19.x = 0;
  wallmaster19.y = 600;
  wallmaster19.s = .5;   
  
  wallmaster20 = new SpriteObject("wallmaster.png");
  wallmaster20.x = 700;
  wallmaster20.y = 600;
  wallmaster20.s = .5;
  
  dungeon = requestImage("dungeon.png");
     
}
 
void draw()
{
  background(0);
  image(dungeon, 350, 350, 800, 800);
  


if (gamestate == play)
{

    imageMode(CORNER);
    timer-=0.0167;
    textSize(32);
    fill(#E468F5);
    text("Time: "+(int)timer,0,50);
}
  
  link.render();
  ///////////////////////////////////////
   


   
 
  wallmaster.y += random(5);
  wallmaster.render();
  
  
  wallmaster1.y += 3;
  wallmaster1.render();
  
  
  
  
  wallmaster2.y += random(5.5);
  wallmaster2.render();
  
 
  wallmaster3.y += random(6);
  wallmaster3.render();
  
  
  wallmaster4.y += random(6);
  wallmaster4.render();
  

  wallmaster5.y += random(8);
  wallmaster5.render();
  
  

  wallmaster6.y += 2.5;
  wallmaster6.render();
  

  wallmaster7.y += random(6);
  wallmaster7.render();
  
 
  wallmaster8.y += random(3);
  wallmaster8.render();
  
  
  wallmaster9.y += random(5);
  wallmaster9.render();
  
  
  
 
  wallmaster10.y += 4;
  wallmaster10.render();
  
  wallmaster11.y += random(6);
  wallmaster11.render();
  
  
  wallmaster12.y += random(3);
  wallmaster12.render();
  

  wallmaster13.y += random(5);
  wallmaster13.render();
  
  
  
   wallmaster14.y += 2;
  wallmaster14.render();
  
 
  wallmaster15.y += 3;
  wallmaster15.render();
  
  
  wallmaster16.y += random(4);
  wallmaster16.render();
  
   
  wallmaster17.y += random(4);
  wallmaster17.render();
  
  
  
  wallmaster18.y += 2;
  wallmaster18.render();
  

  wallmaster19.x += .2;
  wallmaster19.render();
  
  
  
  wallmaster20.x -= .2;
  wallmaster20.render();
  
  
  
  
   if (link.isOverlapping(wallmaster))
  {
   gamestate = gameover;
  }
 
 
    if (link.isOverlapping(wallmaster1))
  {
   gamestate = gameover;
  }
  
  
    if (link.isOverlapping(wallmaster2))
  {
   gamestate = gameover;
  }
  
  
    if (link.isOverlapping(wallmaster3))
  {
   gamestate = gameover;
  }
  
  
    if (link.isOverlapping(wallmaster4))
  {
   gamestate = gameover;
  }
  
  
    if (link.isOverlapping(wallmaster5))
  {
   gamestate = gameover;
  }
  
  
    if (link.isOverlapping(wallmaster6))
  {
   gamestate = gameover;
  }
  
  
    if (link.isOverlapping(wallmaster7))
  {
   gamestate = gameover;
  }
  
  
    if (link.isOverlapping(wallmaster8))
  {
   gamestate = gameover;
  }
  
  
    if (link.isOverlapping(wallmaster9))
  {
   gamestate = gameover;
  }
 
 
    if (link.isOverlapping(wallmaster10))
  {
   gamestate = gameover;
  }
  
  
    if (link.isOverlapping(wallmaster11))
  {
   gamestate = gameover;
  }
  
  
   if (link.isOverlapping(wallmaster12))
  {
   gamestate = gameover;
  }
 
 
    if (link.isOverlapping(wallmaster13))
  {
   gamestate = gameover;
  }
  
  
    if (link.isOverlapping(wallmaster14))
  {
   gamestate = gameover;
  }
  
  
    if (link.isOverlapping(wallmaster15))
  {
   gamestate = gameover;
  }
  
  
    if (link.isOverlapping(wallmaster16))
  {
   gamestate = gameover;
  }
  
  
   if (link.isOverlapping(wallmaster17))
  {
   gamestate = gameover;
  }
 
 
    if (link.isOverlapping(wallmaster18))
  {
   gamestate = gameover;
  }
  
     if (link.isOverlapping(wallmaster19))
  {
   gamestate = gameover;
  }
 
 
    if (link.isOverlapping(wallmaster20))
  {
   gamestate = gameover;
  }
 
  
  
  
 
if (gamestate==gameover)
{
  fill(#B90606);
  rect(0,0,700,700);
  fill(#000000);
  textSize(55);
  text("Link is Dead",200,300);
}

   if ( timer < 0)
   {
     timer = 0;
     gamestate = winstate;
   }
   if (gamestate == winstate)
   {
  fill(#000000);
  rect(0,0,700,700);
  textSize(50);
  fill(#91F568);
  text("YOU SURVIVED!", 160, 300);
}

}
 
void keyPressed()
{
  if (key == CODED )
  {
    if (keyCode == RIGHT)
    {
      link.x += 15;
    }
     
    if (keyCode == LEFT)
    {
      link.x -= 15;
    }
  }
}
 
 
 
 
 
 
 ////////////////////////////////////////////////////////////////////
 




 
 
 
 
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
    
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
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
boolean rectRectIntersect(float left, float top, float right, float bottom,
float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}



