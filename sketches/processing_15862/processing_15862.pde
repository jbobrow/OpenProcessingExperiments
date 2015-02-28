
//danielle yip
//dmgs 2010 @ sci-arc
//week 11 homework #1
//3d form from time capture

//import peasycam and dxf export libraries
import peasy.*;
import processing.dxf.*;


//set variables
boolean isRecording = false;
int recordFrame = 0;
int MAX_FRAMES = 8;
float xoff = 0.0;

//initialize peasycam
PeasyCam cam;

void setup(){
  size(600, 400, P3D);
  smooth();
  frameRate(10);
  //peasycam instance
  cam = new PeasyCam(this, 200);
}

void draw(){
  background(0, 15, 40);
  lights();
  stroke(255, 100);
  strokeWeight(0.5);
  
  if(isRecording){

    //start file on first frame of recording
    if(recordFrame == 0) beginRaw(DXF, "timeCapture.dxf");
    
    //increment recording frame count
    recordFrame++;
  }
  
  //draw objects
  //make it move each frame based on recordFrame variable
  for (int i=0; i<20; i++){
    
    //randomize objects
    xoff = xoff + .005;
    float n = noise(xoff) * height;
    float x = random(xoff*.1) * width/2;
    float y = random(xoff*.1) * height/4;
    float z = noise(xoff) * recordFrame * 500;
    float zz = recordFrame * 1.5 + 50;
    
    //create the objects
    pushMatrix();
    translate(0, 0, zz);
    //rotateX radians(30);
    rotateY(radians(10));
    line(0, n, z-25, x, y, z);
    line(x, y, z, 600, n+10, z + 25);
    popMatrix();
  }
  
  //stop recording & reset clock 
  //if recording and max frame count is reached
  
  if(isRecording && recordFrame == MAX_FRAMES){
    isRecording = false;
    recordFrame = 0;
    
    //close the file
    endRaw();
  }
}

//functionality for keyPressed
void keyPressed(){
  
  if(key == 'r'){
    recordFrame = 0;
    isRecording = true;
  }
}

/*code for drawing lines adapted from:
générateur de montagnes by quentin Aurat, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID=8165
License: http://creativecommons.org/licenses/by-sa/3.0/
http://creativecommons.org/licenses/GPL/2.0/ 
*/

