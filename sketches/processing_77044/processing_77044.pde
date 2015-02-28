
int numFrames = 20; 
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup()
{
  frameRate(30);
  size(500, 380);
    for (int i = 0; i < images.length; i ++)
  {
    images[i] = loadImage( i +".png");
  } 
}

void draw()
{
 background (255);
  smooth(); 
{
  background(255);
   frame = frame + 1;
  }
  // frame = (frame+1) % numFrames;  // Use % to cycle through frames
   image(images[frame], 0, 0);
 }


