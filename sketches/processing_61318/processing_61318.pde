
//project 2 rwandrew
//copyright russell andrews 2012

//code is adapted from John Gruen and Jim Roberts

import processing.video.*;
Capture v;

int sliderX, sliderY, sliderWidth, sliderHeight, threshHold;

float xPos, yPos, xPosPrev, yPosPrev, xTarget, yTarget, dX, dY;
float hEasing = .2; //horizontal easing of player ball
float vEasing = .2; //vertical easing of player ball
float dia = 40;

int xTotal;    //total x value (see below)
int yTotal;    //total y value (see below)
int grabTotal; //total number of sampled points in each blob (see below)

final int DS = 2;//rapid traverse incrementer downsamples pixel array
color target;//accesses target color
color vColor;//color for video indices;
float r, g, b, rT, gT, bT; // used to store target channels
int THRESH = 40; //color distance threshold

float rotationX= 100;
float rotationY = 170;
float velocityX = 0;
float velocityY = 0;

color vc;
float rc, gc, bc;
float rp , gp, bp;

PFont freight;
PFont helvetica;

void setup(){
  size(600, 600, P3D);
  noStroke();
  v = new Capture(this, width, height);
  freight = loadFont("freight.vlw");
  helvetica = loadFont("helvetica.vlw");
  textFont(freight);
  
  sliderX = 550;
  sliderY = 200;
  sliderWidth = 5;
  sliderHeight = height - sliderY*2;
   
  threshHold = 80;
} 


void draw(){
  drawVideo();
  setDot();
  traverseOne();
  drawInstructions();
  drawSlider();
  pushMatrix();
    screenPrep();
    resetOrigin();
    drawBox();
    hint(DISABLE_DEPTH_TEST);
    hint(ENABLE_DEPTH_TEST);
  popMatrix();
}

void drawVideo(){
  if(v.available()){
    v.read();
  }
  loadPixels();
  pushMatrix();
    scale(-1,1);
    image(v, -width, 0);
  popMatrix();
}

void screenPrep(){
  lights();
}

void resetOrigin(){
  translate(width/2, height*.7, 100);
  rotateX(radians(-rotationX));
  rotateZ(radians(270 - rotationY));
  
  rotationX += velocityX;
  rotationY += velocityY;
  
  velocityX *= 0.95;
  velocityY *= 0.95;
  
}

void drawBox(){
  noStroke();
  fill(0, 255, 200);
  box(width/6);
}

void mouseClicked(){  
   int index = -mouseX + mouseY*v.width;
   target = v.pixels[index];
   rT = red(target);
   gT = green(target);
   bT = blue(target);
}

void setDot(){
   dX = xTarget - xPosPrev; //distance btwn  current xTarget and previous x position
   dY = yTarget - yPosPrev; // ditto, but for y
   
   float dotMove = dist(xPos,yPos,xPosPrev,yPosPrev); //get distance between current position and prev position
   //if/else changes easing depending on how much the blob has moved
   if (dotMove < 400) {
     velocityX += (yTarget-yPosPrev) * 0.01; 
     velocityY += (xTarget-xPosPrev) * 0.01;
   } else {
     hEasing = .2;
     vEasing = .2; 
   }
   fill(255, 32, 0);
   ellipse(xPos, yPos, 7, 7);
     xPos += dX * hEasing; //xPos is the final x center point for our blob..gets easing applied
     yPos += dY * vEasing; //ditto for y
     xPosPrev = xPos;
     yPosPrev = yPos;
}

void traverseOne(){
  xTotal = 0;
  yTotal = 0;
  grabTotal = 0;
  for( int x =  1; x < v.width-1; x+=DS){
    for( int y = 1; y < v.height-1; y+=DS){
      int pos = -x + y*v.width;
      vColor = v.pixels[pos];
      r = red(vColor);
      g = green(vColor);
      b = blue(vColor);
      float diff = dist(r,g,b,rT,gT,bT);
      if (diff < THRESH) {
        xTotal+=x; //total x equals cumulative total of x positions within range of the target color
        yTotal+=y; //ditto for y
        grabTotal++; //grabtotal is the total number of pixels that match
      }
      if (grabTotal > 0) {
        xTarget = xTotal / grabTotal;
        yTarget = yTotal / grabTotal;
      }
    }
  } 
}

void drawInstructions(){
  rectMode(CORNER);
  fill(0, 100);
  rect(0, 0, width, 163);
  
  fill(0, 255, 200);
  textFont(freight);
  textSize(30);
  text("Control the rotation of the cube!", 15, 37);
  
  fill(255);
  textFont(helvetica);
  textSize(15);
  text("1. Hold a distinctly colored object in the screen.", 15, 67);
  text("2. Click on it.", 15, 90);
  text("3. Move the object up, down, left, or right to rotate the cube.", 15, 113);
  text("*Not detecting your object? Use the slider to adjust the threshold.", 15, 143);
  fill(255, 32, 0);
  text(THRESH, 543, 185);
}

void drawSlider(){
   fill(255);
   rectMode(CORNER);
   rect(sliderX, sliderY, sliderWidth, sliderHeight);
   ellipseMode(CORNER);
   ellipse(sliderX, sliderY-sliderWidth/2, sliderWidth, sliderWidth);
   ellipse(sliderX, height-(sliderY + sliderWidth/2), sliderWidth, sliderWidth);
   int barY = int( map(THRESH, 80, 0, sliderY, sliderY+sliderHeight));
   rectMode(CENTER);
   fill(255,32,0 );
   stroke(255);
   strokeWeight(3);
   ellipseMode(CENTER);
   ellipse(sliderX+sliderWidth/2, barY, sliderWidth + 10, sliderWidth + 10);
}

void mouseDragged(){
   THRESH = int(constrain(map(mouseY, sliderY, sliderY + sliderHeight, 80, 1) , 1, 80));  
}

