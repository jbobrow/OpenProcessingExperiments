
int numFrames = 7;
int frame = 0;
int Image = 0;
PImage[] images = new PImage[numFrames];
  
void setup() {
  size(490, 375);
  frameRate(.5);
  
  images[1] = loadImage("UMadBro1.png");
  images[2] = loadImage("UMadBro2.png");
  images[3] = loadImage("UMadBro3.png");
  images[4] = loadImage("UMadBro4.png");
  images[5] = loadImage("UMadBro5.png");
  images[6] = loadImage("UMadBro6.png");

   
}
  
void draw() {
  frame = frame + 1;
  Image= Image + 1;
  image(images[frame], 0, 0);

  
  if (frame > 0) {
    frameRate(.5);
  }
  
  if (frame > 1) {
    frameRate(.5);
  
    if (frame > 2) {
      frameRate(.5);
    }
  
    if (frame > 3) {
      frameRate(.5);
    }
  
    if (frame > 4) {
      frameRate(.5);
    }
  
    if (frame > 5) {
      frameRate(.5);
    }
  
    if(frame > 6) {
      frameRate(.5);
    }
    }
  
}




