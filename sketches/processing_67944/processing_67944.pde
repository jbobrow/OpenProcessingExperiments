
import processing.video.*;
import hypermedia.video.*;
import java.awt.Rectangle;
OpenCV opencv;
MovieMaker myMovie;

void setup() {
  size (340, 180); // Small 16*9 video
  println("press spacebar to stop the recording");
  myMovie = new MovieMaker(this, width, height, "capture.mov", 25, MovieMaker.H263, MovieMaker.BEST);
  opencv = new OpenCV(this);
  opencv.capture(width, height);
  opencv.cascade(OpenCV.CASCADE_FRONTALFACE_ALT);
}

void draw() {
  // Draw Something Here
  opencv.read();
  image(opencv.image(), 0, 0);
  Rectangle[] eye = opencv.detect();
  for (int i = 0; i < eye.length; i++) {
    smooth();
    fill(255);
    ellipse(eye[i].x, eye[i].y+10, eye[i].width, eye[i].height);
    ellipse(eye[i].x+90, eye[i].y+10, eye[i].width, eye[i].height);
  }

  Rectangle[] ball = opencv.detect();
  for (int i = 0; i < ball.length; i++) {
    smooth();
    fill(0);
    ellipse(ball[i].x+30, ball[i].y, 20, 20);
    ellipse(ball[i].x+110, ball[i].y, 20, 20);
  }
  myMovie.addFrame();
}

void keyPressed() {
  if (key == ' ') {   // If we press spacebar...
    myMovie.finish(); // Stop recording
    println("recording stopped");
  }
}

void stop() {
  myMovie.finish(); // This finishes off the file properly...
  super.stop();
}
