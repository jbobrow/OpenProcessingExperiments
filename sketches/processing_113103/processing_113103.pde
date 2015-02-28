
// Xavier Wong 53077176
// CMS3 Assignment3_Unexpectable Weather

int numFrames = 11;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup() {
  size(300, 300); // Sets the window size
  frameRate(10); 
  
  images[0]  = loadImage("CLOUDYDAY copy.gif");
  images[1]  = loadImage("CLOUDYDAY copy1.gif"); 
  images[2]  = loadImage("CLOUDYDAY copy2.gif");
  images[3]  = loadImage("CLOUDYDAY copy3.gif");
  images[4]  = loadImage("CLOUDYDAY copy4.gif");
  images[5]  = loadImage("CLOUDYDAY copy5.gif");
  images[6]  = loadImage("CLOUDYDAY copy4.gif"); 
  images[7]  = loadImage("CLOUDYDAY copy3.gif");
  images[8]  = loadImage("CLOUDYDAY copy2.gif");
  images[9]  = loadImage("CLOUDYDAY copy1.gif");  
  images[10]  = loadImage("CLOUDYDAY copy.gif");  
} 
 
void draw() { 
  background(0);
  
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  int offset = 0;
  for (int x = -100; x < width; x += images[0].width) { 
    image(images[(frame+offset) % numFrames], 0, 0, 300, 300);
    offset+=2;
      
  }
}

