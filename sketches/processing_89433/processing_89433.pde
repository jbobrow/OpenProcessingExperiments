
import controlP5.*;

ControlP5 cp5;
boolean tog1 = false;

float LineColor = 255;
float circleSize = 200;

// we need to access this in more than one function, 
// so must be a global variable
ColorPicker cp;

int s = 10;
void setup() {
  size(400, 400);
  
  cp5 = new ControlP5(this);
  cp5.addToggle("tog1").linebreak();
  cp5.addSlider("LineColor", 0, 255).linebreak();
  
  
  cp = cp5.addColorPicker("picker").setPosition(10, 110);
}

void draw() {
  background(0 );
  

  if (tog1) {
    drawTopLines();
    drawRightLines();
    drawBottomLines();
    drawLeftLines();
    drawTopLines2();
    drawRightLines2();
    drawBottomLines2();
    drawLeftLines2();
    
  }
 
}

void drawLeftLines() {
  int bx=0;
  int by=height;
  while (by>0) {
    stroke(cp.getColorValue() , LineColor);
    line(mouseX, mouseY, bx, by);
    by+=-s;
  }
}


void drawBottomLines() {
  int bx=width;
  int by=height;
  while (bx>0) {
    stroke(cp.getColorValue(), LineColor);
    line(mouseX, mouseY, bx, by);
    bx+=-s;
  }
}

void drawRightLines() {
  int rx=width;
  int ry=0;
  while (ry<height) {
    stroke(cp.getColorValue(), LineColor);
    line(mouseX, mouseY, rx, ry);
    ry+=s;
  }
}

void drawTopLines() {
  int ux=0;
  int uy=0;
  while (ux<width) {
    stroke(cp.getColorValue(), LineColor);
    line(mouseX, mouseY, ux, uy);
    ux+=s;
  }
}

void drawLeftLines2() {
  int bx=0;
  int by=height;
  while (by>0) {
    stroke(cp.getColorValue(), LineColor);
    line(mouseY, mouseX, bx, by);
    by+=-s;
  }
}


void drawBottomLines2() {
  int bx=width;
  int by=height;
  while (bx>0) {
    stroke(cp.getColorValue(), LineColor);
    line(mouseY, mouseX, bx, by);
    bx+=-s;
  }
}

void drawRightLines2() {
  int rx=width;
  int ry=0;
  while (ry<height) {
    stroke(cp.getColorValue(), LineColor);
    line(mouseY, mouseX, rx, ry);
    ry+=s;
  }
}

void drawTopLines2() {
  int ux=0;
  int uy=0;
  while (ux<width) {
    stroke(cp.getColorValue(), LineColor);
    line(mouseY, mouseX, ux, uy);
    ux+=s;
  }
}

void keyPressed() {
  if (key=='p')
  {
    saveFrame("hw4.jpg");
  }
}



