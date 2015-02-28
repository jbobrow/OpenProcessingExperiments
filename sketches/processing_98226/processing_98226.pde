
int frame = 0;
int numFrames = 14;
PImage[ ] images = new PImage[numFrames];

void setup() {
  size(641, 453);
  frameRate(4);
  
  for(int i=1; i<14; i++){
    //create a string that will give us the file name 0.png
    String imageName = i+".png";
    //load images into an array
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



