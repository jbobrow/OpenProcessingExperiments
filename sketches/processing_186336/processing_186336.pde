
/* --------------------------------------------------------------------------
 * Pixelization effect for use with the OpenNI/Kinect 2 library
 * Effect only requires tracking of users, and not skeletons (Optimized for users walking by). Up and down keys modify the effects framerate
 * http://code.google.com/p/simple-openni
 * --------------------------------------------------------------------------
 * prog:  Alex Bradbury-Wallad
 * date:  12/17/2015 (m/d/y)
 * ----------------------------------------------------------------------------
 */
import SimpleOpenNI.*;
import java.util.*;
SimpleOpenNI  kinect;
int blob_array[];
int userCurID;
int cont_length = 640*480;
PVector com = new PVector();                                   
PVector com2d = new PVector();  
boolean tracking = false;
PImage backgroundImage;
PImage resultImage;
int userID; int[] userMap;
int framerate = 1;
int counter;
int spacing = 10;
color pixelFill = 0;
int pixelSize = 20;

void setup(){
  size(1280,960);
  kinect = new SimpleOpenNI(this);
  if(kinect.isInit() == false){
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  }
  kinect.enableDepth();
  kinect.enableRGB();
  kinect.enableUser();
  resultImage = new PImage(640, 480, RGB);
  blob_array = new int[cont_length];
}

void draw(){
  kinect.update();
  int[] depthValues = kinect.depthMap();
  int[] userMap =null;
  int userCount = kinect.getNumberOfUsers();
  if (userCount > 0) {
  userMap = kinect.userMap();
  }
    
  loadPixels();
  if (counter >= framerate){
    for (int y=0; y<kinect.depthHeight(); y+=spacing) {
      for (int x=0; x<kinect.depthWidth(); x+=spacing) {
        int index = x + y * kinect.depthWidth();
        if (userMap != null && userMap[index] > 0) {
          userCurID = userMap[index];
          blob_array[index] = 255;
          fill(pixelFill, 50);
          ellipseMode(CENTER);
          noStroke();
          ellipse(2 * x,2 * y,pixelSize,pixelSize);
        }
        else {
              blob_array[index]=0;
          }
       }
    }
  
  
  //tint(255, 20);
  //image(mov, 0, 0,width,height);
  //filter(GRAY);
  fill(255,255,255,20);
  rect(0,0,width,height);
  counter = 0;
  }
  counter += 1;
}

void onNewUser(SimpleOpenNI curkinect, int userId){
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  tracking = true;
  println("tracking");
  curkinect.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curkinect, int userId){
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curkinect, int userId){
  //println("onVisibleUser - userId: " + userId);
}


void keyPressed(){
  switch(keyCode){
   case 32:
      kinect.setMirror(!kinect.mirror());
      break;
   case 39:
     framerate += 1;
     break;
   case 37:
     framerate -= 1;
     break;
  }
}  

