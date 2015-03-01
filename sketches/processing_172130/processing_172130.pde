
// Face It
// ITP Fall 2013
// Daniel Shiffman

// Now we need the video library
import processing.video.*;

// Import the library
import gab.opencv.*;

// We need Java rectangles
import java.awt.Rectangle; // storing the corners of the face detection

// Library object
OpenCV opencv;

// Capture object
Capture cam;

// Array of faces found
Rectangle[] faces; //Array of rectangle objects where we store our already detected faces

//strokeWeightVariable
float transparency = 10; // my transparency going from 0 - 255 ->will control tint of star image
PImage star; 

void setup() {
  size(640, 480, P2D);
  star = loadImage("augenring4.png");
  // Start capturing
  cam = new Capture(this, 640, 480); // captures evrzthingv between the frame size of 640 x 480
  cam.start();

  // Create the OpenCV object
  opencv = new OpenCV(this, cam.width, cam.height);

  // Which "cascade" are we going to use?
  //opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  opencv.loadCascade(OpenCV.CASCADE_EYE);  
  //opencv.loadCascade(OpenCV.CASCADE_NOSE);
}

// New images from camera
void captureEvent(Capture cam) { // keep reading images from camera
  cam.read();
}

void draw() {

  background(0);

  // We have to always "load" the camera image into OpenCV 
  opencv.loadImage(cam);

  // Detect the faces
  faces = opencv.detect(); //faces array of actually rectangles

  // Draw the video
  //image(cam, 0, 0);
  set(0, 0, cam);
  //load the pixels into an array
  cam.loadPixels();
  
  loadPixels();
  // If we find faces, draw them!
  if (faces != null) { // if the faces array isn't empty, loop through the faces rectangle array
    for (int i = 0; i < faces.length; i++) { //here we loop through
//      strokeWeight(2);
//      stroke(255, 0, 0);
//      noFill();
//      ellipseMode(CORNER);
      //strokeWeight(sw);
      //ellipse(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
      tint(100, 20, 100, transparency); //everytime we have a rectangle we take our star image, tint it based on transparancy variable
      image(star,faces[i].x, faces[i].y, faces[i].width, faces[i].height); // and draw it in the size of our face detection rectangle!
      // fill(255);
      // ellipse(faces[i].x, faces[i].y, 5, 5);
      
     // for (int x=faces[i].x; x< faces[i].x + faces[i].width; x++) {
     //   for (int y=faces[i].y; y< faces[i].y+ faces[i].height; y++) {
     //     int thisPixel= (x+y*width);
     //     color colorFromCam = cam.pixels[thisPixel];
     //     float r= red(colorFromCam);
     //     float g= green(colorFromCam);
     //     float b= blue(colorFromCam);
          
     //     r = r-10;
     //     g = g-10;
     //     b = b+10;
         
     //     color newColor= color(r,g,b);
     //     pixels[thisPixel]= newColor;
     //   }
     // }
    }// 
  }
  updatePixels();
}

void keyPressed() {
  if(key == 'a'){
  transparency = transparency+10; // press 'a' more darker
  }
  if(key == 'b'){
    transparency = transparency-10; // press 'b' lighter
  }
  //transparency+=10;

}


