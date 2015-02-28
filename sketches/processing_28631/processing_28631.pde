
/**
* 
* Project 3 Template
* UCLA Design Media Arts, Spring 2011 
* Prof. Casey Reas
* 
* Based on code from Lorenzo Bravi:
* http://www.lorenzobravi.com/projects/workshop-isia/
*/

float v; 
float easing = 0.4;  // Between 0 and 1
float volumeScalar = 6000;
boolean noMic = true;

PImage ear; // my addon
PImage ear2;
PImage tophat;
PImage monocle;
PImage tux;
//PImage moustache;


void setup() {
  size(500, 500);
  smooth();
  setupVolume();
  
  //my mod - images
  ear = loadImage("earPNG.png");
  ear2 = loadImage("earPNG2.png");
  tophat = loadImage("tophatPNG.png");
  monocle = loadImage("monoclePNG3.png");
  tux = loadImage("tux4.png");
 // moustache = loadImage("moustachePNG.png");
  
  
  //attempt at dynamic mouth_1
  
  // don't show where control points are
  noFill();
  stroke(0);
  beginShape();
  vertex(50, 75); // first point
  bezierVertex(25, 25, 125, 25, 100, 75);
  endShape();
  
  
  
}

void draw() {
  background(255);

  getVolume();
  

if (noMic == true) {
    v = map(mouseX, 0, width, 0, 150);  
  }


  testFace();
 
  //saveFrame("mask-####.png");
}


