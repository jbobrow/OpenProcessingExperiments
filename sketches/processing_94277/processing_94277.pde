
// @pjs preload must be used to preload media if the program is 
// running with Processing.js
/* @pjs preload="PT_anim0000.gif, PT_anim0001.gif, PT_anim0002.gif, PT_anim0003.gif,
PT_anim0004.gif, PT_anim0005.gif, PT_anim0006.gif, PT_anim0007.gif, PT_anim0008.gif,
PT_anim0009.gif, PT_anim0010.gif, PT_anim0011.gif"; */ 

int numFrames = 9;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup() {
  size(640, 360);
  frameRate(7);
  
  images[0]  = loadImage("o_0001.png");
  images[1]  = loadImage("o_0002.png"); 
  images[2]  = loadImage("o_0003.png");
  images[3]  = loadImage("o_0004.png"); 
  images[4]  = loadImage("o_0005.png");
  images[5]  = loadImage("o_0006.png"); 
  images[6]  = loadImage("o_0007.png");
  images[7]  = loadImage("o_0008.png"); 
  images[8]  = loadImage("o_0009.png");
  
  // If you don't want to load each image separately
  // and you know how many frames you have, you
  // can create the filenames as the program runs.
  // The nf() command does number formatting, which will
  // ensure that the number is (in this case) 4 digits.
  //for (int i = 0; i < numFrames; i++) {
  //  String imageName = "PT_anim" + nf(i, 4) + ".gif";
  //  images[i] = loadImage(imageName);
  //}
} 
 
void draw() { 
  background(0);
  
  if (mouseX<10){
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  int offset = 0;
  int x = 0; 
 image(images[(frame+offset) % numFrames], x, -20);
}
 
}


