
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
float angle = 0.0;
float s = 0;
float e = 0.3;
int imageIndex = 0;
void setup()
{
  size(500, 500);
  
  for(int index = 0; index < 10; index += 1)
  {
   images[index] = new SpriteObject("Red_Wry_2.jpg");
   images[1] = new SpriteObject("Ball_Breaker_GHA.jpg");
   images[2] = new SpriteObject("Stone_Free_Baseball_Spin.jpg");
   images[3] = new SpriteObject("Gyro_Second_Stand.PNG");
   images[4] = new SpriteObject("jojohd_compare4.jpg");
   
   images[5] = new SpriteObject("tusk_4_finisher.jpg");
   images[5].s = 1.0;
   
   images[6] = new SpriteObject("jojosbizarreadventure_s9.jpg");
   images[7] = new SpriteObject("jojosbizarreadventure_s11.jpg");
   images[8] = new SpriteObject("jojosbizarreadventure_s10.jpg");
   images[9] = new SpriteObject("Jotaro_retry.jpg");
  }
   
   for(int index = 0; index < 10; index += 1)
  {
    //numbers[index] = random(0,7);
    image1 = new SpriteObject("Red_Wry_2.jpg");
    image1.x = 100;
    image1.y = 200;
    //image1.rotation = 45;
    image1.w = width;
    image1.h = height;
    
    image6 = new SpriteObject("tusk_4_finisher.jpg");
    image6.rotation = 30;
    
    image2 = new SpriteObject("Ball_Breaker_GHA.jpg");
    image2.s = 2.0;
    
    image3 = new SpriteObject("Stone_Free_Baseball_Spin.jpg");
    image4 = new SpriteObject("Gyro_Second_Stand.PNG");
    image5 = new SpriteObject("jojohd_compare4.jpg");
    image7 = new SpriteObject("jojosbizarreadventure_s9.jpg");
    image8 = new SpriteObject("jojosbizarreadventure_s11.jpg");
    image9 = new SpriteObject("jojosbizarreadventure_s10.jpg");
    image10 = new SpriteObject("Jotaro_retry.jpg");
  }
  
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
 timer+=0.0167;
 image1.x = mouseX;
 image1.y = mouseY;
 if (timer > 2)
 {
   image1.render();
   stroke(#21DBD6);
   strokeWeight(10);
   float ly = 225.0;
   float lx = 100.0;
   while(lx < 250)
   {
    float nextX = lx + random(75);
    float nextY = ly + random(-10, 5);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
   }
   strokeWeight(1);
   
   stroke(#E5B617);
   strokeWeight(10);
   float lz = 100;
   float lw = 100;
   while (lw < 450)
   {
    float nextW = lw + random(150);
    float nextZ=  lz + random(150);
    line(lw, lz, nextW, nextZ);
    lw = nextW;
    lz = nextZ;
   }
   strokeWeight(1);
 }
 
 if (timer > 5)
 {
  pushMatrix();
  rotate(angle);  
  image2.render();
  image2.filter(INVERT);
  popMatrix();
 }
 
 if (timer > 7)
  {
    pushMatrix();
    translate(350, 350);
    scale(s, s);
    image3.render();
    popMatrix();
    s += e;
     if (s > 2)
     {
      e = - 0.3;
     }
     if (s < 0.5)
     {
       e = 0.3;
     }
  }
  
 if (timer > 9)
 {
   image4.render();
   stroke(#21DBD6);
   strokeWeight(10);
   float ly = 225.0;
   float lx = 100.0;
   while(lx < 250)
   {
     float nextX = lx + random(75);
     float nextY = ly + random(-10, 5);
     line(lx, ly, nextX, nextY);
     ly = nextY;
     lx = nextX;
   }
   fill(20, 30, 45);
   strokeWeight(1);
 }
 
 if (timer > 11)
 {
   image5.render();
   for (int x =0;x<100;x+=1) 
   {
     for (int y=0;y<100;y+=1) 
     {
       stroke(x+y*2,0,0); // this is black to red
       point(x, y);
     }
   }
 }
 
 if (timer > 15)
 {
   image6.render();
   image10.filter(THRESHOLD);
 }
 
 if (timer > 20)
 {
   image7.render();
   image7.rotation = 30;
 }
 
 if (timer > 25)
 {
   pushMatrix();
   rotate(angle/2);
   image8.render();
   image8.filter(POSTERIZE, 8);
   popMatrix();
 }
  if (timer > 30)
  {
    image9.render();
    
  }
 
 if (timer > 35)
 {  
  image10.render();
  image10.filter(INVERT);
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



