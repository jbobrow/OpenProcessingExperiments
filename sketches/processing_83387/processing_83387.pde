
PImage bg;
PImage[] idle = new PImage[3];
PImage[] flash = new PImage[6];
PImage[] punch = new PImage[4];
PImage[] kick = new PImage[7];
int frame = 0;

int value = 0;

void setup() {
  frameRate(7);
  size (640,480);
  bg = loadImage ("bg.jpg");
  
     for (int i = 0; i < idle.length; i ++)
   {
      idle[i] = loadImage( "idle" + i +".png");
   }
  
     for (int i = 0; i < flash.length; i ++)
   {
      flash[i] = loadImage( "flash" + i +".png");
   }  
   
     for (int i = 0; i < punch.length; i ++)
   {
      punch[i] = loadImage( "punch" + i +".png");
   }
        for (int i = 0; i < kick.length; i ++)
   {
      kick[i] = loadImage( "kick" + i +".png");
   }
}
  
  
void draw() {

  smooth();
image(bg,0,0);

   /*
  if (mousePressed)
  {
    image(flash[frame++ % flash.length], -35, 155);
  }
  else
  {
    image(idle[frame++ % idle.length], -35, 155);
  }
*/


   if (keyPressed == true) {
     
    if( key == 'q' )
     {
       image(flash[frame++ % flash.length], -35, 155);
     }
     
     else if( key == 'w' )
     {
       image(punch[frame++ % punch.length], -35, 155);
     }

     else if( key == 'e' )
     {
       image(kick[frame++ % kick.length], -35, 155);
     }
        else 
    {
       image(idle[frame++ % idle.length], -35, 155);
    }
   }
   else 
    {
       image(idle[frame++ % idle.length], -35, 155);
    }
   
} 



