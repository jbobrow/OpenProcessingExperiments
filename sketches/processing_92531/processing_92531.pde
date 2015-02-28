
/**
 * Getting Started with Capture.
 * GSVideo version by Andres Colubri. -- modded by jenn kaye
 * Reading and displaying an image from an attached Capture device. 
 */

import codeanticode.gsvideo.*;

GSCapture Rcam;  // cam on my desk
GSCapture Lcam;  // cam in the teddy bear

void setup() {

  size(1280, 480);

  Rcam = new GSCapture(this, 640, 480, 30); //USB Video Class Video:0
  Rcam.start();
  
  Lcam = new GSCapture(this, 640, 480, 30);   // or camera name: HP Webcam HD-2200
  Lcam.start();
}

void draw() {

  if (Rcam.available() == true) {
    Rcam.read();
    image(Rcam, 640, 0);
    println("desk");
  }
  else {
    println("no desk");
  }

  if (Lcam.available() == true) {
    Lcam.read();
    image(Lcam, 0, 0);
    println("bear");
  }
  else {
    println("no bear");
  }

//  if (keyPressed == true) {
//    Rcam.stop();
//    Lcam.stop();
//  }
}




