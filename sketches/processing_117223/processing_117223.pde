
SpriteObject human;
SpriteObject[] meteor = new SpriteObject[50];
SpriteObject[] gold = new SpriteObject[20];

 
float timer = 0;
float timer2 = 10;
float timer3 = 0;
float rate = 0;
boolean gameStart, gameEnd, collision;
float  r1 = random(600);
float r2 = random(600);
PImage BG;
PImage BG2;
PImage BG3;
float score = 0;
 
void setup()
{
  size(600,600);
   
  BG = loadImage("BG.jpg");
  BG2 = loadImage("bg2.png");
  BG3 = loadImage("BG3.png");
  human = new SpriteObject("human.png");
  for ( int i = 0; i < 50; i++)
 {
 
  meteor[i] = new SpriteObject("meteor.png");
  meteor[i].x = random(600);
  meteor[i].y = random (-3000,0);
  meteor[i].s = 0.15;
 
 }
   for (int f = 0; f < 20; f++)
   {
    gold[f] = new SpriteObject("gold.png");
  gold[f].x = random(600);
  gold[f].y = random (-3000,0);
  gold[f].s = 0.25;
}
  gameStart = false;
  gameEnd = false;
}
 
void draw()
{
  
  image(BG, 300, 300, 600, 600);
   
if(collision)
    {
       
      fill(255,0,0,100);
      rect(0,0,700,700);
      score = score - 2;
    }
     
    collision = false;
     
  if(gameStart == false)
  {
    image(BG2, 300,300,600,600); //starting screen blue
  textSize(20);
  text("CLICK TO FEED SHIKI ICE CREAM",150,300);
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
   
  for ( int i = 0; i < 50; i++)
    {
    meteor[i].render();
    meteor[i].y += 5;
     
      if(meteor[i].isOverlapping(human) && meteor[i].destroyed == false)
    {
      collision = true;
      meteor[i].destroyed = true;
    }
    
    }
    
    for (int f = 0; f < 20; f++)
    {
   gold[f].render();
   gold[f].y += 3;
     if(gold[f].isOverlapping(human) && gold[f].destroyed == false)
  {
    score = score + 15;
    gold[f].destroyed = true;
  }
    }
     
     
    }
  if(timer > 1)
  {
    rate += 10;
    timer = 0;
  }
 
  human.x = mouseX;
  human.y = 540;
  human.s = 0.55;
  human.render();
 
 
if(score <1)
  {
    score = 0;
  }
   
  
  fill(255);
  textSize(25);
  text("TIME REMAINING: "+(int)timer2,0,26);
  textSize(20);
  text("SCORE: " + (int)score,0,50);
   
   
   if(timer2 < 1)
  {
    gameEnd = true;
    gameStart = false;
  }
  if(gameEnd == true)
  {
    image(BG3, 300, 300, 600, 600); 
    
    textSize(20);
    
    text("CONGRATULATIONS, SHIKI IS", 150, 350);
    text("SATISFIED WITH HER STRAWBERRY ICE CREAMS",75,400);
    text("END ICE CREAM POINTS: " + (int)score,160,250);
  }
  
}



 
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
  boolean destroyed = false;
     
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


