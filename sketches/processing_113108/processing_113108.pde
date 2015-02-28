
int numFrames = 8;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup() {
  size(640, 520);
  frameRate(8);

  images[0]  = loadImage("0.jpg");
  images[1]  = loadImage("1.jpg"); 
  images[2]  = loadImage("2.jpg");
  images[3]  = loadImage("3.jpg"); 
  images[4]  = loadImage("4.jpg");
  images[5]  = loadImage("5.jpg"); 
  images[6]  = loadImage("6.jpg");
  images[7]  = loadImage("7.jpg");
}


void draw() { 
  background(0);
  frame = (frame+2) % numFrames;  // Use % to cycle through frames
  int offset = 0;
  for (int x = -150; x < width; x += images[0].width) { 
    image(images[(frame+offset) % numFrames], x, 0);
    offset+=2;
    image(images[(frame+offset) % numFrames], x, 140);
    offset+=2;
   
    image(images[(frame+offset) % numFrames], x, 280);
    offset+=2;
    image(images[(frame+offset) % numFrames], x, 420);
    offset+=2;
  }
}



