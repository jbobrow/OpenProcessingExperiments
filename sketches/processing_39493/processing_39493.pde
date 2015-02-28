
import processing.video.*;
Capture myCapture;

void setup(){
  size(800, 600);
  myCapture = new Capture(this, width, height, 30);
  
}
void captureEvent(Capture myCapture){
  myCapture.read();
}
color pix;
int ssize = 20;
void draw(){

  for(int x=0; x<width; x+=ssize){
    for(int y=0; y<height; y+=ssize){
      pix = myCapture.get(x,y);
      fill(pix, 255);
      noStroke();
      smooth();
      ellipseMode(CORNER);
      ellipse(x, y, ssize,ssize);
    }
  }
}               
