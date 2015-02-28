
import processing.video.*;


Capture video;

void setup() {
  size(500, 350); 
  frameRate(200);
 video = new Capture (this, 320,240,15);
  PImage still1 = loadImage ("ColPom1.jpeg"); 
  PImage still2 = loadImage ("ColPom2.jpeg"); 
  PImage still3 = loadImage ("ColPom3.jpeg");

 loadPixels();
  still1.loadPixels(); 
  still3.loadPixels();
  for (int y=0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*still2.width;
}
  }
}
  
void draw() { 
    PImage still1 = loadImage ("ColPom1.jpeg"); 
  PImage still2 = loadImage ("ColPom2.jpeg"); 
  PImage still3 = loadImage ("ColPom3.jpeg");


  //load pixels
 
    
//if (x % 2 == 0) { 
  //pixels[loc] = image(still1,0,0, width, height);

//}else {
  // pixels[loc] = image(still2,0,0, width, height);

  
 image (still3, 0, 0, width, height);
 /*if(millis()-timer <5000) && (clickedFlag==true)) {
    //tint(255, 100);
   //image(still1,0,0, width, height);}
  */
 if (mouseX < width/2 && mouseY < height/2) {
 tint(255, 100);
 image(still1,0,0, width, height);
 
 //for (int i = 0; i < 100; i++) {
   //}
 }
  if (mouseX > width/2 && mouseY < height/2) {
 tint(255, 100);
 image(still2,0,0, width, height);
 
 //for (int i = 0; i < 100; i++) {
   //}

  //video capture
  if (video.available ()) {
     tint(mouseX, mouseY, 255);
  image(video,width/2, height/2, 75,50);
    video.read();
  }
 }
    }
 


