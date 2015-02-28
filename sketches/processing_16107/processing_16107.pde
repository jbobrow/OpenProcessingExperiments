
int numFrames = 120;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[6*numFrames];
int boo;
int n; // number of images
    
void setup()
{
  size(500, 500);
  frameRate(10);
  boo = 0;
  n = 6;
//  images[0]  = loadImage("PT_anim0000.gif");
//  images[1]  = loadImage("PT_anim0001.gif"); 
//  images[2]  = loadImage("PT_anim0002.gif");
//  images[3]  = loadImage("PT_anim0003.gif"); 
//  images[4]  = loadImage("PT_anim0004.gif");
//  images[5]  = loadImage("PT_anim0005.gif"); 
//  images[6]  = loadImage("PT_anim0006.gif");
//  images[7]  = loadImage("PT_anim0007.gif"); 
//  images[8]  = loadImage("PT_anim0008.gif");
//  images[9]  = loadImage("PT_anim0009.gif"); 
//  images[10] = loadImage("PT_anim0010.gif");
//  images[11] = loadImage("PT_anim0011.gif"); 
  
  // If you don't want to load each image separately
  // and you know how many frames you have, you
  // can create the filenames as the program runs.
  // The nf() command does number formatting, which will
  // ensure that the number is (in this case) 4 digits.
  for(int i=1; i<21; i++) {
    String imageName = "/im1-im2/screen-" + nf(i, 4) + ".tif";
    images[i] = loadImage(imageName);
  }
  
    for(int j=1; j<21; j++) {
    String imageName = "/im2-im3/screen-" + nf(j, 4) + ".tif";
    images[(numFrames/n)+j] = loadImage(imageName);
  }
  
    for(int k=1; k<21; k++) {
    String imageName = "/im3-im4/screen-" + nf(k, 4) + ".tif";
    images[(2*numFrames/n)+k] = loadImage(imageName);
  }
  
    for(int l=1; l<21; l++) {
    String imageName = "/im4-im5/screen-" + nf(l, 4) + ".tif";
    images[(3*numFrames/n)+l] = loadImage(imageName);
    }
    
    for(int m=1; m<21; m++) {
    String imageName = "/im5-im6/screen-" + nf(m, 4) + ".tif";
    images[(4*numFrames/n)+m] = loadImage(imageName);
    }
    
    for(int o=1; o<21; o++) {
    String imageName = "/im6-im1/screen-" + nf(o, 4) + ".tif";
    images[(5*numFrames/n)+o] = loadImage(imageName);
  }
    
  }
    

 
void draw() 
{ 
  if (frame < numFrames-1)
  {
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  //println(frame);
  image(images[frame], 0, 0);
  }
  
  else
  {
    frame = 0;
  }
}

