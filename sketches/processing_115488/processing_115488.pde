
float prevX;
float prevY;
float a,s;
color currentColor = color(0);

void setup()
{
  size(600, 600);
  a = 0;
  s = 1;
}
 
void draw()
{
  
  if(keyPressed == true)
  {
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      a += .1;
    }
    if(keyCode == DOWN)
    {
      a += -.1;
    }
    if(keyCode == LEFT)
    {
      s += -.1;
    }
    if(keyCode == RIGHT)
    {
      s += .1;
    }
  }
  }
  if (mousePressed == true)
  {
    if (mouseButton == RIGHT) {
        currentColor = get(mouseX, mouseY);
      }
    if (mouseButton == LEFT)
    {
         fill(red(currentColor), green(currentColor), blue(currentColor));

        pushMatrix();
        noStroke();
        translate(mouseX,mouseY);
        rotate(a);
        scale(s);
        triangle(0,-15, 15, 15, -15,15);
        popMatrix();
    }
       

  }
    for (int angle = 0; angle < 360; angle = angle + 1) {
      colorMode(HSB, 360, 100, 100, 100);
      pushMatrix();
      translate(30, 30);
      rotate(radians(angle));
      stroke(angle, 100, 100, 100);
      line(0, 0, 30, 0);
      popMatrix();
 
  }
    colorMode(RGB); 

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



