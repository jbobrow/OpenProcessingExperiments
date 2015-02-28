

import processing.video.*;
import hypermedia.video.*;


MovieMaker myMovies;
OpenCV opencv;

int dstY;

void setup() {

  size(640,480);
  opencv = new OpenCV(this);
  opencv.capture(640,480);
  dstY = width - 1;
  myMovies = new MovieMaker(this, width, height, "capture.mov", 30, MovieMaker.H263, MovieMaker.HIGH);
}

void draw() {
  opencv.read();
  opencv.absDiff();
  if (dstY < height/2) opencv.invert();
  copy(opencv.image(), 0, 0,  opencv.width, dstY, 0, 0, opencv.width, dstY);
  if (--dstY < 0) dstY = height - 1;
  myMovies.addFrame();
}

void exit()
{

  myMovies.finish();

  super.exit(); 
}

