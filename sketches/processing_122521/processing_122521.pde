
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
SpriteObject image11;
SpriteObject image12;
SpriteObject image13;
SpriteObject image14;
SpriteObject image15;
 
float[] numbers = new float[14];
SpriteObject[] images = new SpriteObject[14];
float timer = 0;
int imageIndex = 0;
float x = 0;
float y = 0;
float w = 0;
float h = 0;
    
void setup()
{
    size(800, 600);
     
for (int index = 0; index < 14; index += 1)
  {
    for (int indexOne = 0; indexOne < 14; indexOne += 1)
   {
  images[index] = new SpriteObject("city.jpg");
   }
  }
 
 
for (int index = 0; index < 14; index += 1)
  {
    for (int indexTwo = 0; indexTwo < 14; indexTwo += 1)
   {
  images[index].x = width / 2;
   }
  }
 
for (int index = 0; index < 14; index += 1)
  {
    for (int indexThree = 0; indexThree < 14; indexThree += 1)
   {
  images[index].y = height / 2;
   }
  }
 
for (int index = 0; index < 14; index += 1)
 {
    for (int indexFour = 0; indexFour < 14; indexFour += 1)
   {
  images[index].w = width;
   }
 }
 
for (int index = 0; index < 14; index += 1)
   {
    for (int indexFive = 0; indexFive < 14; indexFive += 1)
   {
  images[index].h = height;
   }
  }
 
 
 
 
     
  images[1] = new SpriteObject("daybreak.jpg");
    
  images[2] = new SpriteObject("win.jpg");
   
  images[3] = new SpriteObject("zombie4.jpg");
     
  images[4] = new SpriteObject("police.JPG");
       
  images[5] = new SpriteObject("corner.jpg");
         
  images[6] = new SpriteObject("zombi horde.jpg");
  
  images[7] = new SpriteObject("running.jpg");
   
  images[8] = new SpriteObject("gun.png");
  images[8].s =.5;
   
  images[9] = new SpriteObject("bullet.png");
   
  images[10] = new SpriteObject("missile.png");
   
  images[11] = new SpriteObject("explosion.png");
   

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
   background(00);
  timer += 0.0167;
  if (timer > 3)
  {
    imageIndex += 1;
    timer = 0;
  }
  if (imageIndex >= 14)
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
  float x = 400;
  float y = 300;
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
      translate(x, y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



