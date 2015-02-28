
SpriteObject[] mysprite = new SpriteObject[25];
 





void setup()
{
  size(500, 500);
   
}


void draw()
{
  background(0); 
  textSize(20); 
  pushMatrix();
  fill(124, 112, 112);  
  translate(30,100); 
  text("Videogames", 0, 0); 
  popMatrix(); 
  
  
   
  pushMatrix(); 
  translate(155,100);  
  text("Call of Duty", 0, 0); 
  popMatrix();
  
  
  
  pushMatrix(); 
  translate(275,100); 
  text("Battlefield", 0, 0); 
  popMatrix();



  pushMatrix(); 
  translate(380,100); 
  text("Halo", 0, 0); 
  popMatrix();




  pushMatrix();
  translate(410,110);
  rotate(radians(90));  
  text("Mass Effect", 0, 0); 
  popMatrix();




  pushMatrix();
  translate(410, 225);
  rotate(radians(90));  
  text("Fallout", 0, 0); 
  popMatrix(); 
 
 
 
  pushMatrix();
  translate(30,110);
  rotate(radians(90));  
  text("Dragon Age", 0, 0); 
  popMatrix();  
  
  
  pushMatrix();
  translate(30,230);
  rotate(radians(90));  
  text("Rage", 0, 0); 
  popMatrix();
  
  
  
  
  pushMatrix();
  translate(30,305);  
  text("Eldar Scrolls", 0, 0); 
  popMatrix(); 
 
 
 
  pushMatrix();
  translate(155,305);  
  text("Lost Planet", 0, 0); 
  popMatrix();  
  
  
  
  pushMatrix();
  translate(265,305);  
  text("Mario Kart", 0, 0); 
  popMatrix();
 
 
 
  pushMatrix();
  translate(370,305);  
  text("Tron", 0, 0); 
  popMatrix(); 
 
 
 pushMatrix();
 translate(75,200);
 scale(.8);  
 text("Whimsical", 0, 0); 
 popMatrix();



pushMatrix();
translate(118,235);
scale(.8); 
rotate(radians(270)); 
text("Laid    Back", 0, 0); 
popMatrix(); 



  pushMatrix();
  translate(155,230); 
  scale(.7);  
  text("Caring", 0, 0); 
  popMatrix();
 
 
 
  pushMatrix();
  translate(210,230); 
  scale(.7);  
  text("Respectful", 0, 0); 
  popMatrix(); 
  

  
  
  
 noStroke(); 
 fill(#DEDEDE);
 rect(348, 193, 55, 55);
 
 
 noStroke(); 
 fill(#DEDEDE);
 rect(289, 193, 55, 55);
  
  fill(#FF0000);
  stroke(255, 0, 0);  
  ellipse(316, 220, 44, 44); 
  
  
  
  fill(#FF0000); 
  stroke(255, 0, 0);  
  ellipse(375, 220, 44, 44);
  
  
  pushMatrix();
  translate(310,150);
  fill(#FF0000);  
  scale(.7);  
  text("Nintendo", 0, 0); 
  popMatrix();
  
  

  
  
  pushMatrix();
  translate(330,265);
  fill(#FF0000);  
  scale(.7);  
  text("B", 0, 0); 
  popMatrix();
  
  
  pushMatrix();
  translate(385,265);
  fill(#FF0000);  
  scale(.7);  
  text("A", 0, 0); 
  popMatrix();
  
 
  

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


