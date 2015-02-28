

/* 
Riddle me this,
Riddle me that,
For if knowledge is power, 
Then a God I am
*/


float timer;
float angle = 0;
float x = 0;

PFont bernard;
PFont blackoak;
PFont lucida;
PFont herculanum;
PFont monaco;
PFont impact;
PFont braggadocio;
PFont rosewood;
PFont wide;
PFont stencil;

SpriteObject riddler;


void setup()
{
 size(500,500); 
 
 bernard = createFont("Bernard MT Condensed", 64);
 blackoak = createFont("Blackoak Std", 26);
 lucida = createFont("Lucida Blackletter", 64);
 herculanum = createFont("Herculanum", 64);
 monaco = createFont("Monaco", 64);
 impact = createFont("Impact", 32);
 braggadocio = createFont("Braggadocio", 64);
 rosewood = createFont("Rosewood Std Regular", 64);
 wide = createFont("Wide Latin", 22);
 stencil = createFont("Stencil", 64);
 
 riddler = new SpriteObject("riddler.jpg");
 riddler.x = width / 2;
 riddler.y = height / 2;
 riddler.w = width;
 riddler.h = height;
  
}


void draw()
{
  background(0);
  angle += 0.1;
  timer += 0.0167;
  x += 1;
  
  
  pushMatrix();
  fill(255);
  textSize(1);
  textFont(blackoak);
  text("Riddle me this,", 0, 100);
  text("Riddle me that,", 0, 200);
  text("Then a God I am", 0, 400);
  textFont(wide);
  text("For if knowledge is power,", 0, 300);
  popMatrix();
  
  if (timer > 5)
  {
  pushMatrix();
  background(0);
  fill(#318130);
  textSize(1);
  textFont(stencil);
  text("Riddle", random(0, 100), random(50, 150));
  text("me", random(150, 250), random(50, 150));
  text("this,", random(300, 400), random(50, 150));
  text("Riddle", random(0, 100), random(150, 250));
  text("me", random(150, 250), random(150, 250));
  text("that,", random(300, 400), random(150, 250));
  text("For", random(0, 100), random(250, 350));
  text("if", random(100, 150), random(250, 350));
  text("knowledge", random(150, 250), random(250, 350));
  text("is", random(250,300), random(250, 350));
  text("power,", random(300, 400), random(250, 350));
  text("Then a God I am", random(0, 100), random(350, 450));
  text("a", random(100, 150), random(350, 450));
  text("God", random(150, 250), random(350, 450));
  text("I", random(250, 300), random(350, 450));
  text("am", random(300, 400), random(350, 450));
  popMatrix();
  }
  
  if (timer > 10)
  { 
    background(#53097C);
    fill(#0BDE1A);
    textFont(impact);
    pushMatrix();
    translate(132, 114);
    rotate(-0.4);
    text("Riddle", 0, 0);
    
    translate(119, 15);
    rotate(0.8);
    text("This,", 0, 0);
    
    rotate(0.8);
    translate(48, -40);
    text("Riddle", 0, 0);
    
    translate(80, 0);
    rotate(0.8);
    text("Me", 0, 0);
    
    translate(35, 0);
    rotate(0.8);
    text("That,", 0, 0);
    
    translate(65, 0);
    rotate(0.3);
    text("For", 0, 0);
    translate(45, 0);
    text("If", 0, 0);
    
    translate(50, 0);
    rotate(-1.6);
    text("Knowledge", 0, 0);
    translate(150, 0);
    text("Is", 0, 0);

    popMatrix();
    
    text("Me", 208, 82);
    text("Power", 150, 480);
  }
  
  if (timer > 15)
  {
    riddler.render();
    
    textFont(bernard);
    
    text("Than God", 250, 100);
    text("I Am", 325, 170);
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



