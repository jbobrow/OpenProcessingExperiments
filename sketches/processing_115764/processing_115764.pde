
PImage colorwheel; 
SpriteObject gidCat; 
float prevX;
float prevY;
int brush = 0;
float b = 5; 
color currentPick = color(0); 
float radius = 0.0;
float center = 0.0;
float a, c, r; 

void setup()
{
  size(500,500); 
  frameRate(200); 
  colorwheel = requestImage("wheel.jpg"); 
  background(250); 
  
  gidCat = new SpriteObject("Gidcat.gif"); 
  gidCat.w = 500; 
  gidCat.h = 500; 
  
  center=width/2;
  a=mouseX; 
  c=mouseY;
}

void draw() 
{
  if(colorwheel.width > 0);
  {
    image (colorwheel, 0, 0, 100, 100);
  }
  
if (mousePressed == true) 
{
  if (mouseButton == LEFT) 
  {
    if (brush == 0)
    {
      strokeWeight(b);
        stroke(red(currentPick), green(currentPick), blue(currentPick));
        line(prevX, prevY, mouseX, mouseY);
    }
    if (brush == 2) 
    {
      pushMatrix(); 
    fill(red(currentPick), green(currentPick), blue(currentPick)); 
    stroke(random(255), random(255), random(255)); 
    fill(random(255), random(255), random(255), random(100)); 
    ellipse(mouseX, mouseY, random(200), random(200));
  rect(mouseX + random(200), mouseY + random(200), random(50), random(50));  
    popMatrix();
    } 
    if (brush == 1)
    {
      gidCat.x = mouseX;
      gidCat.y = mouseY; 
      gidCat.render(); 
    }
    if (brush == 3)
    {
  }
}
prevX = mouseX;
prevY = mouseY; 
}
}

void keyReleased()
{
  if ( key == '0')
  {
    brush = 0;
  }
  if (key == '1')
  {
    brush = 1;
  }
  if (key == '2')
  {
    brush = 2;
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




