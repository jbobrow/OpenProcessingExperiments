
import hypermedia.video.*;
import java.awt.Rectangle;
import processing.video.*;

OpenCV opencv;

// contrast/brightness values
int contrast_value    = 0;
int brightness_value  = 0;
float radius; // Radius of rays
float angle = 360 / 10; // Location of rays

MovieMaker myMovie;

void setup() {

  size( 400, 400 );
  frameRate(25);
  opencv = new OpenCV( this );
  opencv.capture( width, height );                   // open video stream
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"
  myMovie = new MovieMaker(this, width, height, "capture.mov", 25, MovieMaker.H263, MovieMaker.BEST);

}




void draw() {
  myMovie.addFrame();
  // grab a new frame
  // and convert to gray
  opencv.read();
  opencv.convert( GRAY );
  opencv.contrast( contrast_value );
  opencv.brightness( brightness_value );
  
  // proceed detection
  Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );

  // display the image
  image( opencv.image(), 0, 0 );

  // draw face area(s)
  noFill();
  stroke(255, 0, 0);
  for ( int i=0; i<faces.length; i++ ) {

    for (int j=0;j<80;j++) {
      radius = 2*faces[i].x; // Update rays' radius
      int tempEyeRX = faces[i].x+faces[i].width/3;
      int tempEyeRY = faces[i].y+faces[i].width/2;
      int tempEyeLX = faces[i].x+faces[i].width-faces[i].width/3;
      line(tempEyeRX, tempEyeRY, radius * sin(angle * j) + tempEyeRX, radius * cos (angle * j) + tempEyeRY); // Update rays' location
      line(tempEyeLX, tempEyeRY, radius * sin(angle * j) + tempEyeLX, radius * cos (angle * j) + tempEyeRY); // Update rays' location
      stroke(255, 0, 0); // Rainbow colour
      strokeWeight(1); // Thickness of ray strand


      //
    }

    // brightness_value = -faces[i].width/2;
    println(brightness_value);
    //contrast_value   = (int) map( faces[i].width, 0, 200, -128, 128 );
  }
}



/**
 * Changes contrast/brigthness values
 */
void mouseDragged() {
  contrast_value   = (int) map( mouseX, 0, width, -128, 128 );
  brightness_value = (int) map( mouseY, 0, width, -128, 128 );
}

void keyPressed() {
  if (key == ' ') {   // If we press spacebar...
    myMovie.finish(); // Stop recording
} }
void stop() {
  myMovie.finish();
  super.stop();
}


