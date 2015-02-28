
float prevX;
float prevY;
int currentBrush = 0;
SpriteObject starBrush;
boolean Invert = false;


void setup()
{
  size(600,600);
  background(0);  
  starBrush = new SpriteObject("star.png");
  starBrush.s = .3;
}

void draw ()
{
 
  if (mousePressed == true)
  {
    if (mouseButton == LEFT && currentBrush == 0)
    {
      stroke(random(360));
      strokeWeight(2);
      fill(0);
      
      translate(mouseX, mouseY);
      ellipse(30, 30, 30, 30);
    }
    
      if (currentBrush == 1)
      {
      strokeWeight(6);
      stroke(random(250));
      scale(random(3));
      fill(random(360), random(360), random(360));
      translate(mouseX, mouseY);
      triangle(-50, 50, 0, -50, 50, 50);
      

      }
 
  
    
      if (currentBrush == 2)
      {
       starBrush.x = mouseX;
       starBrush.y = mouseY;
       starBrush.rotation += 10;
       starBrush.render();
       filter(INVERT);
      }
  
  
  } // if (mousePressed == true)

 prevX = mouseX;
 prevY = mouseY; 
}


void keyReleased()
{
  if (key == '0')
  {
    currentBrush = 0;
  }
  
  if (key == '1')
  {
    currentBrush = 1;
  }
  
  if (key == '2')
  {
    currentBrush = 2;
  }
  
  if (key == 'x')
  {
    background(0);
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
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
  
}



