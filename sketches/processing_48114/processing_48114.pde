
/**
 * Sequential
 * by James Patterson.  
 * 
 * Displaying a sequence of images creates the illusion of motion. 
 * Twelve images are loaded and each is displayed individually in a loop. 
 */
  
int numFrames = 18;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup()
{
  size(800, 800);
  background(0);

  images[0]  = loadImage("instructions.jpg");
  images[1]  = loadImage("uglybug.jpg");
  images[2]  = loadImage("coke.jpg"); 
  images[3]  = loadImage("lily.jpg");
  images[4]  = loadImage("rose.jpg"); 
  images[5]  = loadImage("madonna.jpg");
  images[6]  = loadImage("moandred.jpg"); 
  images[7]  = loadImage("moon.jpg");
  images[8]  = loadImage("paintpots.jpg"); 
  images[9]  = loadImage("fort.jpg");
  images[10]  = loadImage("bottle1.jpg"); 
  images[11] = loadImage("glass.jpg");
  images[12] = loadImage("bottle2.jpg");
  images[13] = loadImage("flowers.jpg");
  images[14] = loadImage("1921.jpg");
  images[15] = loadImage("nchs.jpg");
  images[16] = loadImage("flower.jpg");
  images[17] = loadImage("credit.jpg");

  
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
  frame = (frame) % numFrames;  // Use % to cycle through frames
  image(images[frame], 0, 0);
  
}

void mousePressed() {
  changeImage();
}

void changeImage() {
  if (frame<18)
  { frame++;
  }
  else frame = 0;
}





