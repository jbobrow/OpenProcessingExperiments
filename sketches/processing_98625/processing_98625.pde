
int numFrames = 75;
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup() {
  size(640, 480);
  frameRate(24);
  for (int i = 0; i < numFrames; i++) {
  String imageName = "catch" + nf(i, 4) + ".jpg";
  images[i] = loadImage(imageName);
  }
}

void draw() { 
  background(0);
  frame = (frame+1) % numFrames;
  image(images[(frame) % numFrames], 0, 0);
}


