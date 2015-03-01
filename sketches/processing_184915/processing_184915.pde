
//INSTALL openCV library from Sketch > Import Library > Add Library > Type 'opencv' in the search bar

//BELOW WE IMPORT LIBRARIES
import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import processing.serial.*;

int x = 0;
int speed = 10;

//WE CREATE TWO OBJECTS video OF TYPE Capture AND myopencv OF TYPE OPENCV
Capture video;
OpenCV myopencv;

void setup() {
  //SETTING UP REGULAR STUFF
  size(1024, 768);
  //TELLING video AND myopencv ITS SIZE
  video = new Capture(this, 1024/2, 768/2);
  myopencv = new OpenCV(this, 1024/2, 768/2);
  //TELLING myopencv TO LOAD FRONT CAMERA (WEBCAM) SO IT CAN START DETECTING
  myopencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  //START THE CAMERA
  video.start();
}


void draw() {
  //MAKING THE CAMERA IMAGE BIGGER
  scale(2);
  //LOADING IMAGES FROM THE VIDEO CAPTURE
  myopencv.loadImage(video);
  //DISPLAYING THE VIDEO ON THE SCREEN
  image(video, 0, 0 );
  //COLOR AND STROKE SETTINGS FOR THE GREEN RECTANGLE
  //noFill();
  stroke(219, 232, 41);
  strokeWeight(1);
  //STORING THE FACES DETECTED SO THAT WE CAN USE THIS INFORMATION LATER
  Rectangle[] faces = myopencv.detect();
  //PRINTING IN THE CONSOLE NUMBER OF FACES DETECTED
  println("Humanoids Detected:" + faces.length);
if (faces.length == 4) {
     println("Occupancy Exceeded");
     println("Dad has been called");
     fill(242,259,5,75);
      ellipseMode(CENTER);
      //l eye
      ellipse(50, 50, 5, 5);
      //r eye
      ellipse(70, 50, 5, 5);
      //nose
      ellipse(60, 60, 5, 5);
      //mouth
      ellipse(40, 80, 3, 3);
      ellipse(50, 75, 3, 3);
      ellipse(60, 70, 3, 3);
      ellipse(70, 75, 3, 3);
      ellipse(80, 80, 3, 3);
    }
if (faces.length == 3) {
     println("Occupancy Exceeded");
     println("Mom has been texted");
     fill(31,96,26,75);
     ellipseMode(CENTER);
      //l eye
      ellipse(50, 50, 5, 5);
      //r eye
      ellipse(70, 50, 5, 5);
      //nose
      ellipse(60, 60, 5, 5);
      //mouth
      ellipse(40, 83, 3, 3);
      ellipse(50, 79, 3, 3);
      ellipse(60, 75, 3, 3);
      ellipse(70, 79, 3, 3);
      ellipse(80, 83, 3, 3);
    }
if (faces.length == 2) {
      println("Occupancy Exceeded");
      fill(230,15,15,75);
      ellipseMode(CENTER);
      //l eye
      ellipse(50, 50, 5, 5);
      //r eye
      ellipse(70, 50, 5, 5);
      //nose
      ellipse(60, 60, 5, 5);
      //mouth
      ellipse(40, 79, 3, 3);
      ellipse(50, 77, 3, 3);
      ellipse(60, 75, 3, 3);
      ellipse(70, 77, 3, 3);
      ellipse(80, 79, 3, 3);
    }
if (faces.length == 1) {
      println("Occupancy Approved");
      fill(41,93,232,75);
      ellipseMode(CENTER);
      //l eye
      ellipse(50, 50, 5, 5);
      //r eye
      ellipse(70, 50, 5, 5);
      //nose
      ellipse(60, 60, 5, 5);
      //mouth
      ellipse(40, 71, 3, 3);
      ellipse(50, 73, 3, 3);
      ellipse(60, 75, 3, 3);
      ellipse(70, 73, 3, 3);
      ellipse(80, 71, 3, 3);
    }
    if (faces.length == 0) {
      println("No Occupants Detected");
      fill(217,18,227);
      ellipseMode(CENTER);
      //l eye
      ellipse(50, 50, 5, 5);
      //r eye
      ellipse(70, 50, 5, 5);
      //nose
      ellipse(60, 60, 5, 5);
      //mouth
      ellipse(40, 75, 3, 3);
      ellipse(50, 75, 3, 3);
      ellipse(60, 75, 3, 3);
      ellipse(70, 75, 3, 3);
      ellipse(80, 75, 3, 3);
    }
    
  //DRAWING RECTANGLES ON THE FACES SO THAT WE CAN SEE A VISUAL INDICATION THAT IT DETECTED
  for (int i = 0; i < faces.length; i++) {
    ellipseMode(CORNER);
    ellipse(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    //in class example
    }
 
}


  //KEEPS CHECKING IF THE CAMERA IS ON, IF IT IS, IT KEEPS READING VIDEO DATA FROM IT
void captureEvent(Capture c) {
  c.read();
}


