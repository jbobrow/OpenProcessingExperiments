
//I created 2 layers on the screen, 
//one is a normal camera shot, the other one is shake
//the problem is the shake layer was look like transparent not very clear...and I can't fix....sorry~

import processing.video.*;
  Capture video;
  PImage swipeImage;
  PImage BG;
  MovieMaker mm;
  
  int dstX;
  void setup() {
    size(800, 600);
    mm = new MovieMaker(this, width, height, "capture.mov", 30,
                       MovieMaker.H263, MovieMaker.HIGH);
    background(0);
    video = new Capture(this, width, height, 30);
    swipeImage = new PImage(width, height);
    BG = new PImage(width, height);
    dstX = width - 1;
  }
void draw() {
    image(swipeImage, 0, 0);
    tint(255,150);
    image(BG,0,0);
    stroke(191, 0, 0);
    line(dstX, 0, dstX, height);
    mm.addFrame();
  }
  void captureEvent(Capture c) {
    c.read();
    swipeImage.copy(c, 0, 0, dstX, height, 0, 0, dstX, height);
    BG.copy(c, 0, 0, width, height, 0, 0, width, height);

    if (dstX <= 0) dstX = width;
    
    dstX = dstX - 3;
  }
  
  
  
  void stop(){
  mm.finish();
  super.stop();
}

