
//Lets animate 

PImage bg;

int numFrames = 4;
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup() {
  size(800, 500);
  bg = loadImage("Background.jpg");
  frameRate(6);
  
  images[0] = loadImage("girl_1.png");
  images[1] = loadImage("girl_2.png");
  images[2] = loadImage("girl_3.png");
  images[3] = loadImage("girl_4.png");

}

void draw() {
  background(bg);
  frame = (frame+1) % numFrames;
  int offset = 0;
  for (int x = -100; x < width; x += images[0].width) { 
    image(images[(frame+offset) % numFrames], x, -1);
    offset+=2;
   

}
}


