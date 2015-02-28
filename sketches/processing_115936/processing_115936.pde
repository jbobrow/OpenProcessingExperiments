
int s;
int lastSecond;
PImage img0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
int gunFrame = 0;
    

void setup()
{
  size(800, 600);
  img0 = loadImage("gunparts0.png");
  img1 = loadImage("gunparts1.png");
  img2 = loadImage("gunparts2.png");
  img3 = loadImage("gunparts3.png");
  img4 = loadImage("gunparts4.png");
  img5 = loadImage("gunparts5.png");
  img6 = loadImage("gunparts6.png");
  img7 = loadImage("gunparts7.png");
  img8 = loadImage("gunparts8.png");
  img9 = loadImage("gunparts9.png");
}
 
void draw()
{
  s = second();
   /*
   image(img0, 0, 0);
   image(img1, 0, 0);
   image(img2, 0, 0);
   image(img3, 0, 0);
   image(img4, 0, 0);
   image(img5, 0, 0);
   image(img6, 0, 0);
   image(img7, 0, 0);
   image(img8, 0, 0);
   image(img9, 0, 0);*/
   

  if (s != lastSecond)
  {
    gunFrame++;
    
    if(gunFrame == 10)
      {
        gunFrame = 0;
      }
      
      
      if(gunFrame == 0)
      {
        image(img0, 0, 0);
      }
    
     if(gunFrame == 1)
      {
        image(img1, 0, 0);
      }
    
     if(gunFrame == 2)
      {
        image(img2, 0, 0);
      }
    
     if(gunFrame == 3)
      {
        image(img3, 0, 0);
      }
      
       if(gunFrame == 4)
      {
        image(img4, 0, 0);
      }
      
       if(gunFrame == 5)
      {
        image(img5, 0, 0);
      }
      
       if(gunFrame == 6)
      {
        image(img6, 0, 0);
      }
      
       if(gunFrame == 7)
      {
        image(img7, 0, 0);
      }
      
       if(gunFrame == 8)
      {
        image(img8, 0, 0);
      }
      
       if(gunFrame == 9)
      {
        image(img9, 0, 0);
      }
      
      
      
     
    
    println(gunFrame);
    lastSecond = s;
  }
}





