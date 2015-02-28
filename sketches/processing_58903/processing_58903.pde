
import processing.video.*; //imports library

Capture myCapture;

void setup(){
  size(640,480);

  // The name of the capture device is dependent on
  // the cameras that are currently attached to your 
  // computer. To get a list of the 
  // choices, uncomment the following line 
  // println(Capture.list());
  
  // To select the camera, replace "Camera Name" 
  // in the next line with one from Capture.list()
  // myCapture = new Capture(this, width, height, "Camera Name", 30);
  
  // This code will try to use the camera used
  myCapture = new Capture(this, width, height, 30);
  colorMode(HSB,360,100,100,100);
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}

void draw() {
  myCapture.loadPixels(); //ready to work with
  loadPixels();//added line
  for(int i = 0; i < width*height; i++){ //how many pixels
     color cp = myCapture.pixels[i]; //one at a time
     float b = brightness(cp);
     float h = hue(cp);
     float s = saturation(cp);
     if(h > 1){
       h = 200;
     }
     s += 30;
     h = 200;
     b = 700;
     pixels[i] = color(h,s,b);//straight to canvas
  }
  myCapture.updatePixels();
  updatePixels();
  //image(myCapture, 0, 0); //now an image // no longer needed
}

