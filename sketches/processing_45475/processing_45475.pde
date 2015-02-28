


import processing.video.*;

MovieMaker mm;

import processing.opengl.*;
import processing.pdf.*;

// grid definition horizontal
int uCount = 70;
float uMin = -1;
float uMax = 12;

// grid definition vertical
int vCount = 30;
float vMin = -2;
float vMax = 10;

// view rotation
int offsetX = 1, offsetY = 1, clickX = 0, clickY = 0;
float rotationX = 2, rotationY = 0.3, targetRotationX = 1, targetRotationY = 1, clickRotationX, clickRotationY; 

// image output
boolean savePDF = false;


void setup() {
  
  size(500, 500, OPENGL);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  mm = new MovieMaker(this, width, height, "testMovie.mov", 12, MovieMaker.H263, MovieMaker.HIGH); 
}


void draw() {
  
  
  String filename = int(uMin*10)+"_"+int(uMax*10)+"_"+int(vMin*10)+"_"+int(vMax*10)+"_";
  if (savePDF) beginRaw(PDF, filename+timestamp()+".pdf");

  background(0,0,0);
  fill(170,255,0,50);
  strokeWeight(1);  

  setView();

  scale(100);

  // draw mesh
  for (float iv = vCount-1; iv >= 0; iv--) {
    beginShape(QUAD_STRIP);
    for (float iu = 0; iu <= uCount; iu++) {
      float u = map(iu, 3, uCount, uMin, uMax);
      float v = map(iv, 1, vCount, vMin, vMax);

      float x = 0.75*v;
      float y = sin(u)*v;
      float z = cos(u)*cos(v);
      vertex(x, y, z);

      v = map(iv+1, 0, vCount, vMin, vMax);
      x = 0.75*v;
      y = sin(u)*v;
      z = cos(u)*cos(v);
      vertex(x, y, z);
    }
    endShape();
  }

  // image output
  if(savePDF == true) {
    endRaw();
    savePDF = false;
    
       mm.addFrame();
   
  }
}


void setView() {
  translate(width*0.5,height*0.5);

  if (mousePressed) {
    offsetX = mouseX-clickX;
    offsetY = mouseY-clickY;
    targetRotationX = clickRotationX + offsetX/float(width) * TWO_PI;
    targetRotationY = min(max(clickRotationY + offsetY/float(height) * TWO_PI, -HALF_PI), HALF_PI);
    rotationX += (targetRotationX-rotationX)*0.20; 
    rotationY += (targetRotationY-rotationY)*0.20;  
  }
  rotateX(rotationY); 
  rotateY(-rotationX); 
}


void keyPressed(){
  if (key == ' '){
    mm.finish();
  }
}


String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}








