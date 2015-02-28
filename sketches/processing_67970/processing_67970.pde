
import processing.video.*;
MovieMaker myMovie;
import JMyron.*;

JMyron m;//a camera object

//variables to maintain the floating green circle
PImage b;
float objx = 160;
float objy = 120;
float objdestx = 160;
float objdesty = 120;

void setup(){
  b=loadImage("test.png");
  size(320,240);
  m = new JMyron();//make a new instance of the object
  m.start(width,height);//start a capture at 320x240
  m.trackColor(255,255,255,256*3-100);//track white
  m.update();
  m.adaptivity(10);
  m.adapt();// immediately take a snapshot of the background for differencing
  println("Myron " + m.version());
  rectMode(CENTER);
  noStroke();
  import processing.video.*;
  MovieMaker myMovie;
}


void draw(){
  m.update();//update the camera view
  drawCamera();
  
  int[][] centers = m.globCenters();//get the center points
  //draw all the dots while calculating the average.
  float avX=0;
  float avY=0;
  for(int i=0;i<centers.length;i++){
    fill(80);
    rect(centers[i][0],centers[i][1],5,5);
    avX += centers[i][0];
    avY += centers[i][1];
  }
  if(centers.length-1>0){
    avX/=centers.length-1;
    avY/=centers.length-1;
  }

  //draw the average of all the points in red.
  fill(255,0,0);
  rect(avX,avY,5,5);

  //update the location of the thing on the screen.
  if(!(avX==0&&avY==0)&&centers.length>0){
    objdestx = avX;
    objdesty = avY;
  }
  objx += (objdestx-objx)/10.0f;
  objy += (objdesty-objy)/10.0f;
  fill(30,100,0);
  imageMode(CENTER);
  image(b,objx,objy,40,40);
  myMovie.addFrame();
}

void drawCamera(){
  int[] img = m.differenceImage(); //get the normal image of the camera
  loadPixels();
  for(int i=0;i<width*height;i++){ //loop through all the pixels
    pixels[i] = img[i]; //draw each pixel to the screen
  }
  updatePixels();
}

void keyPressed() {
if (key == ' ') { // If we press spacebar...
myMovie.finish(); // Stop recording
}
}
void stop() {
myMovie.finish(); // This finishes off the file properly...
super.stop();
}


