
int numFrames = 4;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
int counter=0;
    
void setup()
{
  size(800, 600);
  frameRate(4);
  
  images[0]  = loadImage("neha1.png");
  images[1]  = loadImage("neha2.png"); 
  images[2]  = loadImage("neha3.png");
  images[3]  = loadImage("neha4.png"); 
 
  } 
 
void draw() 
{ 
  // Use % to cycle through frames
  image(images[frame], 50, 50);
  frame = (frame+1) % numFrames;
}

