

float initialXspeedCh = 2;
float initialYspeedCh = 3;
 
float initialXspeed = random(-4,5);
float initialYspeed = random(-4,5);
Circle[] Circles;
int numCircles = 1;
int increment = 0;

import processing.video.*;

Capture cam;


void setup() {
  size(400,400);
  smooth();
  background(255);
  Circles = new Circle[numCircles];
  Circles[increment] = new Circle(random(width/5,4*width/5),random(height/5,4*width/5),initialXspeed,initialYspeed);
 String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }  
 
}
 
void draw() { 
  
    if (cam.available() == true) {
    cam.read();
  }
  background(255);
   image(cam, 0, 0);
String s = "Get the dot on your forehead";
fill(250);
text(s, 115, 380, 200, 70);  // Text wraps within text box

  for (int i=0; i<numCircles; i++) {
    Circles[i].move();
    Circles[i].generate();
  }


  
}
 


 


 
class Circle {
  float xpos, ypos;
  float xspeed, yspeed;
  Circle (float xposIn, float yposIn, float xspeedIn, float yspeedIn) {
    this.xpos = xposIn;
    this.ypos = yposIn;
    this.xspeed = xspeedIn;
    this.yspeed = yspeedIn;
  }
  void generate() {
    fill(250,15,10);
    noStroke();
    smooth();
    ellipse(xpos,ypos,40,40);
  }
  void move() {
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
    if ( (xpos + 20 > width) || (xpos - 20 < 0) ) {
      xspeed = -1 * xspeed;
    }
    if ( (ypos + 20 > height) || (ypos - 20 < 0) ) { 
      yspeed = -1 * yspeed;
    }
    
  }
 

  
}



