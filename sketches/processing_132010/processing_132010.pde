
SpriteObject[] imageArray = new SpriteObject[10];
int imageindex = 0;
int timer = 0;

void setup()
{
  size(500, 500);
  frameRate(30);
    
 imageArray[0] = new SpriteObject("44.jpg");
 imageArray[1] = new SpriteObject("OGslogo.jpg");
 imageArray[2] = new SpriteObject("Slayers.png");
 imageArray[3] = new SpriteObject("UNiTE.jpg");
 imageArray[4] = new SpriteObject("smiley.png");
 imageArray[5] = new SpriteObject("Nat_Pagle.png");
 imageArray[6] = new SpriteObject("doge_20store_original.jpg");
 imageArray[7] = new SpriteObject("index.jpg");
 imageArray[8] = new SpriteObject("maxresdefault.jpg");
 imageArray[9] = new SpriteObject("TRAP.jpg");
}

void draw()
{
 timer++;
 if (timer >= 25)
 {
   imageindex++;
   timer = 0;
   
   if (imageindex == 10)
   {
     imageindex = 0;
   }
 }
 imageArray[imageindex].render();
}

class SpriteObject
{
  float x = 200.0;
  float y = 200.0;
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
  
void keyPressed()
{
  if (key == 'r')
  {
    imageindex = int(random(7));
  }
    
  if (key == 'q')
  {
    timer++;
  }
    
  if (keyCode == RIGHT)
  {
    imageindex++;
  }
    
  if (keyCode == LEFT)
  {
    imageindex--;
  }
}


