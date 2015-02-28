
float prevX;
float prevY;
int currentBrush = 0;
color brushColor = color(0);
float s = 1;
float angle = 0;
SpriteObject doge;
 
 
void setup ()
{
   
  size(600,600);
  smooth();
  doge = new SpriteObject("mydoge.jpg");
  //doge.s =  0.02;
}
void draw()
{
  if (mousePressed) {
        
      if (mouseButton == RIGHT) {
        brushColor = get(mouseX, mouseY);
      }
    }
      
    // Draw color wheel palette
    for (int angle = 0; angle < 360; angle = angle + 1) {
      colorMode(HSB, 360, 100, 100, 100);
      pushMatrix();
      translate(30, 30);
      rotate(radians(angle));
      scale(2);
      stroke(angle, 100, 100, 100);
      line(0, 0, 30, 0);
      popMatrix();
        
    }
    // Set back to RGB
    colorMode(RGB);
 
 if (mousePressed == true)
  {
    if (mouseButton == LEFT)
     {
        if (currentBrush == 0)
           {
             fill(red(brushColor), green(brushColor), blue(brushColor));
              strokeWeight(1);
              pushMatrix();
              translate(mouseX, mouseY);
              scale(s);
              rotate(angle);
              ellipse(0,0,25,25);
              popMatrix();
           }
         if (currentBrush == 1)
         {
            doge.x = mouseX;
            doge.y = mouseY;
            scale(random(2));
            doge.rotation += 8;
            doge.render();
 
         }
         if (currentBrush == 2)
         {
           rectMode(CENTER);
           strokeWeight(random(40));
          stroke(random(255), random(255), random(255));
          rect(prevX, prevY, mouseX, mouseY);

         }
     }
  }
  prevX = mouseX;
  prevY = mouseY;
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


void keyReleased()
{
  if (key == '1')
  {
    currentBrush = 0;
  }
  if (key == '2')
  {
    currentBrush = 1;
  }
  if (key == '3')
  {
    currentBrush = 2;
  }
}



