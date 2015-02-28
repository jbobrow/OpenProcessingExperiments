
import processing.video.*;      // import external library
Capture myCapture;              // variable to hold incoming data

void setup() 
{
  size(640, 480);

  frameRate(15);

  myCapture = new Capture(this, width, height, 50); // set width, height and frame rate here
}

  // this draws the video image to the screen. Note that is it treated like an image.
void draw() {
  //tint(mouseX,mouseY,255);
  
  myCapture.loadPixels();  
    tint(255,255,255,10);
  image(myCapture, 0, 0);

}

void captureEvent(Capture myCapture) {
  myCapture.read();
}


void mousePressed() {
 tint(255,255,255,100);
 image(myCapture, 0, 0);

  
}

