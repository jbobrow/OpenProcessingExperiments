
SpriteObject[] myimages = new SpriteObject[100];

float timer = 0;
int imageindex = 0;
PImage animal0;
PImage animal1;
PImage animal2;
PImage animal3;
PImage animal4;
PImage animal5;
PImage animal6;
PImage animal7;
PImage animal8;
PImage animal9;


void setup()
{
  size (500,500);
   for (int i = 0; i < 10; i++)
  {
    myimages[i] = new SpriteObject("animal" + i + ".jpg");
  }

}


void draw()
{
  timer += 0.0167;
   
  if (timer > 3)
  {
    
    imageindex += 1;
    timer = 0;
  }
  if (imageindex >= 10)
  {
    imageindex = 0;
  }
  if ( timer >= 10)
  {
    timer = 0;
  }
   
  myimages[imageindex].render();
 if (keyPressed == true)
 {
   imageindex += 1;
 }
}

void keyPressed()
{
  if (key == RIGHT)
 {
  keyPressed = true;
 }
   
} 

 
class SpriteObject
{
  
  float x = width/2;
  float y = height/2;
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




