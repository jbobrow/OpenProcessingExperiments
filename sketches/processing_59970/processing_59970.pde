
import processing.video.*;
Capture myCapture;
Movie myMovie;
PImage C1;

void setup() 
{
  size(1000, 1000, P2D);
  myCapture = new Capture(this, width, height, 30);
  myMovie = new Movie(this, "CONAN.mov");
  myMovie.loop();
  C1 = loadImage("coco.jpeg");
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}

void draw() {
  image(myCapture, 0, 0);
  tint(33,22,mouseX);
  filter(INVERT);
  filter(BLUR);
}
{
  if (keyPressed == true) {
    image(C1,500,500);
  }
}
    

void mouseClicked() {
  tint(mouseX,mouseY,0);
  image(myMovie,0,0);
}

void mouseReleased() {
  tint(50, mouseY,mouseX);
  image(myCapture,0,0);
}


