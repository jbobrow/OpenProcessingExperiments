
PFont comicsansms;
PFont nyczone123;
float x = 0;
float timer;
SpriteObject topcat;
SpriteObject tupac;

 
  
void setup()
{
  size(500,500);
  background(0);
  
  comicsansms = createFont("Comic Sans MS",35);
  nyczone123 = createFont("nyc_zone_123", 50);
  textFont(nyczone123);
  
  
  topcat = new SpriteObject("topcat.gif");
  tupac = new SpriteObject("tupac.jpg");
    topcat.x =width / 2;
  topcat.y = width/2;
   topcat.w = width;
  topcat.h = height;
  
  tupac.x = width / 2;
  tupac.y = width / 2;
  tupac.w = width;
  tupac.h = height;
   
  
}
  
 
  
void draw()
{
  timer += 0.0167;
   topcat.render();
    
  fill (247, 87, 12);
  pushMatrix();
  translate(0,0); 
  textSize(50);
  textFont(comicsansms);
  text("you might think", 100, 85);
  text("I'm just a cool cat", 40, 120);
  text("and nothing more", 30, 160);
  text("than that.Or maybe", 30, 200);
  text("you think I'm nice", 95, 240);
    text("and handsome.", 80, 280);
  text("I wouldn't", 101, 320);
  text("hold you for ransom.", 70, 360);
   text("I'm more then", 91, 400);
   text("that. Honestly...",55,440);
   text("",575,440);
   text("",71,480);
   text("",732,480);
   text("",67,520);
   text("",746,520);  
  popMatrix();
  
  if (timer > 9) 
  {
    tupac.render();
  frameRate(5);
  fill (255, 255, 0);
  pushMatrix();
  translate(0,0); 
  textSize(50);
  textFont(comicsansms);
  text("I CAN SPIT", random(100), 85);
  text("THE TIGHTEST", random(40), 120);
  text("SICKEST", random(30), 160);
  text("BESTEST", random(30), 200);
  text("ILLEST", random(95), 240);
    text("NASTIEST", random(80), 280);
  text("DOPEST", random(101), 320);
  text("RAP", random(70), 360);
  popMatrix();   
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




