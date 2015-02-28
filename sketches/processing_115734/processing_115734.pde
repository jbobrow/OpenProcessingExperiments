
float prevX;
float prevY;
int brush = 0;
float s = 1;
float r = 0;
SpriteObject pokeball;

void setup()
{
  size(600, 600);
  background(0);
  pokeball = new SpriteObject("Pokeball.png");
  pokeball.w = 200;
  pokeball.h = 200;
}
 
void draw()
{
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      if (brush == 0)
      {
        strokeWeight(10);
        stroke(#1CFC12);
        line(prevX, prevY, mouseX, mouseY);
        stroke(#36E0E8);
        line(prevX + 15, prevY + 15, mouseX + 15, mouseY + 15);
      }
           
      
      if (brush == 1)
      {
        noStroke();
        fill(random(255));
        pushMatrix();
        noStroke();
        translate(mouseX,mouseY);
        rotate(r);
        scale(s);
        triangle(0,-15, 15, 15, -15,15);
        popMatrix();
      }
     
      if (brush == 2)
      {
        pokeball.x = mouseX;
        pokeball.y = mouseY;
        pokeball.rotation += 5;
        pokeball.render();
      }
      
      if (brush == 3)
        {
              noStroke();
              fill(random(255), random(255), random(255));
              translate(random(500),250);
              rectMode(CENTER);
              scale(s + random(-4.0,8.0));
              rect(0,random(-200,200),random(5,15),random(5,15));
              noStroke();
              fill(random(255), random(255), random(255));
              translate(random(500),250);
              rectMode(CENTER);
              scale(s + random(-8.0,8.0));
              rect(0,random(-300,300),random(5,15),random(5,15));
            
         }
        //resets background 
       if (brush == 4)
         {
           background(0);
         }  
         
     }
   }
    prevX = mouseX;
    prevY = mouseY;
}
 
void keyReleased()
{
  if (key == '1')
  {
    brush = 1;
  }
  if (key == 'q')
  {
    brush = 0;
  }
  if (key == '2')
  {
    brush = 2;
  }
  if (key == '3')
  {
    brush = 3;
  }
  if (key == '4')
  {
    brush = 4;
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
      scale(.3);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}


