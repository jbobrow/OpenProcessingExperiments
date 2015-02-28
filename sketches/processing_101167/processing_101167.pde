
import hypermedia.video.*;
import java.awt.Rectangle;
import java.awt.Point;


OpenCV opencv;

// contrast/brightness values
int contrast_value    = 10;
int brightness_value  = 10;



void setup() {

    size( 800, 600 );

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
    //opencv.convert( GRAY );
    opencv.contrast( contrast_value );
    opencv.brightness( brightness_value );

    // proceed detection
    Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 50, 50 );
   

    // display the image
    image( opencv.image(), 0, 0 );

    // draw face area(s)
    //noFill();
    fill(#ffff00, 125);
    stroke(0);
    //ellipseMode(CORNER);
    for( int i=0; i<faces.length; i++ ) {
      
        translate(faces[i].width/2, faces[i].height/2);  
        fill(#ffff00, 125);
        stroke(0, 200);  
        ellipse( faces[i].x, faces[i].y, faces[i].width*1.3, faces[i].height*1.3);
        
        translate(0, faces[i].height/12);
        noFill();
        strokeWeight(5);
        arc(faces[i].x, faces[i].y, faces[i].width*.8, faces[i].height*.8, 0, PI);
        
        translate(faces[i].width/-5, faces[i].height*-.25);
        fill(0, 200);
        ellipse( faces[i].x, faces[i].y, faces[i].width*.15, faces[i].height*.25);
        
        translate(faces[i].width/2.5, 0);
        fill(0, 200);
        ellipse( faces[i].x, faces[i].y, faces[i].width*.15, faces[i].height*.25);
    }
}



/**
 * Changes contrast/brigthness values
 */
void mouseDragged() {
    contrast_value   = (int) map( mouseX, 0, width, -128, 128 );
    brightness_value = (int) map( mouseY, 0, width, -128, 128 );
}




