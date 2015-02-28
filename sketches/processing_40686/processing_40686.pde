
/* THUY LINH DO 
ASSIGNMENT 4 CREATION & COMPUTATION
OCAD UNIVERSITY FALL 2011 */

import processing.video.*;
Capture video;
color trackColor; 
Robot robot;
int button = 0;
int[] xpos = new int[10];
int[] ypos = new int[10];

//function setup
void setup(){
  size(534, 400);
  video = new Capture(this,width,height,30);
  // Start off tracking for red
  trackColor = color(255,0,0);
  frameRate(30);
  smooth();
  for (int i=0; i<xpos.length; i++){
    xpos[i]=0;
    ypos[i]=0;
  }
}

//function draw
void draw() {
    if (video.available()) {
    video.read();
  }
  video.loadPixels();
  image(video,0,0);
  float worldRecord = 500;   
  int closestX = 0;
  int closestY = 0;  
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);  
      float d = dist(r1,g1,b1,r2,g2,b2);
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }    
    }
  }

  if (worldRecord < 10) { 
    // Draw a circle at the tracked pixel
    fill(trackColor);
    strokeWeight(4.0);
    stroke(0);
    ellipse(closestX,closestY,16,16);
  }

  //using array to display robot
  for (int i = 0; i < xpos.length-1; i ++ ) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  // New location
  xpos[xpos.length-1] = closestX;  
  ypos[ypos.length-1] = closestY;  
  // Draw everything
  for (int i = 0; i < xpos.length; i ++ ) {  
  robot = new Robot(xpos[i],ypos[i], button);  
  robot.display( int(255*float(i)/float(xpos.length)) );
 }
}

 
//Declare object class Robot 
  class Robot{
  //robot variables
  float closestX;
  float closestY;
  int robotButton;
  int robotColor;
  //robot constructor
  Robot(float tempX, float tempY, int tempButton){
  closestX = tempX;
  closestY = tempY;
  robotButton = tempButton;
  closestY = constrain(closestY, 0, height+100);
  closestX = constrain(closestX, 0, width);
  }
  //function display robot 
   void display(float opacity) {
pushMatrix();     
strokeWeight (3);
//ROBOT HEAD
//coloring the head
stroke(174,223,228,opacity); 
fill(174,223,228,opacity);
rect (closestX-60,closestY-150,120,120);
rect (closestX-80,closestY-130,160,80); 
//antennae
stroke(0,0,0,opacity);
line (closestX, closestY-150, closestX-10, closestY-170);
line (closestX, closestY-150, closestX+10, closestY-170);
//head border lines
line (closestX-60, closestY-150, closestX+60, closestY-150);
line (closestX-60, closestY-30, closestX+60, closestY-30);
line (closestX-80, closestY-130, closestX-80, closestY-50);
line (closestX+80, closestY-130, closestX+80, closestY-50);
//head's corners
ellipseMode(CORNER);
arc(closestX-80, closestY-150, 40, 40, PI, TWO_PI-PI/2);
arc(closestX+40, closestY-150, 40, 40, TWO_PI-PI/2, TWO_PI);
arc(closestX+40, closestY-70, 40, 40, 0, PI/2);
arc(closestX-80, closestY-70, 40, 40, PI/2, PI);
//eyes change based on number of times mouse clicked 
if (robotButton==2) { 
    //emotional eyes
    line(closestX-40, closestY-120, closestX-60, closestY-125);
    line(closestX-40, closestY-120, closestX-60, closestY-115);
    line(closestX+40, closestY-120, closestX+60, closestY-125);
    line(closestX+40, closestY-120, closestX+60, closestY-115);
  } else  if (robotButton==0) {
    //round eyes
    ellipseMode(CENTER);
    fill(0,0,0,opacity);
    ellipse(closestX-45,closestY-120,10,10);
    ellipse(closestX+45,closestY-120,10,10);
  } else if (robotButton==1){
    //eyes with glasses
    rectMode(CENTER);
    fill (150,150,150,opacity);
    rect(closestX-40, closestY-120,50, 20);
    rect(closestX+40,closestY-120,50, 20);
    line(closestX-15,closestY-120,closestX+15,closestY-120);
    rectMode(CORNER);
    fill(0,0,0,opacity);
    line(closestX-55, closestY-120,closestX-25, closestY-120);
    line(closestX+25, closestY-120,closestX+55, closestY-120);
  } else {
    //happy eyes
    fill(174,223,228,opacity);
    stroke(0,0,0,opacity); 
    ellipseMode(CENTER);
    arc(closestX-40, closestY-115, 20, 20, PI, TWO_PI-PI/2);
    arc(closestX-40, closestY-115, 20, 20, TWO_PI-PI/2, TWO_PI);
    arc(closestX+40, closestY-115, 20, 20, PI, TWO_PI-PI/2);
    arc(closestX+40, closestY-115, 20, 20, TWO_PI-PI/2, TWO_PI);
  }
//blush
ellipseMode(CENTER);
stroke(247,165,170,opacity);
fill(247,165,170,opacity); 
ellipse(closestX-50,closestY-100,10,10);
ellipse(closestX+50,closestY-100,10,10);
//mouth
stroke(0,0,0,opacity); 
line (closestX-20, closestY-100, closestX+20, closestY-100);
//ROBOT BODY
fill(174,223,228,opacity);
rect (closestX-25,closestY-30,50,50);
//button
ellipse (closestX,closestY-5,30,30);
line (closestX-5, closestY-10, closestX-5, closestY);
line (closestX+5, closestY-10, closestX+5, closestY);
//hands
line (closestX-25, closestY-30, closestX-35, closestY+5);
line (closestX+25, closestY-30, closestX+35, closestY+5);
//legs
line (closestX-15, closestY+20, closestX-15, closestY+45);
line (closestX+15, closestY+20, closestX+15, closestY+45);
popMatrix();
}
  }

//Mouse pressed function
void mousePressed() {
    int loc = mouseX + mouseY*video.width;
    trackColor = video.pixels[loc];
    if (button<3){
      button += 1;} else {
      button=0;}
}



