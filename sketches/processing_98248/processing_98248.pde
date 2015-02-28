
int frame = 0;
int numFrames = 28;
PImage[ ] images = new PImage[numFrames];
 
void setup() {
  size(99, 99);
  frameRate(6);
   
  for(int i=0; i<28; i++){
    //create a string including file
    String imageName = i+".jpeg";
    //load image files into an array
    images[i] = loadImage(imageName);
  } 
}
 
void draw() {
  frame++;
  if (frame == numFrames) {
    frame = 0;
  }
  image(images[frame], 0, 0);
}


