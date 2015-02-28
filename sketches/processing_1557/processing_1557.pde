
/*
 bounding boxes is a simple object tracking example.
 point the camera at some big bright objects and the boxes will follow.
 
 last tested to work in Processing 0090
 
 JTNIMOY
 
*/


import JMyron.*;

JMyron m;//a camera object
 
void setup(){
  size(320,240);
  m = new JMyron();//make a new instance of the object
  m.start(width,height);//start a capture at 320x240
  m.trackColor(255,0,0,130);//R, G, B, and range of similarity
  m.minDensity(50); //minimum pixels in the glob required to result in a box
  println("Myron " + m.version());
  noFill();
}

void draw(){
  m.update();//update the camera view
  drawCamera();//draw the camera to the screen
  int[][] b = m.globBoxes();//get the center points

  //draw the boxes
  stroke(255,0,0);
  for(int i=0;i<b.length;i++){
    rect( b[i][0] , b[i][1] , b[i][2] , b[i][3] );
  }
 
}

void drawCamera(){
  int[] img = m.image(); //get the normal image of the camera
  loadPixels();
  for(int i=0;i<width*height;i++){ //loop through all the pixels
    
    pixels[i] = img[i]; //draw each pixel to the screen
    //print(color(255,150,));
    //print("||");
  }
  updatePixels();

}

void mousePressed(){
  m.settings();//click the window to get the settings
}

public void stop(){
  m.stop();//stop the object
  super.stop();
}


