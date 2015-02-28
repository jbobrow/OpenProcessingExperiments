
int frame = 0;
int numFrames = 5;
PImage[ ] images = new PImage[numFrames];
PImage img;


void setup() {
size(400,283);
frameRate(10);
images[0] = loadImage("sad1.jpg");
images[1] = loadImage("sad2.jpg");
images[2] = loadImage("sad3.jpg");
images[3] = loadImage("sad4.jpg");
images[4] = loadImage("sad5.jpg");
}

void draw(){
  background(0);
  frame = frame + 1;
  if (frame>=numFrames) {
    frame=0;
}
image(images[frame], 0, 0);
}


