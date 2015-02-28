
// contains elements from a freely available sketch found at 
//http://www.miguelespada.es/?p=487 posted nov 13 2011 copyright MIGUEL V. ESPADA

import javax.media.opengl.*;
import processing.opengl.*;
import jsyphon.*; // Syphon

import hypermedia.video.*;
import java.awt.Rectangle;

// contrast/brightness values
int contrast_value    = 0;
int brightness_value  = 0;

OpenCV opencv;

int[] texID;

void setup() {
  size(640, 480, OPENGL);
  opencv = new OpenCV( this );
    opencv.capture( width, height );                   // open video stream
    opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"


  pgl = (PGraphicsOpenGL) g;
  gl = pgl.gl;
  initSyphon(gl,"processing");
}

void draw() 
{
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
    stroke(255,0,0);
    for( int i=0; i<faces.length; i++ ) {
        rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height ); 
    }
    
  renderTexture(pgl.gl);
  println("frameRate: " + frameRate);
}

public void stop() {
  dispose();
  opencv.stop();
    super.stop();
}


