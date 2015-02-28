
import processing.video.*;
Capture video;
PImage swipeImage1 ;
PImage swipeImage2 ; 
PImage swipeImage3 ; 
PImage swipeImage4 ;
PImage swipeImagebg ;
int[] dst= new int[4];

MovieMaker mm;

void setup() {

size(640, 480); 
background(0);
video = new Capture(this, width, height, 30); 
swipeImage1 = new PImage(width, height);
swipeImage2 = new PImage(width, height);
swipeImage3 = new PImage(width, height);
swipeImage4 = new PImage(width, height);
swipeImagebg = new PImage(width, height);


for(int i = 0; i < 4; i++){
dst[i] = height - i*120;
}


mm = new MovieMaker(this, width, height, "capture.mov", 30, MovieMaker.H263, MovieMaker.HIGH);

//video.start();
}
void draw() {

  float al1 = map(dst[0],0,640,100,255);
  tint(255,150);
  image(swipeImage1, 0, 0); 
  float al2 = map(dst[1],0,640,100,255);
  tint(0,al2,0,50);
  image(swipeImage2, 0, 0);
  float al3 = map(dst[2],0,640,100,255);
  tint(0,0,al3,50);
  image(swipeImage3, 0, 0);
  float al4 = map(dst[3],0,640,100,255);
  tint(al4,0,0,50); 
  image(swipeImage4, 0, 0);

  stroke(191, 0, 0);

  mm.addFrame();
  
}
  void captureEvent(Capture c) {
    c.read(); 
    swipeImage1.copy(c, 0, 0, width, dst[0], 0, 0, width, dst[0]);
    if (--dst[0] <= 0) dst[0] = height;
    swipeImage2.copy(c, 0, 0, width, dst[1], 0, 0, width, dst[1]);
    if (--dst[1] <= 0) dst[1] = height;
     swipeImage3.copy(c, 0, 0, width, dst[2], 0, 0, width, dst[2]);
    if (--dst[2] <= 0) dst[2] = height;
     swipeImage4.copy(c, 0, 0, width, dst[3], 0, 0, width, dst[3]);
    if (--dst[3] <= 0) dst[3] = height;
    
    swipeImagebg.copy(c, 0, 0, width, height, 0, 0, width, height);
  }
  
  void stop() {
    mm.finish();
super.stop();
}
