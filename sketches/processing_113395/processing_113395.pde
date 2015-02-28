
int numFrames = 12;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup() {
  size(200, 425);
  frameRate(3);
  
  images[0]  = loadImage("firstleft.png");
  images[1]  = loadImage("firstright.png"); 
  images[2]  = loadImage("firstleft.png");
  images[3]  = loadImage("secondright.png"); 
  images[4]  = loadImage("secondleft.png");
  images[5]  = loadImage("secondright.png"); 
  images[6]  = loadImage("thirdleft.png");
  images[7]  = loadImage("thirdright.png"); 
  images[8]  = loadImage("thirdleft.png");
  images[9]  = loadImage("fourthright.png"); 
  images[10] = loadImage("fourthleft.png");
  images[11] = loadImage("fourthright.png"); 
  

} 
 
void draw() { 
  background(0);
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  int offset = 0;
  for (int x = 0; x < width; x += images[0].width) { 
    image(images[(frame+offset) % numFrames], 0, 0);
    offset+=2;
  }
}
    



