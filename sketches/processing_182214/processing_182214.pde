
import processing.video.*;
float tintR=255;
float tintV=255;
float tintB=255;

Capture cam;

void setup() {
  size(640, 480);

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
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  tint(tintR, tintV ,tintB);
  image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
  
  
}

void mousePressed() {
 if(mouseX>320 && mouseY>240){
  tintR=random(255); 
  tintV=0;
  tintB=0;
 }
  
   if(mouseX<width/2 && mouseY<height/2){
  tintR=0;
  tintV=random(255); 
  tintB=0;
 }
 
 if(mouseX<width/2 && mouseY>height/2){
 tintR=0;
 tintV=0;
 tintB=random(255);
 
 if(mouseX>width/2 && mouseY<height/2){
  tintR=255;
  tintV=random(255);
  tintB=255;
 }
}
 
}

void keyPressed(){
 if(key=='s'){
  saveFrame("capture##.jpg");
 } 
}



