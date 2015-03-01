
int xPos=52;
int yPos=82;
int wSize=6;
int hSize=50;
int rSize=32;
int cSize=35;


void setup(){
  size(800,600);
  background(93);
  
  smooth();
  
  strokeWeight(1.25);
  fill(51);
  rect(155,38,629,544);
  
  fill(255);
  rect(145,28,629,544);
  
  fill(255);
  rect(58,88,rSize,rSize);
  
  
  fill(239,91,130);
  rect(xPos,yPos,rSize,rSize);
  
  fill(255);
  rect(xPos+wSize,yPos+hSize+wSize,rSize,rSize);
  
  fill(247,247,60);
  rect(xPos, yPos+hSize,rSize,rSize);
  
  fill(255);
  rect(xPos+wSize, yPos+hSize*2+wSize,rSize,rSize);
  
  fill(112,229,229);
  rect(xPos, yPos+hSize*2,rSize,rSize);
  
  fill(255);
  rect(xPos+wSize, yPos+hSize*3+wSize,rSize,rSize);
  
  fill(131,234,131);
  rect(xPos, yPos+hSize*3,rSize,rSize);
  //ellipse
  fill(255);
  rect(xPos+wSize,yPos+hSize*5+wSize,rSize,rSize);
    
  fill(243,136,252);
  rect(xPos, yPos+hSize*5,rSize,rSize);
  
  fill(255);
  rect(xPos+wSize, yPos+hSize*6+wSize,rSize,rSize);
  
  fill(247,143,8);
  rect(xPos, yPos+hSize*6,rSize,rSize);
  
  
  fill(255);
  rect(xPos+wSize, yPos+hSize*7+wSize,rSize,rSize);
  
  fill(94,94,234);
  rect(xPos, yPos+hSize*7,rSize,rSize);
  
  fill(255);
  rect(xPos+wSize, yPos+hSize*8+wSize,rSize,rSize);
  
  fill(158,155,156);
  rect(xPos, yPos+hSize*8,rSize,rSize);
 
}

void draw() {
  if (mousePressed) {
    if(774>pmouseX && 774>mouseX && pmouseX>145 && mouseX>145 && 572>pmouseY && 572>mouseY && pmouseY>28 && mouseY>28){
      ellipse(pmouseX, pmouseY, mouseX/8, mouseY/10);
    }

    if(mouseX>xPos && mouseX<xPos+rSize && mouseY>yPos && mouseY<yPos+rSize) {
      fill(239,91,139);
      stroke(255);
      strokeWeight(1);
    }    
    if(mouseX>xPos && mouseX<xPos+rSize && mouseY>yPos+hSize && mouseY<yPos+hSize+rSize) {
      fill(247,247,60);
      stroke(0);
      strokeWeight(1);
    }
    if(mouseX>xPos && mouseX<xPos+rSize && mouseY>yPos+hSize*2 && mouseY<yPos+hSize*2+rSize) {
      stroke(255);
      fill(112,229,229);
      strokeWeight(1);
    }
    if(mouseX>xPos && mouseX<xPos+rSize && mouseY>yPos+hSize*3 && mouseY<yPos+hSize*3+rSize) {
      stroke(0);
      fill(131,234,131);
      strokeWeight(1);
    }
        
    if(mouseX>xPos && mouseX<xPos+rSize && mouseY>yPos+hSize*5 && mouseY<yPos+hSize*5+rSize) {
      stroke(255);
      fill(234,136,252);
      strokeWeight(1);
    }
     if(mouseX>xPos && mouseX<xPos+rSize && mouseY>yPos+hSize*6 && mouseY<yPos+hSize*6+rSize) {
      stroke(0);
      fill(247,143,8);
      strokeWeight(1);
    }
    if(mouseX>xPos && mouseX<xPos+rSize && mouseY>yPos+hSize*7 && mouseY<yPos+hSize*7+rSize) {
      stroke(255);
      fill(94,94,234);
      strokeWeight(1);
    }
    if(mouseX>xPos && mouseX<xPos+rSize && mouseY>yPos+hSize*8 && mouseY<yPos+hSize*8+rSize) {
      stroke(0);
      fill(158,155,156);
      strokeWeight(1);
    }
  }
}

import processing.pdf.*;

void setup() {
  size(400, 400, PDF, "filename.pdf");
}

void draw() {
  // Draw something good here
  line(0, 0, width/2, height);

  // Exit the program 
  println("Finished.");
  exit();
}
