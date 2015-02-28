
int frame = 0;
int numFrames = 8;
PImage[ ] images = new PImage[numFrames];

void setup() {
  size(500, 300);
  frameRate(1); // Maximum 30 frames per second 
  
  for(int i=0;i<8;i++){
    //created a string that will give us the file name 0.gif
    String imageName = i+".jpg";
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



