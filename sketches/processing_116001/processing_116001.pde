
float prevX;
float prevY;
int currentBrush = 0;
SpriteObject catBrush;
 
void setup()
{
  size(700, 700);
  background(255, 255, 255);
  catBrush = new SpriteObject("Cat.png");
  catBrush.s = 1.5;
}
 
void draw()
{
  prevX = mouseX;
  prevY = mouseY;
  
  if (mousePressed == true && mouseButton == LEFT)
  {
    if (currentBrush == 0)
    {
      noStroke();
      fill(0, 0, 0);
      ellipse(mouseX, mouseY, 25, 25);
    }

    if (currentBrush == 1)
    {
      drawX(mouseX, mouseY, color(255, 0, 0), 4);
    }
      
    if (currentBrush == 2)
    {
      drawO(mouseX, mouseY, color(0, 0, 255), 10);
    }
    
    if (currentBrush == 3)
    {
      background((random(0, 255)), (random(0, 255)), (random(0, 255)));
      catBrush.x = mouseX;
      catBrush.y = mouseY;
      catBrush.rotation += 7;
      catBrush.render();
    }
    
  }
  
}
 
void keyReleased()
{
  if (keyCode == LEFT && key == CODED)
  {
    currentBrush = 0;
  }
  if (keyCode == DOWN && key == CODED)
  {
    currentBrush = 1;
  }
  if (keyCode == UP && key == CODED)
  {
    currentBrush = 2;
  }
  if (keyCode == RIGHT && key == CODED)
  {
    currentBrush = 3;
  }
  if (keyCode == SHIFT && key == CODED)
  {
    background(255, 255, 255);
  }
}


void drawX(float x, float y, color xcolor, float weight)
{
  stroke(xcolor);
  strokeWeight(weight);
  line(x - 30, y - 25, x + 30, y + 35);
  line(x + 30, y - 25, x - 30, y + 35);
}

void drawO(float x2, float y2, color ocolor, float weight2)
{
  fill(255, 255, 255);
  stroke(ocolor);
  strokeWeight(weight2);
  ellipse(mouseX, mouseY, 60, 60);
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


