
import hypermedia.video.*;

import java.awt.Rectangle;

OpenCV opencv;

// contrast/brightness values

int cellSize = 320;


void setup() {

  size( 640, 640 );

  opencv = new OpenCV( this );
  opencv.capture( width, height );                   // open video stream
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"
}


public void stop() {
  opencv.stop();
  super.stop();
}



void draw() {

  // grab a new frame
  // and convert to gray
  opencv.read();
  opencv.convert( GRAY );



  // proceed detection
  Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );

  // display the image
 // image( opencv.image(), 0, 0 );

  // draw face area(s)
  noFill();
  noStroke();
  for ( int i=0; i<faces.length; i++ ) {
    rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height );

    for (int y=0; y <= width; y+=cellSize) {
      for (int x=0; x <= height; x+=cellSize) {
        if ((faces[i].width >= 1) && (faces[i].width < 25)) {
          cellSize = 20;
        }
        if ((faces[i].width >= 25) && (faces[i].width < 50)) {
          cellSize = 40;
        }
        if ((faces[i].width >= 50) && (faces[i].width < 75)) {
          cellSize = 80;
        }
        if ((faces[i].width >= 75) && (faces[i].width < 100 )) {
          cellSize = 160;
        }

        color myColor = opencv.image().get(x, y);        // gets the color from the video feed at (x,y)
        fill(myColor);                         // set fill to use this new color
        rect(x, y, cellSize, cellSize);
        noStroke();
      }
   //   println(faces[i].width);
     // println(faces[i].height);
    }
  }
}




/**
 * Changes contrast/brigthness values
 */
//void mouseDragged() {
//contrast_value   = (int) map( mouseX, 0, width, -128, 128 );
//brightness_value = (int) map( mouseY, 0, width, -128, 128 );


