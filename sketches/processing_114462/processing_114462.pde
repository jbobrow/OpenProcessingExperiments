
/* @ pjs preload="Clip0.png, Clip1.png, Clip2.png, Clip3.png, Clip4.png, Clip5.png, Clip6.png, Clip7.png, Clip8.png, Clip9.png, 
Clip10.png, Clip11.png, Clip12.png, Clip13.png, Clip14.png, Clip15.png, Clip16.png"; */
// general structure of the code from http://www.openprocessing.org/sketch/87384#
int currentClip = 0;
PImage[] clip = new PImage[17];
float timer = 0;
float x = 0;

void setup()
 {
   size(735,500);
   for ( int i = 0; i < 17; i += 1 )
   {
     clip[i] = loadImage("Clip" + i + ".png");
   }
   
   frameRate(25);
 }
 
 void draw()
 {
   timer += 1;
   background(0);
   image(clip[currentClip],0,0);
   for ( int i = 0; i < 5; i += 1)
   {
     println(i);
   }
   for(int a = 0;a < 10; a += 1)
   {
    println(a);
   }
   for(int b = 0;b < 15; b += 1)
   {
    println(b);
   }
   for(int c = 0;c < 20; c += 1)
   {
    println(c);
   }
   for(int d = 0;d < 25;d += 1)
   {
    println(d);
   }
   for(int e = 0;e < 30;e += 1)
   {
    println(e);
   }
   for(int f = 0;f < 35;f += 1)
   {
    println(f);
   }
   for(int g = 0;g < 40;g += 1)
   {
    println(g);
   }
   for(int h = 0;h < 45;h += 1)
   {
    println(h);
   }
   if (timer > 110 && timer <= 111)
    {
      background(0);
      currentClip = 1; 
    }   
   if (timer > 220 && timer <= 221)
    {
      background(0);
      currentClip = 2; 
    }   
   if (timer > 330 && timer <= 331)
    {
      background(0);
      currentClip = 3; 
    }    
    if (timer > 440 && timer <= 443)
    {
      background(0);
      currentClip = 4; 
    }    
    if (timer > 470 && timer <= 473)
    {
      background(0);
      currentClip = 5; 
    }    
    if (timer > 510 && timer <= 513)
    {
      background(0);
      currentClip = 6; 
    }    
    if (timer > 550 && timer <= 553)
    {
      background(0);
      currentClip = 7; 
    }
    if (timer > 600 && timer <= 603)
    {
      background(0);
      currentClip = 8; 
    }   
    if (timer > 650 && timer <= 653)
    {
      background(0);
      currentClip = 9; 
    }    
    if (timer > 670 && timer <= 673)
    {
      background(0);
      currentClip = 10; 
    }
    if (timer > 690 && timer <= 693)
    {
      background(0);
      currentClip = 11; 
    }  
    if (timer > 710 && timer <= 713)
    {
      background(0);
      currentClip = 12; 
    }
    if (timer > 730 && timer <= 733)
    {
      background(0);
      currentClip = 13; 
    }
    if (timer > 840 && timer <= 843)
    {
      background(0);
      currentClip = 14; 
    }
    if (timer > 950 && timer <= 953)
    {
      background(0);
      currentClip = 15; 
    }
    if (timer > 1000 && timer <= 1003)
    {
      background(0);
      currentClip = 16; 
    }
    
 }


