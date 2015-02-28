
int numFrames = 12;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup() {
  size(1024, 750);
  frameRate(5);
  
  images[0]  = loadImage("1.JPG");
  images[1]  = loadImage("2.JPG"); 
  images[2]  = loadImage("3.JPG");
  images[3]  = loadImage("4.JPG"); 
  images[4]  = loadImage("5.JPG");
  images[5]  = loadImage("6.JPG"); 
  images[6]  = loadImage("7.JPG");
  images[7]  = loadImage("8.JPG"); 
  images[8]  = loadImage("9.JPG");
  images[9]  = loadImage("10.JPG"); 
  images[10] = loadImage("11.JPG");
  images[11] = loadImage("12.JPG"); 
  
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
    image(images[(frame+offset) % numFrames], 0,0);
}


