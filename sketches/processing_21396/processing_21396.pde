
import hypermedia.video.*;
import java.awt.Rectangle;

int facecount = 0;
OpenCV opencv;

void setup() {

    size( 640, 480 );

    opencv = new OpenCV(this);
    opencv.capture( width, height );
    opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );    // load the FRONTALFACE description file
}

void draw() {
    
    opencv.read();
    image( opencv.image(), 0, 0 );
    
    // detect anything ressembling a FRONTALFACE
    Rectangle[] faces = opencv.detect();
        facecount = faces.length;
    
    // draw detected face area(s)
    noFill();
    stroke(201,101,171);
    for( int i=0; i<faces.length; i++ ) {
        rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height ); 
    }
    if(facecount>0)  {PImage b;
b = loadImage("image_2.jpg");
image(b, 0, 0);
}
else {PImage a;
a = loadImage("image_1.jpg");
image(a, 0, 0);
}
}

