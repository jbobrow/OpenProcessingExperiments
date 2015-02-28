
import processing.video.*;
import hypermedia.video.*;

MovieMaker myMovie;
OpenCV opencv;
int srcX, dstX, srcY, dstY;

void setup() {
  size (340, 180); // Small 16*9 video
  println("press spacebar to stop the recording");
  //Variable = new MovieMaker(this, cameraWidth, cameraHeight, "Filename.mov", frameRate, Codec, Quality);
  myMovie = new MovieMaker(this, width, height, "capture.mov", 25, MovieMaker.H263, MovieMaker.BEST);

  opencv = new OpenCV(this);
  opencv.capture(320, 240);
  
  srcY = opencv.height /2;
  dstY = 0;
}

void draw() {
  // Draw Something Here
  myMovie.addFrame(); // Adds what we just drew to the video file

  opencv.read();
  opencv.absDiff();

  // project the center line and scan from top to bottom.
  copy(opencv.image(), 0, srcY, opencv.width, 1, 0, dstY, width, 1);
  if (++dstY > height) dstY = 0;
}

void keyPressed() {
  if (key == ' ') { // If we press spacebar...
    myMovie.finish(); // Stop recording
  }
}

void stop() {
  myMovie.finish(); // This finishes off the file properly...
  super.stop();
}


