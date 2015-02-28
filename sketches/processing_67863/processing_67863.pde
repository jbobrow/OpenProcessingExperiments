
import processing.video.*;
import hypermedia.video.*;
import java.awt.Rectangle;
OpenCV opencv;
MovieMaker myMovie;
float x1 = 0.0;

void setup() {
  size (320, 240); // Small 16*9 video
  println("press spacebar to stop the recording");
  opencv = new OpenCV(this);
  opencv.capture(width, height);
  opencv.cascade(OpenCV.CASCADE_FRONTALFACE_ALT);

  myMovie = new MovieMaker(this, width, height, "Boey2.mov", 25, MovieMaker.H263, 
  MovieMaker.BEST);
  background(204);
}

void draw() {
  opencv.read();
  image(opencv.image(), 0, 0);
  noFill();
  stroke(255, 0, 0);
  Rectangle[] faces = opencv.detect();
  for (int i = 0; i < faces.length; i++) {

    PImage img;

    img = loadImage("glasses.png");
    image(img, faces[i].x+8, faces[i].y-16);
  }


  for (int y = 160; y<= 320; y+=40) {
    PImage c = get(y-120, y-80, 40, 40);
    image (c, x1, 0);
    image (c, x1, 200);
    x1 = x1+40;
    if (x1 > 320) {
      x1=0.0;
    }
  }// Draw Something Here
  myMovie.addFrame(); // Adds what we just drew to the video file
}
void keyPressed() {

  if (key == ' ') {   // If we press spacebar...
    myMovie.finish(); // Stop recording
  }
}
void stop() {
  myMovie.finish();
  super.stop();
}


