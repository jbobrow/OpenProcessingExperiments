
int numFrames = 3;
int frame = 0;
PImage []images = new PImage[numFrames];

void setup(){
  size(300,500);
  background(0);
  frameRate(1);
  imageMode(CENTER);
  //IMAGES
  images[0] = loadImage("Standing.png");
  images[1] = loadImage("TwoFace.png");
  images[2] = loadImage("Suitcase.png");
  
  
}

void draw(){
  frame++;
  if (frame == numFrames){
    frame = 0;
  }
  image(images[frame],width/2,height/2);
}

