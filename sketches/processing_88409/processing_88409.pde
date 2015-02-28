
int numFrames = 11;
int frame = 0;
int Image = 0;
PImage[] images = new PImage[numFrames];
 
void setup() {
  size(700, 525);
  frameRate(1);
 
  images[1] = loadImage("Image1.JPG");
  images[2] = loadImage("Image2.JPG");
  images[3] = loadImage("Image3.JPG");
  images[4] = loadImage("Image4.JPG");
  images[5] = loadImage("Image5.JPG");
  images[6] = loadImage("Image6.JPG");
  images[7] = loadImage("Image7.JPG");
  images[8] = loadImage("Image8.JPG");
  images[9] = loadImage("Image9.jpg");
  images[10] = loadImage("Image10.jpg");
  
}
 
void draw() {
  frame = frame + 1;
  Image= Image + 1;
  image(images[frame], 0, 0);
;
 
  if (frame > 0) {
    frameRate(.7);
  }
 
  if (frame > 1) {
    frameRate(.7);
 
    if (frame > 2) {
      frameRate(1);
    }
 
    if (frame > 3) {
      frameRate(.7);
    }
 
    if (frame > 4) {
      frameRate(.7);
    }
 
    if (frame > 5) {
      frameRate(1);
    }
 
    if(frame > 6) {
      frameRate(.7);
    }
     
    if (frame > 7) {
      frameRate(0.5);
    }
 
    if (frame > 8) {
      frameRate(1);
    } 
 
    if (frame > 9) {
      frameRate(1);
    
    if (frame > 10) {
      frameRate(1);
    }
    }
  }
}



