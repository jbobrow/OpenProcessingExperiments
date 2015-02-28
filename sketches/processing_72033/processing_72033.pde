
//This code is modded from Sequential by James Patterson.  
//Displaying a sequence of images creates the illusion of motion. 
//Images are loaded and each is displayed individually in a loop. 
 
int numFrames = 3;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup()
{
  size(200, 200);
  frameRate(10);
  
  images[0]  = loadImage("head1000.png");
  images[1]  = loadImage("head1001.png"); 
  images[2]  = loadImage("head1002.png"); 
} 
 
void draw() 
{ 
  background(255,125,0);
  frame = frame + 1;
  if (frame>=numFrames){
   frame=0; 
  }
 // frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], 50, 50);
}

