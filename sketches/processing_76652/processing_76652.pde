
int movieW = 0;
int movieH = 0;
int imageW = 0;
int imageH = 0;
int a = 1;
int ripple = 1;
int h = 1;
int tint1 = 255;
int tint2 = 100;
 PImage img;
import processing.video.*;
import processing.video.*;
Movie myMovie;

Capture cam;

void setup() {
img = loadImage("Mirror mirror3.jpg");  size(640, 480, P2D);
     background (255);
      myMovie = new Movie(this, "ripple video.mov");
  myMovie.loop();
     

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an element
    // from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}

void draw() {
   tint(tint1,tint2);
  image(myMovie, movieW, movieH);
    image(img, imageW, imageH);
   if (keyPressed) {
    if (key == ' '){
    h = 2;
    ripple = 2;
     imageW = 640;
   imageH = 480;
   tint1 = 255;
   tint2 = 100;
   movieW = 0;
   movieH = 0;
   }
   }
   
   if (a == 140){
   movieW = 640;
   movieH = 480;
  
   }
     if (keyPressed) {
    if (key == 'z'){
      h = 1;
      imageH = 0;
      imageW = 0;
      a = 1;
      ripple = 1;     
    }
     }
  if (h == 2){
  if (cam.available() == true) {
    cam.read();
  }
  }
 if (ripple == 2){
   a=a+1;
 }
  image(cam, 0, 0);  
  }
  
  void movieEvent(Movie m) {
    if (ripple == 2){
  m.read();
}
  }


  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);




