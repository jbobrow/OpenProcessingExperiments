
int numFrames = 16; 
int frame = 0;
PImage[] images = new PImage[numFrames];
 
void setup()
{
  frameRate(30);
  size(300, 225);
    for (int i = 0; i < images.length; i ++)
  {
    images[i] = loadImage( i +".png");
  } 
}

void draw()
{
 background (255);
   frame = frame + 1;
   if (frame>=numFrames){
    frame=0;
  }
  // frame = (frame+1) % numFrames;  // Use % to cycle through frames
   image(images[frame], 0, 0);
 }


