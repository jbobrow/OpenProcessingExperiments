
// DUBSTEP HOOFD!
import processing.video.*;

Capture cam;

PImage img = createImage(640 , 480, RGB);

PFont font;
int pixel = 0;
int line = 0;

void setup(){
  frameRate(30);
  size(640 , 480);
  background(#FFFFFF);
  font = loadFont("Arial.vlw"); 
  textFont(font, 12); 
  
  
  
  //////
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
    cam = new Capture(this, 640 , 480, 30);
    cam.start();     
  }
}


void draw(){
  background(#FFFFFF);
  
  /////
  if (cam.available() == true) {
    cam.read();
  }
  
  
  cam.loadPixels();
  img.loadPixels();
 if (line < cam.height) {
   
   
   for (int i = 0; i < img.width; i++){
    img.pixels[line*width+i] = cam.pixels[line*width+i];
   }
   line++;
}
  cam.updatePixels();
  img.updatePixels();
  
  image(img, 0, 0);
  //cam.stop();
}

void mouseReleased() {
  cam.stop();
  cam.start();
  //img = createImage(640 , 480, RGB);
  line = 0 ;
  
}
