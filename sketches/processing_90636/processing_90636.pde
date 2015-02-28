
int numFrames = 7; 
PImage[] images = new PImage[numFrames]; 

void setup() {
  size(200, 200);
  frameRate(10);
  for (int i = 0; i < images.length; i++) {
    String imageName = i + ".jpg";
    images[i] = loadImage(imageName);
  }
}

void draw() {
  int frame = frameCount % numFrames;
  image(images[frame], 0, 0);
}


