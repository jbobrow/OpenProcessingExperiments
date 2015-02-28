
//import hypermedia.video.*;
//import java.awt.Rectangle;


//OpenCV opencv;

PImage [] face;

int x, y, x1, y1, z;


void setup() {

  size( 640, 480);

//  opencv = new OpenCV( this );
 // opencv.capture( width, height );                   // open video stream
 // opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"

  face = new PImage[127];
 



  for (int i = 0; i < face.length; i++) {
    face[i] = loadImage ("face" + i + ".jpg");
  }
}






public void stop() {
 // opencv.stop();
//  super.stop();
}



void draw() {

  // grab a new frame
  // and convert to gray
//  opencv.read();

  // proceed detection
 // Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );

  // display the image
  imageMode(CENTER);
  //image(face[64],320,240);

  // draw face area(s)
  noFill();
  stroke(255, 0, 0);
 // for ( int i=0; i<faces.length; i++ ) {
    //rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height ); 
    
    x = width / 40;
    y = height / 60;
 
    x1 = (width - mouseX) / 40;
    y1 = mouseY / 60;
    z = y1*x + x1;
    
   // println("faces[i].x =" + faces[i].x);
    // println("faces[i].y =" + faces[i].y);
    
    println ("x = " + x);
    println ("y = " + y);
    println ("x1 = " + x1);
    println ("y1 = " + y1);
    println ("z = " + z);
   imageMode(CENTER);
   image(face[z], 320, 240);
  }



