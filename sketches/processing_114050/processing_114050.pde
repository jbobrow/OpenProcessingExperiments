
SpriteObject[] images = new SpriteObject[10];
int cycle = 0; 
int rate = 4;

void setup()
{
  size (300,300);
  for (int i = 0; i < 10; i++)
  {
    images[i] = new SpriteObject("animal" + i + ".jpg");
    images[i].x = width/2;
    images[i].y = height/2;
  }
  
  
  
  
}

void draw(){
  images[cycle].render();
  
  
  frameRate(rate);
  cycle++;
  if (cycle > 9)
  {
    cycle = 0;
  }
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      rate++;
    }
     
    if(keyCode == DOWN)
    {
      rate--;
    }
  }
   
   
  if(key == 'q')
  {
    cycle = (int)random(0, 9);
  }
}

void keyReleased() {
        if (keyCode == RIGHT) {
            cycle = cycle + 1;
        }
        if (keyCode == LEFT) {
            cycle = cycle - 1;
        }
        
        else if (cycle > 9)
{
  cycle = 0;
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

   




