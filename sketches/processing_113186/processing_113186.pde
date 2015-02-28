


int numFrames = 12;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup() {
  size(364,641);
  frameRate(1);
  
  images[0]  = loadImage("PT_anim0000.jpg");
  images[1]  = loadImage("PT_anim0001.jpg"); 
  images[2]  = loadImage("PT_anim0002.jpg");
  images[3]  = loadImage("PT_anim0003.jpg"); 
  images[4]  = loadImage("PT_anim0004.jpg");
  images[5]  = loadImage("PT_anim0005.jpg"); 
  images[6]  = loadImage("PT_anim0006.jpg");
  images[7]  = loadImage("PT_anim0007.jpg"); 
  images[8]  = loadImage("PT_anim0008.jpg");
  images[9]  = loadImage("PT_anim0009.jpg"); 
  images[10] = loadImage("PT_anim0010.jpg");
  images[11] = loadImage("PT_anim0011.jpg"); 
  
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
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  int offset = 0;
  for (int x = -100; x < width; x += images[0].width) { 
    image(images[(frame+offset) % numFrames], x, -20);
    offset+=2;
    image(images[(frame+offset) % numFrames], x, height/2);
    offset+=2;
  }
}

