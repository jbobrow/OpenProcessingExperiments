
int numFrames = 15  ;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup()
{
  size(480, 500);
  frameRate(15);
  
  images[0]  = loadImage("anime2.png");
  images[1]  = loadImage("anime1.png"); 
  images[2]  = loadImage("anime4.png");
  images[3]  = loadImage("experiment3.png"); 
  images[4]  = loadImage("experiment4.png");
  images[5]  = loadImage("anime7.png"); 
  images[6]  = loadImage("experiment6.png");
  images[7]  = loadImage("experiment7.png"); 
  images[8]  = loadImage("anime5.png"); 
  images[9]  = loadImage("anime1.png"); 
  images[10]  = loadImage("anime3.png"); 
  images[11]  = loadImage("anime2.png"); 
  images[12]  = loadImage("anime6.png"); 
  images[13]  = loadImage("anime5.png"); 
  images[14]  = loadImage("anime7.png"); 

  
  // If you don't want to load each image separately
  // and you know how many frames you have, you
  // can create the filenames as the program runs.
  // The nf() command does number formatting, which will
  // ensure that the number is (in this case) 4 digits.
  //for(int i=0; i<numFrames; i++) {
  //  String imageName = "PT_anim" + nf(i, 4) + ".gif";
  //  images[i] = loadImage(imageName);
  //}
} 
 
void draw() 
{ 
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], 15, 15);
}

