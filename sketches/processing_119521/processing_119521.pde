
/**
 * Sequential
 * by James Paterson.  
 * 
 * Displaying a sequence of images creates the illusion of motion. 
 * Twelve images are loaded and each is displayed individually in a loop. 
 */

// @pjs preload must be used to preload media if the program is 
// running with Processing.js
/* @pjs preload="PT_anim0000.gif, PT_anim0001.gif, PT_anim0002.gif, PT_anim0003.gif,
PT_anim0004.gif, PT_anim0005.gif, PT_anim0006.gif, PT_anim0007.gif, PT_anim0008.gif,
PT_anim0009.gif, PT_anim0010.gif, PT_anim0011.gif"; */ 

int numFrames = 102;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup() {
  size(600, 480);
  frameRate(25);
  
  for (int i = 0; i < numFrames; i++) {
    String imageName = "imgzs/bubzs" + nf(i, 3) + ".jpg";
    images[i] = loadImage(imageName);
  }
} 
 
void draw() { 
  background(0);
  if (mousePressed) {
    frame = (frame+1) % numFrames;  // Use % to cycle through frames
  }
  image(images[frame], 0, 0);
  
  /*int offset = 0;
  for (int x = -100; x < width; x += images[0].width) { 
    image(images[(frame+offset) % numFrames], x, -20);
    offset+=2;
    image(images[(frame+offset) % numFrames], x, height/2);
    offset+=2;
  }*/
}


