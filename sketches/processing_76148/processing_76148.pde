
PImage hair;

import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;

// contrast/brightness values
int contrast_value    = 0;
int brightness_value  = 0;



void setup() {

    size( 320, 240 );
    smooth();
    
    hair = loadImage("hair.png");

    opencv = new OpenCV( this );
    opencv.capture( width, height );                   // open video stream
    opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"


    // print usage
    println( "Drag mouse on X-axis inside this sketch window to change contrast" );
    println( "Drag mouse on Y-axis inside this sketch window to change brightness" );

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
    opencv.contrast( contrast_value );
    opencv.brightness( brightness_value );

    // proceed detection
    Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );

    // display the image
    image( opencv.image(), 0, 0 );

    // draw face area(s)
    noFill();
    imageMode(CORNER);
    stroke(255,0,0);
    frameRate(100);
    for( int i=0; i<faces.length; i++ ) {
        //rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height ); 
        
        noStroke();
        fill(255,0,0);
        //ellipse(faces[i].x*1.5, faces[i].y*1.5, faces[i].width/3, faces[i].height/3);
        //imageMode(CENTER);
        image(hair, faces[i].x-15, faces[i].y-50, faces[i].width+30, faces[i].height+30);
    }
}



/**
 * Changes contrast/brigthness values
 */
void mouseDragged() {
    contrast_value   = (int) map( mouseX, 0, width, -128, 128 );
    brightness_value = (int) map( mouseY, 0, width, -128, 128 );
}



