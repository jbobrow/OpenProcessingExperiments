
import processing.video.*;
MovieMaker myMovie;
Capture video;
PImage swipeImage;
PFont fontA;
int dstX;


void setup() {
  size(350, 240);
  println("press spacebar to stop the recording");
  video = new Capture(this, width, height, 30);
  swipeImage = new PImage(width, height);
  dstX = width - 1;
  fontA = loadFont("STXihei-24.vlw");
  textFont(fontA, 24);
  smooth();
  myMovie = new MovieMaker(this, width, height, "capture.mov", 25, MovieMaker.H263, MovieMaker.BEST);
}


void draw() {
  background(0); 
  image(swipeImage, 0, 0);
  stroke(15);
  line(dstX, 0, dstX, height);
  fill(255);
  text("I am", 60, 60);
  text("rich in", 150, 100);
  text("Vitamin C", 120, 165);
  int x = frameCount % 250;
  set(x, 0, swipeImage);
//swipeImage.filter( DILATE);
  swipeImage.filter( ERODE);
  
  
 /*using array to tint images and get colour*/
  int[]a ={25,75,125,175,225};
  int[]b={0,70,140,210,280}; 
  noStroke();
  for(int i=0;i< a.length;i++){
  color c= get(a[i],120);
  fill(c,50);
  rect(b[i],0,70,240);
  }
 

  
  myMovie.addFrame(); 
}

void captureEvent(Capture c) {
  c.read();
  swipeImage.copy(c, 0, 0, dstX, height, 0, 0, dstX, height);
  if (--dstX <= 0) dstX = width;
}

void keyPressed() {
  if (key == ' ') {
    myMovie.finish();
  }
}

void stop() {
  myMovie.finish();
  super.stop();
}

