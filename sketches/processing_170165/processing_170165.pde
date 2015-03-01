
int numFrames = 10; 
int frame = 0; 
PImage[] images = new PImage[numFrames]; 
void setup() {
  size(800, 600);
  background(255,0,0);
  frameRate(10); 

  images[0] = loadImage("walk10.png"); 
  images[1] = loadImage("walk09.png"); 
  images[2] = loadImage("walk08.png"); 
  images[3] = loadImage("walk07.png"); 
  images[4] = loadImage("walk06.png"); 
  images[5] = loadImage("walk05.png"); 
  images[6] = loadImage("walk04.png"); 
  images[7] = loadImage("walk03.png"); 
  images[8] = loadImage("walk02.png"); 
  images[9] = loadImage("walk01.png");

}
void draw() { 
  frame++;
  if (frame == numFrames) {
    frame = 0;
  }
  image(images[frame], 150,150);
}



