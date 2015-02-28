
//comment from HERE
//import hypermedia.video.*;
//import java.awt.Rectangle;
//import java.awt.Point;

//OpenCV opencv;
// to HERE out for mouse only
float angle;
int z;

void setup() {

  size(840, 525 );
  background(0);
  frameRate(60);
  smooth();
  strokeJoin(MITER);
  strokeCap(SQUARE);

  //This is where it actively captures the video stream.  native resolution is 640, 480.  Has trouble detecting at edges
  // so i have expanded it by 50 pixels
  // COMMENT OUT FROM HERE TO 

  // opencv = new OpenCV( this );
 //  opencv.capture( 840 + 50 , 525 + 50);                   // open video stream
  // opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"
  // HERE for mouse only

  z = 0;
}

//public void stop() {  // activate if you are using webcam; comment this whole section out for mouse only
// opencv.stop();
//  super.stop();
//} 
void draw() {
  fill(0, 25);
  rect(0, 0, width, height);
  stroke(255, 40);


 //    opencv.read();
  //  opencv.convert( GRAY );  //conver images to gray for facial recognition


  // proceed detection
  //   Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );  
       // this is the part of code that see the face and finds the rectangular shape around the face that designates recogntion.


//  for ( int f=0; f<faces.length; f++ ) {  // only for webcam use

    for (float x=20; x< width; x+=15) {
      for (float y=20; y< height; y+=15) {
     //   angle = atan2((((faces[f].y)) + 75) - y, (((width-faces[f].x))) - x);  // follow webcam; comment out for mouse only
      //  float v = dist(width-faces[f].x, faces[f].y, x, y);    //follow webcam; comment out for mouse only
        angle = atan2(mouseY - y , mouseX - x);  //follow mouse; comment out for webcam only
        float v = dist(mouseX, mouseY, x, y);  //follow mouse; comment ouf for webcam only
        float border = noise(x,y);
        arrow(x, y, border);
        z++;
      }
    }
  }
// }  //comment out for mouseonly



  void arrow(float x_, float y_, float border) {
    pushMatrix();
    translate(x_, y_);
    rotate(angle);
    line(0, 0, 45, 0);
    translate(45, 0);
    rotate(PI + 0.4);
    line(0, 0, 5, 0);
    rotate(-0.8);
    line(0, 0, 5, 0);
    stroke(25 + x_/5, 25 + y_/5, (x_ + y_) / 10, 60);
    strokeWeight(.5);
    popMatrix();
  }


