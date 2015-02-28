
SpriteObject image1;
SpriteObject image2;
float[] numbers = new float[10];
SpriteObject[] images = new SpriteObject[10];
float timer = 0;
int imageIndex = 0;
float backgroundIndex = 270;
int dim;

void setup()
{
  size(600, 400);
  
  dim = width;
  background(30, backgroundIndex, backgroundIndex);
  fill(30, 170, backgroundIndex);
  noStroke();
  ellipseMode(RADIUS);
  
  images[0] = new SpriteObject("Lighthouse1.png");
  images[1] = new SpriteObject("Ship1.png");
  images[2] = new SpriteObject("Lighthouse2.png");
  images[3] = new SpriteObject("Ship2.png");
  images[4] = new SpriteObject("Lighthouse3.png");
  images[5] = new SpriteObject("Lighthouse4.png");
  images[6] = new SpriteObject("Lighthouse5.png");
  images[7] = new SpriteObject("Lighthouse6.png");
  images[8] = new SpriteObject("Lighthouse7.png");
  images[9] = new SpriteObject("Lighthouse8.png");
  
  for (int i = 0; i < 10; i += 1)
  {
    images[i].x = width / 2;
  }
  
  for (int i = 0; i < 10; i += 1)
  {
    images[i].y = height / 2;
  }
  
  for (int i = 0; i < 10; i += 1)
  {
    images[i].w = width;
  }
  
  for (int i = 0; i < 10; i += 1)
  {
    images[i].h = height;
  }
  
}

void keyReleased()  //any key if not specified
{
  fill(30, backgroundIndex-50, backgroundIndex+30);
  
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      backgroundIndex -= 20;
      rect(0, 0, width, height);
      imageIndex += 1;
    }
    
  if (imageIndex >= 10)
  {
    imageIndex = 0;
  }
  
  if (imageIndex < 0)
  {
    imageIndex = 9;
  }
  
}
}

void draw()
{
  
  for (int x = 0; x <= width; x += dim*2)
  {
    drawGradient(x, height/2);
  }
  
  for (int x = 0; x <= width; x += dim*2)
  {
    drawGradient(x, height/1.75);
  }
  
  for (int x = 0; x <= width; x += dim*2)
  {
    drawGradient(x, height/1.5);
  }
  
  for (int x = 0; x <= width; x += dim*2)
  {
    drawGradient(x, height/1.25);
  }
  
  for (int x = 0; x <= width; x += dim*2)
  {
    drawGradient(x, height);
  }
    
    if (imageIndex >= 10)
    {
      imageIndex = 0;
    }
  
  images[imageIndex].render();
  
}

void drawGradient(float x, float y)
{
  int radius = dim/2;
  float h = 200;
  for (int r = radius; r > 0; --r)
  {
    fill(h, 90, 100);
    ellipse(width/2, y, r, r);
    h = (h + 1) % 400;
  }
}

class SpriteObject
{
  float x = width / 2;
  float y = height / 2;
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



