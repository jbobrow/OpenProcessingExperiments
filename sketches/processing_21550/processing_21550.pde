
import controlP5.*;
 
public ControlP5 control;
public ControlWindow w;

void setParameters() {
  blackness = 10;
  blueness = 300;
  depth = 100;
  duration = 5;
  easing = 0;
  grayness = 50;
  logoscale = 1;
  safespacelateral = 100;
  safespacevertical = 100;
  shoeorbitradius = 200;
  shoeorbitspeed = 1;
  shoerotationspeed = 1;
}

void makeControls() {
  control = new ControlP5(this);
   
  w = control.addControlWindow("controlWindow", 10, 10, 415,161);
  w.hideCoordinates();
  w.setTitle("dynamization parameters");  
   
  int y = 0;
  
  control.addTextlabel("label1","form",10,y+=10).setWindow(w);
  control.addSlider("Logo Scale", 0, 5, logoscale, 10, y += 10, 256, 9).setWindow(w);
  control.addSlider("Depth", 0, 1000, depth, 10, y += 10, 256, 9).setWindow(w);
  control.addSlider("Lateral Safe Area", 0, 640, safespacelateral, 10, y += 10, 256, 9).setWindow(w);
  control.addSlider("Vertical Safe Area", 0, 480, safespacevertical, 10, y += 10, 256, 9).setWindow(w);
  control.addSlider("Blackness", 0, 100, blackness, 10, y += 10, 256, 9).setWindow(w);
  control.addSlider("Blueness", 0, 360, blueness, 10, y += 10, 256, 9).setWindow(w);
  control.addSlider("Grayness", 0, 100, grayness, 10, y += 10, 256, 9).setWindow(w);
  
  
  control.addTextlabel("label3","motion",10,y+=20).setWindow(w);
  control.addSlider("Easing", 0, 5, easing, 10, y += 10, 256, 9).setWindow(w);
  control.addSlider("Max Rotatations (per Second)", 0, 5, shoerotationspeed, 10, y += 10, 256, 9).setWindow(w);
  control.addSlider("Max Orbit Radius", 0, 640, shoeorbitradius, 10, y += 10, 256, 9).setWindow(w);
  control.addSlider("Max Orbit Cycles (per Second)", 0, 5, shoeorbitspeed, 10, y += 10, 256, 9).setWindow(w);
  

  control.setAutoInitialization(true);
}




