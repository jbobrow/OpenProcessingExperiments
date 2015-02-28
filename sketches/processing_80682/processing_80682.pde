
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/48114*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**
 * Sequential
 * by James Patterson.  
 * 
 * Displaying a sequence of images creates the illusion of motion. 
 * Twelve images are loaded and each is displayed individually in a loop. 
 */
  
int numFrames = 8;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup()
{
  size(582, 517);
  background(0);

  images[0]  = loadImage("arms.jpg");
  images[1]  = loadImage("ladies.JPG"); 
  images[2]  = loadImage("katrina.jpg");
  images[3]  = loadImage("ladies2.jpg"); 
  images[4]  = loadImage("ladies3.jpg");
  images[5]  = loadImage("jenn.jpg"); 
  images[6]  = loadImage("fuji.jpg");
  images[7]  = loadImage("sina.jpg"); 


  
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
  if (frame<7)
  { frame++;
  }
  else frame = 0;
}





