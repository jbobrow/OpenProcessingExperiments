
import processing.video.*; //imports library

Capture myCapture;

void setup(){
  size(640,480);

  myCapture = new Capture(this, width, height, 30);
  colorMode(HSB,360,100,100,100);
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}

void draw() {
  myCapture.loadPixels(); //ready to work with
  loadPixels();//added line
  float brightestValue = 0;
  int brightestIndex = 0;
  for(int i = 0; i < width*height; i++){ //how many pixels
     color cp = myCapture.pixels[i]; //one at a time
     float h = hue(cp);
     float s = saturation(cp);
     float b = brightness(cp);
     if(b > brightestValue){
        brightestValue = b;
        brightestIndex = i;
     }
    pixels[i] = color(h,s,b,3);//method by madison
  }
  myCapture.updatePixels();
  updatePixels();
  int x = brightestIndex%width;
  int y = brightestIndex/width;
 
  image(myCapture, 0, 0); //now an image // no longer needed
  ellipse(x,y,10,10);
}

