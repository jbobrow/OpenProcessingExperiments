

import controlP5.*;
ControlP5 cp5;


boolean tog1 = false;
float circleColor = 255;
float circleSize = 200;
float circleAlpha = 255;

// we need to access this in more than one function, 
// so must be a global variable
ColorPicker cp;

void setup() {
  size(600, 400);
  strokeWeight(1);

  cp5 = new ControlP5(this);
  cp5.addToggle("tog1").linebreak();
  cp5.addSlider("circleColor", 0, 255).linebreak();
  cp5.addSlider("circleSize", 0, 400).linebreak();
  //cp5.addSlider("circleAlpha", 0, 255).linebreak();
  cp = cp5.addColorPicker("picker").setPosition(10, 110);
}

void draw() {
  background(circleColor);
  if (tog1) {
    //loop for(init; test; update)
    for (int y = 0; y <= height; y = y + 50 ) {
      for (int x = 0; x <= width; x= x+ 50) {
        ellipse(x, y, 60, 60);
        stroke(cp.getColorValue());
        noFill();
        ellipse(x, y, circleSize, circleSize);
      }
    }
  }
}



