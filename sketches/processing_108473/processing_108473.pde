
import processing.video.*;

Capture cam;

int WIDTH = 640;
int HEIGHT = 360;

int STRIPE_HEIGHT = 10;

int theta = 90;
boolean thetaUp = true;

void setup() {
  size(WIDTH, HEIGHT);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, WIDTH, HEIGHT);
    cam.start();     
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
  
  loadPixels();
  int oldPixels[] = new int[pixels.length];
  arrayCopy(pixels, oldPixels);
  
  for (int i = 0; i < width; i++) {
      int virtualWidth = getVirtualIndex(i, theta);  
      for (int j = 0; j < height; j++) {
        pixels[j*width + i] = oldPixels[max(0, min(width*j + virtualWidth, 230399))];
      }
  }
  updateTheta();
  theta++;
  
  updatePixels();
}

void updateTheta() {
  if (thetaUp) {
    theta++;
   if (theta == 180) {
    thetaUp = false;  
   }
  } else {
   theta--;
   if (theta == 0) {
     thetaUp = true; 
   }
  } 
}

int getVirtualIndex(int column, int theta) {
  float virtualMaxIndex = 320*cos(theta/90.0);
  int virtualIndex = (int)map(column, 0, width/2, 0, virtualMaxIndex);
  return (width/2) + virtualIndex;
}
