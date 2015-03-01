
//INSTALL openCV library from Sketch > Import Library > Add Library > Type 'opencv' in the search bar

//BELOW WE IMPORT LIBRARIES
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

//WE CREATE TWO OBJECTS video OF TYPE Capture AND myopencv OF TYPE OPENCV
Capture video;
OpenCV myopencv;
PImage img1;
PImage img2;
PImage img3;
PImage img4;

void setup() {
  //SETTING UP REGULAR STUFF
  size(640, 480);
  //TELLING video AND myopencv ITS SIZE
  video = new Capture(this, 640/2, 480/2);
  myopencv = new OpenCV(this, 640/2, 480/2);
  //TELLING myopencv TO LOAD FRONT CAMERA (WEBCAM) SO IT CAN START DETECTING
  myopencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  //START THE CAMERA
  video.start();
  img1 = loadImage("earth-blue.png");
  img2 = loadImage("earth-yellow.png");
  img3 = loadImage("earth-orange.png");
  img4 = loadImage("earth-red.png");
}

void draw() {
  //MAKING THE CAMERA IMAGE BIGGER
  scale(2);
  //LOADING IMAGES FROM THE VIDEO CAPTURE
  myopencv.loadImage(video);
  //DISPLAYING THE VIDEO ON THE SCREEN
  image(video, 0, 0 );
  //COLOR AND STROKE SETTINGS FOR THE GREEN RECTANGLE
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  //STORING THE FACES DETECTED SO THAT WE CAN USE THIS INFORMATION LATER
  Rectangle[] faces = myopencv.detect();
  //PRINTING IN THE CONSOLE NUMBER OF FACES DETECTED
  println("Number of Faces Detected:" + faces.length);

  //DRAWING Globes
  for (int i = 0; i < faces.length; i++) {
    image(img1, 0, 0);
    tint(255, 155);
  }
  for (int i = 1; i < faces.length; i++) {
    image(img2, 0, 0);
    tint(255, 155);
  }
  for (int i = 2; i < faces.length; i++) {
    image(img3, 0, 0);
    tint(255, 155);
  }
  for (int i = 3; i < faces.length; i++) {
    image(img4, 0, 0);
    tint(255, 155);
  }
  for (int i = 4; i < faces.length; i++) {
    background(0);
    textSize(10);
    text("How much damage will have been done before we act?", 30, 110);
  }
}

  //KEEPS CHECKING IF THE CAMERA IS ON, IF IT IS, IT KEEPS READING VIDEO DATA FROM IT
void captureEvent(Capture c) {
  c.read();
}


