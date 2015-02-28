
// import the ControlP5 library
// www.sojamo.de/libraries/controlP5
import controlP5.*;
ControlP5 controlP5;

//define the colors used in the sliders
int redColor = color(255, 0, 0);
int greenColor = color(0, 255, 0);
int blueColor = color(0, 0, 255);
int blackColor = color(0, 0, 0);

void setupGUI() {
  controlP5 = new ControlP5(this);
  PFont GUIfont = createFont("arial", 12);
  controlP5.setControlFont(GUIfont);
  textFont(GUIfont);
  fill(0);
  text("Spirograph Parameters", 20, 30);
  controlP5.addSlider("R", 0.0, 150.0, 20, 40, 250, 20).setColorBackground(redColor);
  controlP5.addSlider("r", -150.0, 150.0, 20, 65, 250, 20).setColorBackground(greenColor);
  controlP5.addSlider("p", -200.0, 200.0, 20, 90, 250, 20).setColorBackground(blueColor);
  text("Drawing Speed", 20, 125);
  controlP5.addSlider("deltaT", 0.0001, 0.1, 20, 135, 250, 20).setColorBackground(blackColor);
  
  controlP5.addButton("startSpiro", 0, 20, 160, 110, 20).setLabel("Start drawing"); 
  controlP5.addButton("stopSpiro",  0, 20, 185, 110, 20).setLabel("Stop drawing"); 
  controlP5.addButton("reset",  0, 20, 210, 110, 20).setLabel("Reset");
}

void startSpiro() {
  drawSpiro = true;
}

void stopSpiro() {
  drawSpiro = false;
}

void reset() {
    for (int i = 0; i < totalPoints; i++) {
      patternX[i] = 0;
      patternY[i] = 0;
  }
  t = 0;
}



