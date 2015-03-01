
int numFrames = 12; // The number of animation frames
int frame = 0; // The frame to display
PImage[] images = new PImage[numFrames]; // Image array
 
void setup() {
  size(100, 100);
  frameRate(30); // Maximum 30 frames per second
  images[0] = loadImage("ani-000.png");
  images[1] = loadImage("ani-001.jpg"); 
  images[2] = loadImage("ani-011.jpg");
  images[3] = loadImage("ani-000.png"); 
  images[4] = loadImage("ani-001.jpg");
  images[5] = loadImage("ani-011.jpg"); 
  images[6] = loadImage("ani-000.png");
  images[7] = loadImage("ani-001.jpg"); 
  images[8] = loadImage("ani-011.jpg");
  images[9] = loadImage("ani-000.png"); 
  images[10] = loadImage("ani-001.jpg");
  images[11] = loadImage("ani-011.jpg");
} 
void draw() { 
  frame++;
  if (frame == numFrames) { // If we've reached the 12th frame, start over
    frame = 0;
  }
  image(images[frame], 0, 0);
}
