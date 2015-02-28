
PImage BG1;
PImage BG2;
SpriteObject WSprite1;
SpriteObject WSprite2;
float timer;
float rate = 0;
PFont chalk;
PFont zapfino;

void setup()
{
  size(700, 700);
  
  BG1 = loadImage("BG1.jpg");
  BG2 =loadImage("BG2.png");
  WSprite1 = new SpriteObject("WSprite1.png");
  WSprite1.x = 120;
  WSprite1.y = 280;
  WSprite2 = new SpriteObject("WSprite2.png");
  WSprite2.x = 130;
  WSprite2.y = 495;
  //WSprite2.y = 199;
  WSprite2.s = 0.8;
  //WSprite2.x = width/2+10;
  //WSprite2.y = width/2;
  //WSprite2.s = 0.6;
  chalk = createFont("Chalkduster", 64); 
  zapfino = createFont("Zapfino", 32);
  
}

void draw()
{
  image(BG1, 350, 350, 700, 700);
   println("x: " + mouseX + " y: " + mouseY);
   
   
   textFont(zapfino);
   textSize(20);
   text("The flower that is thine soul", 350, 250);
   text("shall brilliantly wither", 400, 300);
   text("The nectar that is thine vessel", 350, 350);
   text("wastes away and ripens once", 350, 400);
   text("more into the cycle of life", 360, 450);
   text("How worthless", 400, 500);
   text("this repetition is!", 400, 550);
   
   
  WSprite1.render();
  
  
  if (timer > 5.5)
  {
    image(BG2, 350, 350, 700, 700);
   WSprite2.render();
   fill(255,0,0);
   textFont(chalk);
   textSize(40);
   
   pushMatrix();
  translate(random(650, 660),15);
  rotate(radians(90)); 
  text("Rise and climb", 0, 0);
  popMatrix();
 
  pushMatrix();
  translate(random(600, 610),15);
  rotate(radians(90)); 
  text("Grief and lament", 0, 0);
  popMatrix();
  
   pushMatrix();
   textSize(40);
  translate(random(550,560),15);
  rotate(radians(90)); 
  text("See that reality is merely lies", 0, 0);
  popMatrix();
  
   pushMatrix();
  translate(random(500, 510),15);
  rotate(radians(90)); 
  text("Despair over the repeating", 0, 0);
  popMatrix();
    
    pushMatrix();
   
  translate(random(450, 460),15);
  rotate(radians(90)); 
  text("spiral that is life!", 0, 0);
  popMatrix();
  }
  
  timer += 0.0167; 
  
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



