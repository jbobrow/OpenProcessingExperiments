
SpriteObject image1;
SpriteObject image2;
SpriteObject image3;
SpriteObject image4;
SpriteObject image5;
SpriteObject image6;
SpriteObject image7;
SpriteObject image8;
SpriteObject image9;
SpriteObject image10;
float[] numbers = new float[10];
SpriteObject [] images = new SpriteObject[10];
float timer =0;
int imageIndex=0;


void setup()
{
  background(40,40,40);
  size (500,500);
  for (int index = 0; index < 10; index += 1)
  {
    images[index] = new SpriteObject("animal0.jpg");
  }
   images[1] = new SpriteObject("animal1.jpg");
   images[1].s = 0.5;
   
   images[2] = new SpriteObject("animal2.jpg");
   images[2].s = 0.5;
   
   images[3] = new SpriteObject("anima3.jpg");
   images[3].s = 0.5;
   
   images[4] = new SpriteObject("animal4.jpg");
   images[4].s = 0.5;
   
   images[5] = new SpriteObject("animal5.jpg");
   images[5].s = 0.5;
   
   images[6] = new SpriteObject("animal6.jpg");
   images[6].s = 0.5;
   
   images[7] = new SpriteObject("animal7.jpg");
   images[7].s = 0.5;
   
   images[8] = new SpriteObject("animal8.jpg");
   images[8].s = 0.5;
   
   images[9] = new SpriteObject("animal9.jpg");
   images[9].s = 0.5;
    
   
  for (int index = 0; index < 10; index += 1)
  {
    numbers[index] = random(0, 7);
  }
   
  for (int index = 0; index < 10; index += 1)
  {
     println(numbers[index]);
  }
   
  image1 = new SpriteObject("animal0.jpg");
  image1.x = 100;
  image1.y = 200;
  image1.rotation = 45;
  image1.w = 500;
  image1.h = 500;
   
  image2 = new SpriteObject("animal1.jpg");
  image2.rotation = 30;
  image2.x =300;
  image2.y =300;
}

void draw()
{
 
  timer += 0.0167;
  if (timer > 3)
  {
    imageIndex += 1;
    timer = 0;
  }
  if (imageIndex >= 10)
  {
    imageIndex = 0;
  }
  if (imageIndex < 0)
  {
    imageIndex = 9;
  }
   
  images[imageIndex].render();

}



class SpriteObject
{
  float x = 250.0;
  float y = 250.0;
  float w = -1.0;
  float h = -1.0;
  PImage img;
  float rotation = 0.0;
  float s = 1.0;
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
  if (key == '0')
  {
    imageIndex = 0;
  }
  if (key == '5')
  {
    imageIndex = 5;
  }
  if (key == 'd')
  {
    imageIndex += 1;
  }
  if (key == 'a')
  {
    imageIndex -= 1;
  }
    
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      imageIndex += 1;
    }
  }
}



