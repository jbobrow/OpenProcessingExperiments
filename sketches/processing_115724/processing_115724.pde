
PImage paletteImage;
float prevX;
float prevY;
int brush = 0;

float s = 5;
float radius = 0.0;
float timer = 0.0;
float center = 0.0;
float a, b, r;
color currentColor = color(0);
 
void setup()
{
  size(600, 600);
  background(255,255,255);
 paletteImage = requestImage("colorwheel.png");
  
  center=width/2;
  a=mouseX;
  b=mouseY;
}
 
void draw()
{
  if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 100, 100);
  }
  if(s < 1)
  {
    s=1;
  }
  r = random(5,50);
  if (timer >= 18.0)
        {
        timer = 0.0;
        }
     
    // Set the x and y position to equation of a circle.
    float spiralOffset = 10.0;
    float x = radius * cos(timer * spiralOffset);
    float y = radius * sin(timer * spiralOffset);
    x += mouseX;
    y += mouseY;
    
  
   
    timer += 0.03; // (1 / frameRate);
    radius = random(30,50);
    if (brush == 0)
    {
      if(keyPressed)
      { 
        if (key == CODED)
        {
          if (keyCode == UP)
          {
            s++;
          }
          if (keyCode == DOWN)
          {
            s += -1;
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
        strokeWeight(s);
        stroke(red(currentColor), green(currentColor), blue(currentColor));
        line(prevX, prevY, mouseX, mouseY);
     
      }
      if (brush == 1)
      {
   
        strokeWeight(random(10)); 
        float timerScalar = 20.0;   
        stroke(random(255), random(255), random(255));
        fill(random(255), random(255), random(255));
  
        //line(a, b, x, y);
       a=x + random(-5,5);
       b=y + random(-5,5);
       
        ellipse(a,b,r,r);
        noStroke();
        ellipse(a,b,3,3);
       
      }
      if (brush == 2)
      {
        strokeWeight(random(3)); 
        float timerScalar = 20.0;   
        stroke(random(255));
        line(random(600),0,mouseX,mouseY);
        line(0,random(600),mouseX,mouseY);
        line(random(600),600,mouseX,mouseY);
        line(600,random(600),mouseX,mouseY);
      }
    }
  }
  

   
  prevX = mouseX;
  prevY = mouseY;
  
  println(prevX);
}
 
void keyReleased()
{
  if (key == '1')
  {
    brush = 0;
  }
  if (key == '2')
  {
    brush = 1;
  }
  if (key == '3')
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



