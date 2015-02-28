
/* Jack Bowen
HUM 240 Response
Lines represent the spread of information. Toggle whether or not 
you see the spread of info via real world or digital means. By 
default, only the real world spread of info is shown. Click
anywhere to create an event. Real world spread is mapped in red. 
Digital is in white. Click the spacebar to clear. 
*/

import controlP5.*;

ControlP5 controlP5;

public boolean realWorld = true;
public boolean digital = false;
boolean realStart = false;
boolean digitalStart = false;
int realChecker = 0, digitalChecker = 0, counter = 0;
float xStart, yStart, xFinish, yFinish, dX, dY;
float [] digitalX = new float[10];
float [] digitalY = new float[10];

void setup() {
  size(800,600);
  background(0);
  smooth();
  strokeWeight(.2);
  frameRate(30);
  controlP5 = new ControlP5(this);
  controlP5.addToggle("realWorld",true,20,20,20,20);
  controlP5.addToggle("digital",false,100,20,20,20);
}
  
void draw() {
  if(mousePressed) {
    realChecker = 0;
    digitalChecker = 0;
  }
  
  if(realWorld == true && mousePressed) {
    realStart = true;
  }
  
  if(mousePressed) {
    digitalStart = digital;
  }
  
  if(realStart == true && (counter % 6 == 0)) {
    stroke(255, 0, 0);
    if(realChecker == 0) {
      xStart = mouseX;
      yStart = mouseY;
      realChecker++;
    }
    xFinish = xStart + random(-30, 30);
    yFinish = yStart + random(-30, 30);
    line(xStart, yStart, xFinish, yFinish);
    xStart = xFinish;
    yStart = yFinish;
  }
  
  if(digitalStart == true) {
    stroke(255);
    
    for(int i = 0; i < 10; i++){
      if(digitalChecker == 0) {
        digitalX[i] = mouseX;
        digitalY[i] = mouseY;
      }
      dX = digitalX[i] + random(-30, 30);
      dY = digitalY[i] + random(-30, 30);
      line(digitalX[i], digitalY[i], dX, dY);
      digitalX[i] = dX;
      digitalY[i] = dY;
    }
    
    digitalChecker++;
      
  }
  
  counter++;
  
  if(keyPressed == true) {
    if(key == ' ') {
      background(0);
      digitalStart = false;
      realStart = false;
    }
  }
}

