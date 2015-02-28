
/*
J. Dailey
Code derived from:
"" & "" by Brian Schrank, Phd.


Top-down sprite is credited to Prinz Eugn via GameDev.net
*/


  // Number of animation frames in the animation.
  int numFramesCursor = 4;
  //
  int Cursor_x = 10;
  // "Frame rate" for the images.
  int framesCursor = 0; //Cursor.
  
  PImage[] imagesCursor = new PImage[numFramesCursor];
  
  int framesHolderGrab = 0; //
  int numFramesHolderGrab = 4; // Holding animation.
  
  PImage[] imagesHolderGrab = new PImage[numFramesHolderGrab]; 
  PImage imagesHolderIdle, imagesHolderHolding;
  int x_HolderPos = 0;
  int y_HolderPos = 0;
  

  
  
void setup()
{
  size (220,500);
  background(255);
  
  //Holder images, which reqires no animation.
  imagesHolderIdle = loadImage("Holder_Idle.png");
  imagesHolderHolding = loadImage("Holder_Ani003.png");
  
  //Holder images, requiring animation. "Grabing"
  imagesHolderGrab[0] = loadImage("Holder_Idle.png");
  imagesHolderGrab[1] = loadImage("Holder_Ani003.png");
  imagesHolderGrab[2] = loadImage("Holder_Ani003.png");
  imagesHolderGrab[3] = loadImage("Holder_Ani003.png");
  
  //Cursor
  imagesCursor[0] = loadImage("Cursor001.png");
  imagesCursor[1] = loadImage("Cursor002.png");
  imagesCursor[2] = loadImage("Cursor003.png");
  imagesCursor[3] = loadImage("Cursor004.png");
  //imagesCursor[] = loadImage("Cursor'''.png");
}

void draw()
{
  background(255);
  println(Cursor_x);
  //
  //
  _Cursor();
}

void _Cursor()
{
 translate(0, 0);
 framesCursor = framesCursor + 1;
 if (framesCursor >= numFramesCursor) { framesCursor = 0; } 
 image(imagesCursor[framesCursor], Cursor_x ,440);
}


//
void keyPressed() 
{ 
   if (keyCode == ' ') //Coordinates 10,60,110,160.
    {
      if (Cursor_x == 10 || Cursor_x == 60 || Cursor_x == 110 || Cursor_x == 160)
    { image(imagesHolderIdle, Cursor_x ,440); }
    }
  if (key == CODED) 
  {
  if (keyCode == LEFT)
    {
      if (Cursor_x > 10) { Cursor_x -= 50; }
    }
   else if (keyCode == RIGHT)
    {
      if (Cursor_x < 160) { Cursor_x += 50; }
    }
  }
}


