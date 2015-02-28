
int numFrames=16;// number of frames
PImage[] images= new PImage [numFrames];// Make the array
int currentFrame=1;

void setup() {
  size(600,600);
  for(int i=1; i < images.length; i++) {
    String imageName= "Muybridge" + i + ".png";
    images[i] = loadImage(imageName); //Load each image
  }
  
  frameRate(24);
}
void draw() {
  background(37,255,5);
  scale(1.2);
  image (images[currentFrame], 0, 0);
  currentFrame++;//Next Frame
  if (currentFrame >= images.length) {
    currentFrame=1; //Return to first frame
  }
  }

