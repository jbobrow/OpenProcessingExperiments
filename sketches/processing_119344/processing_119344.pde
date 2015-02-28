
PFont comicsansms;
PFont motorwerk;
float angle = 0;
float angle2 = 0;
float angle3 = 0;
float x = 0;
PImage ps3controller;

 
void setup()
{
  size(1000,633);
  ps3controller = requestImage("ps3controller.fw.png");
  comicsansms = createFont("Comic Sans MS",40);
  motorwerk = createFont("Motorwerk",64);
  
 
}
 
 float timer = 0;
 
void draw()
{
  
  
    imageMode(CORNER);
  if (ps3controller.width > 0)
  {
    image(ps3controller,0,0,1000,633);
  }
  
   timer += 0.0167;
   
  fill (0);
  pushMatrix();
  translate(0,0);  
  textSize(50);
  textFont(comicsansms);
  text("People", 200, 85);
  text("think", 710, 85);
  text("that I am", 181, 120);
  text("only interested", 640, 120);
  text("in games. As a lowly gamer who sits in", 150, 160);
  text("his room finding comfort from the games", 125, 200);
  text("he plays. Who can blame them? Most of the", 115, 240);
  text("time I would rather stay in Relax with a game.", 80, 280);
  text("But it's not because I am some loner who", 101, 320);
  text("stays holed up playing all day, but because when", 70, 360);
   text("I play games, I feel calm and at peace, like ", 91, 400);
   text("all of my troubles",84,440);
   text("float away. But ",575,440);
   text("sometimes,",71,480);
   text("once in a ",732,480);
   text("while, I",67,520);
   text("like to...",746,520);   
  popMatrix();
   
  if (keyPressed == false)
    {
      
      if (key == ' ')
      
      {
         angle += 0.1;
   angle2 += 0.2;
 angle3 += 0.3;
   
 
    background(0);
    pushMatrix();
    textFont(motorwerk);
    textSize(100);
    fill(random(50,255),random(20,100),random(0,150));
    text("PARTY",350, 100);
    text("GET WILD",300, 150);
    text("RELASE THE",250, 200);
    text("INNER BEAST,",210, 250);
    text("UNTIL THE",270, 300);
    text("BREAK",350, 350);
    text("OF",450, 400);
    translate(450,450);
    text("D",random(-40,40),0);
    text("A",random(-60,60),50);
    text("Y",random(-80,80),100);
    popMatrix();
    
    pushMatrix();
    textFont(motorwerk);
    textSize(50);
   fill(random(50,255),random(20,100),random(0,150));
    translate(112,94);
    rotate(-angle);
    text("GET CRUNK", 0,0);
    popMatrix();
    
       pushMatrix();
    textFont(motorwerk);
    textSize(50);
  fill(random(50,255),random(20,100),random(0,150));
    translate(739,440);
    rotate(angle);
    text("GET LOUD", 0,0);
    popMatrix();
    
       pushMatrix();
    textFont(motorwerk);
    textSize(50);
  fill(random(50,255),random(20,100),random(0,150));
    translate(856,94);
    rotate(angle2);
    text("LET LOOSE",0,0);
    popMatrix();
    
       pushMatrix();
    textFont(motorwerk);
    textSize(50);
   fill(random(50,255),random(20,100),random(0,150));
    translate(225,440);
    rotate(-angle3);
    text("LET FREE", 0,0);
    popMatrix();
     
      }
      
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



