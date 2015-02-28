
int numFrames = 7; 
PImage[] images = new PImage[numFrames]; 

void setup() {
  size(200, 200);
  for (int i = 0; i < images.length; i++) {
    String imageName = i + ".jpg";
    images[i] = loadImage(imageName);
  }
}

void draw() {
  int frame = int(random(0, numFrames)); 
  image(images[frame], 0, 0);
  frameRate(random(1, 40.0));
  image(images[frame], 0, 0);
}


