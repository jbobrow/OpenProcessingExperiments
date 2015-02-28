
import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;

void setup() {
    colorMode(RGB, 1.0); //it's just nicer this way... you know...
    size( 700, 1100 ); 
    //Canvas size is important for pattern recorgnition. 
    // Even if the image is low-res, a larger stage will use the natural interpolation, 
    // and recorganize more details in the image.
    
    //Note, image can be interpolated by processing, or photoshop, it's the same (it happens before HAAR detect)
    //NOTE: image ratio has to be respected. (if not fewer faces are detected, and more faux-positif).
    opencv = new OpenCV( this );
    loadAnImage(); 
    noLoop();
}



//MOUSE PRESS
void mousePressed() {
   loadAnImage();
}

// FUNCTION LOAD IMAGE.
void loadAnImage(){
     println("new image loaded...");
     int rndImg = floor(random(1,16));
     String imgPath = rndImg+".jpg";
     opencv.loadImage( rndImg+".jpg"  );
     opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"
     redraw();
}

public void stop() {
    opencv.stop();
    super.stop();
}





void draw() {
    background(1);
    // proceed detection
    Rectangle[] faces = opencv.detect( );//Default params are better for detailled detection. - it IS true!

    // display the image
    image( opencv.image(), 0, 0 );

    // draw face area(s)
    noFill();
    stroke(0,1,0);
    println("new image loaded: "+ faces.length + " face(s) found!");
      for( int i=0; i<faces.length; i++ ) {
          rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height ); 
      }
}







