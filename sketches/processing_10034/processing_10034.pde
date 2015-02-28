
//import the needed libraries
import processing.video.*;
import hypermedia.video.*;
import java.awt.Rectangle;

//open computer vision as a global item
OpenCV opencv;

//set up my global array
int [] [] myArray;

//the setup of the stage or application 
void setup(){
  //P3D is important for this to work because without it, the application breaks. It means processing 3d
  size (450,450,P3D);
  //loading in the camera vision properties
  opencv = new OpenCV( this );
  opencv.capture( width, height );                 
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );
  //creating my array of circles
  int row = 200, col = 200;
  myArray = new int [row][col];
  for (int h = 0; h < row ; h++) {
    myArray[h] = new int [col];
    for (int i = 0; i < col ; i++) {
      myArray [h][i] = round(random(10));
    }
  }
}

//function needed for the camera vision(used from the face tracking example)
public void stop() {
  opencv.stop();
  super.stop();
}

//what is executed immediately 
void draw(){
  //I tell it to read the properties as an action
  opencv.read();
  Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
  image( opencv.image(), 0, 0 );
  //I add my array and float them 
  float circles;
  for (int h = 0 ; h < myArray.length; h++){
    for  (int i = 0; i <myArray[h].length; i++){
      /*originally this was tracking the mouse position, and then I tried changing it to follow
      my face, but this was unsuccessful. I left the different fill opptions for when I can 
      figure out the solution. */
      float d = dist(h*20+10, i*20+10, 600, 600);
      noStroke();
      if(d<100){
        fill(255-d,0,0,100 - d/100);
        circles = myArray[h][i] + 200/(d+1);
      }
      else{
        fill(255);
        circles = myArray[h][i] ;
      }
      
      //the loop that tracks your face
      for( int f=0; f<faces.length; f++ ) {
        noFill();
        stroke(255,0,0);
        rect( faces[f].x, faces[f].y, faces[f].width, faces[f].height ); 
      }
      
      //all the circles on the stage
      ellipse(h*20+10,i*20+10,circles,circles);
    }
  }
}

