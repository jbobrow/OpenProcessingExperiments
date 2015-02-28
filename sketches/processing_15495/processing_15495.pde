
import processing.dxf.*;
boolean record;
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;


int rotater = 1;
float lineQ = random(.1,1);

void setup(){
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);
  size(800,800,P3D);
  smooth();
}

void draw(){
  
  if (record) {
    beginRaw(DXF, "output.dxf");
  }
  int ro = 30;
  float x = random(80,160);
  float y = random(-80,0);

//  fill(0,20);
//  rectMode(CENTER);
//  rect(width/2,height/2,width,height);
for (int i = 0; i <100; i ++ ) {
  //pushMatrix();
  translate(height/2,width/2,-1200);
  strokeWeight(lineQ);
  stroke(255,0,0);
  rotateX(radians(rotater++));
  rotateY(radians(rotater++));
  beginShape(LINES);
  vertex(y,y,y);
  vertex(x,x,x);
  vertex(x,y,y);
  vertex(y,x,x);
  stroke(0,0,255);
  vertex(y,x,y);
  vertex(x,y,x);
  vertex(y,y,x);
  vertex(x,x,y);
  
  endShape();
     //popMatrix(); 
     
    if (record) {
    endRaw();
    record = false;
  }
}  
}



void keyPressed() {
  // use a key press so that it doesn't make a million files
  if (key == 'r') record = true;
}

