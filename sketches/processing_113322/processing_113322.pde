
SpriteObject image1;
SpriteObject image2;
float[] numbers = new float[10];
SpriteObject[] images = new SpriteObject[10];
float timer = 0;
int imageIndex = 0;
 
void setup()
{
  size(500, 500);
  
  for (int index = 0; index < 10; index += 1)
  {
    images[index] = new SpriteObject("skull.jpg");
    images[index].x = random(width);
    images[index].y = random(height);
    images[index].s = random(0.5);
  }
  
  images[6] = new SpriteObject("stoneskull.jpg");
  images[6].s = 0.1;
  
  for (int index = 0; index < 10; index += 1)
  {
    numbers[index] = random(0, 7);
  }
  
  for (int index = 0; index < 10; index += 1)
  {
     println(numbers[index]);
  }
  
  image1 = new SpriteObject("skull.jpg");
  image1.x = 100;
  image1.y = 200;
  image1.rotation = 45;
  image1.w = 100;
  image1.h = 100;
  
  image2 = new SpriteObject("stoneskull.jpg");
  image2.rotation = 30;
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
 
void draw()
{
  image1.x = mouseX;
  image1.y = mouseY;
  image2.rotation += 1;
  image2.render();
  image1.render();

  timer += 0.0167;
  if (timer > 3)
  {
    //imageIndex += 1;
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
  float x = 0.0;
  float y = 0.0;
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





