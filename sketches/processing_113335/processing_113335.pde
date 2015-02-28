
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
//float[] numbers = new float[10];
SpriteObject[] images = new SpriteObject[10];
float timer = 0;
int imageIndex = 0;
void setup()
{
  size(500, 500);
  
  for(int index = 0; index < 10; index += 1)
  {
    images[index] = new SpriteObject("oswald_gwendolyn.jpg");
    images[index].x = random(width);
    images[index].y = random(height); 
    images[index].s = random(0.5);
  }
  
   images[1] = new SpriteObject("Ball_Breaker_GHA.jpg");
   images[2] = new SpriteObject("Stone_Free_Baseball_Spin.jpg");
   images[3] = new SpriteObject("Gyro_Second_Stand.PNG");
   images[4] = new SpriteObject("jojohd_compare4.jpg");
   
   images[5] = new SpriteObject("tusk_4_finisher.jpg");
   images[5].s = 1.0;
   
   images[6] = new SpriteObject("jojosbizarreadventure_s9.jpg");
   images[7] = new SpriteObject("jojosbizarreadventure_s11.jpg");
   images[8] = new SpriteObject("jojosbizarreadventure_s10.jpg");
   images[9] = new SpriteObject("jojohd_s12.jpg");
   
   for(int index = 0; index < 10; index += 1)
  {
    //numbers[index] = random(0,7);
  }
  
  image1 = new SpriteObject("oswald_gwendolyn.jpg");
  image1.x = 100;
  image1.y = 200;
  image1.rotation = 45;
  image1.w = 100;
  image1.h = 100;
  
  image6 = new SpriteObject("tusk_4_finisher.jpg");
  image6.rotation = 30;
  
  image2 = new SpriteObject("Ball_Breaker_GHA.jpg");
  image3 = new SpriteObject("Stone_Free_Baseball_Spin.jpg");
  image4 = new SpriteObject("Gyro_Second_Stand.PNG");
  image5 = new SpriteObject("jojohd_compare4.jpg");
  image7 = new SpriteObject("jojosbizarreadventure_s9.jpg");
  image8 = new SpriteObject("jojosbizarreadventure_s11.jpg");
  image9 = new SpriteObject("jojosbizarreadventure_s10.jpg");
  image10 = new SpriteObject("jojohd_s12.jpg");
}
 
void keyReleased()
{
  if ( key == '0')
  {
    imageIndex = 0;
  }
  if ( key == '5')
  {
    imageIndex = 5;
  }
  if ( key == 'd')
  {
    imageIndex += 1;
  }
  if ( key == 'a')
  {
    imageIndex -= 1;
  }
  if ( key == CODED)
  {
    if (keyCode == RIGHT)
    {
      imageIndex += 1;
    }
    if (keyCode == LEFT)
    {
      imageIndex -= 1;
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
 image3.render();
 image4.render();
 image5.render();
 image6.render();
 image7.render();
 image8.render();
 image9.render();
 image10.render();
 timer+=0.0167;
 if (timer > 3)
 {
   //imageIndex += 1;
   timer = 0;
 }
 
 if (imageIndex >= 10)
 {
   imageIndex = 0;
   //timer = 0;
 }
 
 if (imageIndex < 0)
 {
   imageIndex = 9;
   //timer = 0;
 }
 images[imageIndex].render();
 //println(imageIndex);
}
 
 
class SpriteObject
{
  float x = 250.0;
  float y = 250.0;
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



