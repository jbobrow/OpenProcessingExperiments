
import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;
PImage hige;

void setup(){
  size(300,200);
  
  opencv = new OpenCV(this);
  opencv.capture(width,height);
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );
  hige = loadImage("hige.png");
  
}

void draw(){
  opencv.read();
  
  Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
  image(opencv.image(),0,0);
  noFill();
    stroke(255,0,0);
    for( int i=0; i<faces.length; i++ ) {
        //rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height );
        image(hige, faces[i].x, faces[i].y-faces[i].height/2, faces[i].width, faces[i].height*1.5);
        
    }
}


