
//Code Referencing and learning from
//http://openprocessing.org/sketch/115724

//Color Palette from
//https://kuler.adobe.com/Honey-Pot-color-theme-1490158/edit/?copy=true&base=2&rule=Custom&selected=4&name=Copy of Honey Pot&mode=rgb&rgbvalues=0.06274509803921569,0.3568627450980392,0.38823529411764707,1,0.9803921568627451,0.8352941176470589,1,0.8274509803921568,0.3058823529411765,0.8588235294117647,0.6196078431372549,0.21176470588235294,0.7411764705882353,0.28627450980392155,0.19607843137254902&swatchOrder=0,1,2,3,4

PImage Dots;
SpriteObject eraser;
SpriteObject cp;


float prevX;
float prevY;
float line2 = 1;
int brush = 0;
 
float s = 5;

color currentColor = color(16,91,99);

  
void setup()
{
  frameRate(200);
  size(700, 500);
  background(255,250,213);
  Dots = requestImage("Color Pallette.png");
  eraser = new SpriteObject("Eraserr.png");
  eraser.w = 150;
  eraser.h = 150;
  
  cp = new SpriteObject("CP.png");
  cp.w = 75;
  cp.h = 75;
  
}
  
void draw()
{
  if (Dots.width > 0)
  {
    image(Dots, 0, 0, 700, 500);
  }
 
  
    if (brush == 0)
    {
      if(keyPressed)
      {
        if (key == CODED)
        {
          if (keyCode == UP)
          {
            s+= .5;
          }
          if (keyCode == DOWN)
          {
            s += -.5;
          }
        }
      }
    }
  if (mousePressed == true)
  {
    if (mouseButton == RIGHT)
    {
        currentColor = get(mouseX, mouseY);
      }
 
    if (mouseButton == LEFT)
    {
      if (brush == 0)
      {
        line2 = random(0,10);
        strokeWeight(s);
        stroke(red(currentColor), green(currentColor), blue(currentColor));
        line(prevX, prevY, mouseX, mouseY);
      
      }
      if (brush == 1)
      {
        eraser.x = mouseX;
        eraser.y = mouseY;
        eraser.render();
      }
      if (brush == 2)
      {
        cp.x = mouseX;
        cp.y = mouseY;
        cp.rotation += 10;
        cp.render();

      }
    }
  }
   
  prevX = mouseX;
  prevY = mouseY;
   
  println(prevX);
}
  
void keyReleased()
{
  if (key == 'b')
  {
    brush = 0;
  }
  if (key == 'e')
  {
    brush = 1;
  }
  if (key == 'c')
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
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



