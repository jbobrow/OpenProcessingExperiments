

PImage paletteImage;
color currentColor;
int brush = 0;
float prevX;
float prevY;
float w = 10;
SpriteObject vdBrush;
SpriteObject dlBrush;



void setup()
{
  
  size(500, 500);
  paletteImage = requestImage("palette.jpg");
  vdBrush = new SpriteObject("VD.jpg");
  vdBrush.w = 200;
  vdBrush.h = 200;
  dlBrush = new SpriteObject("DL.jpg");
  dlBrush.w = 50;
  dlBrush.h = 50;
  
}


void draw()
{
 
      if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 100, 100);
  }
  
  if (mousePressed == true)
  {
    if (mouseButton == RIGHT)
    {
      currentColor = get(mouseX, mouseY);
    }
  }
  
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      if (brush == 1)
      {
        stroke(red(currentColor), green(currentColor), blue(currentColor));
        strokeWeight(w);
        line(prevX, prevY, mouseX, mouseY);
        noStroke();
      }
      
      if (brush == 2)
      {
        fill(random(255), random(255), random(255), random(125));
        ellipse(mouseX + random(-10, 10), mouseY + random(-10, 10), 10, 10);
        ellipse(mouseX + random(-10, 10), mouseY + random(-10, 10), 10, 10);
        ellipse(mouseX + random(-10, 10), mouseY + random(-10, 10), 10, 10);
        ellipse(mouseX + random(-10, 10), mouseY + random(-10, 10), 10, 10);
        ellipse(mouseX + random(-10, 10), mouseY + random(-10, 10), 10, 10);
        ellipse(mouseX + random(-10, 10), mouseY + random(-10, 10), 10, 10);
        ellipse(mouseX + random(-10, 10), mouseY + random(-10, 10), 10, 10);
        ellipse(mouseX + random(-10, 10), mouseY + random(-10, 10), 10, 10);
        noFill();
      }
      
      if (brush == 3)
      {
        strokeWeight(1);
        stroke(random(255), random(255), random(255));
        line(mouseX, mouseY, random(500), random(500));
        line(mouseX, mouseY, random(500), random(500));
        line(mouseX, mouseY, random(500), random(500));
        fill(random(255), random(255), random(255), random(125));
        rect(mouseX + random(100), mouseY + random(100), random(50), random(50));
        rect(mouseX + random(100), mouseY + random(100), random(50), random(50));
        rect(mouseX + random(100), mouseY + random(100), random(50), random(50));

      }
      if (brush == 4)
      {
        pushMatrix();
        noStroke();
        fill(255, 255, 255);
        translate(random(width), random(height));
        rect(mouseX, mouseY, 10, 10);
        popMatrix();
        pushMatrix();
        noStroke();
        fill(255, 255, 255);
        translate(random(width), random(height));
        rect(mouseX, mouseY, 10, 10);
        popMatrix();
        pushMatrix();
        noStroke();
        fill(255, 255, 255);
        translate(random(width), random(height));
        rect(mouseX, mouseY, 10, 10);
        popMatrix();
        pushMatrix();
        noStroke();
        fill(255, 255, 255);
        translate(random(width), random(height));
        rect(mouseX, mouseY, 10, 10);
        popMatrix();
        pushMatrix();
        noStroke();
        fill(255, 255, 255);
        translate(random(width), random(height));
        rect(mouseX, mouseY, 10, 10);
        popMatrix();
        pushMatrix();
        noStroke();
        fill(255, 255, 255);
        translate(random(width), random(height));
        rect(mouseX, mouseY, 10, 10);
        popMatrix();
        pushMatrix();
        noStroke();
        fill(255, 255, 255);
        translate(random(width), random(height));
        rect(mouseX, mouseY, 10, 10);
        popMatrix();
        noFill();
      }
      if (brush == 5)
      {
        vdBrush.x = mouseX;
        vdBrush.y = mouseY;
        vdBrush.rotation += 10;
        vdBrush.render();
        
        dlBrush.x = mouseX;
        dlBrush.y = mouseY;
        dlBrush.rotation -= 10;
        dlBrush.render();
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
    if (key == '5')
    {
      brush = 5;
    }
    
    if (key == 'w' || key == 'W')
    {
      w += 5;
    }
    else if (key == 's' || key == 'S')
    {
      w -= 5;
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
        


