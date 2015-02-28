
import controlP5.*;

float t = 0;
float kx = 0;
float ky = 0;
float dt = 0;
boolean run,sim;

ControlP5 controlP5;

void setup() {
  size(600, 600); 
  colorMode(HSB);
  smooth();
  background(0);
  run = true;
  sim = false;
  controlP5 = new ControlP5(this);
  ControlWindow cw = controlP5.addControlWindow("control", 200, 300);
  cw.setLocation(width+150, 100);
  cw.background = 100;

  controlP5.begin(cw, 10, 140); 
  controlP5.addSlider("X", 0, 10, 0, 10, 20, 100, 20).moveTo(cw);
  controlP5.addSlider("Y", 0, 10, 0, 10, 60, 100, 20).moveTo(cw);
  controlP5.addSlider("DT", 0, 2, 0, 10, 100, 100, 20).moveTo(cw);
  controlP5.addButton("RUN_STOP").setSwitch(run);
  controlP5.addButton("SIM");
  controlP5.end();

  controlP5.controller("X").setValue(1);
  controlP5.controller("Y").setValue(1);
  controlP5.controller("DT").setValue(1);
  
}

void draw() {

  int r = width/3;
  noStroke();
  fill(0, 1);
  rect(0, 0, width, height);  
  translate(width/2, height/2);

  if( run == true){
  float y = r*sin(radians(kx*t));
  float x = r*cos(radians(ky*t));
  
//  fill(250*sin(radians(t/2)),200,200);
  fill(x,200,200);
  ellipse(x,y,4,4);
  ellipse(-x,-y,4,4);
  
  if ( sim == true){
  ellipse(y,x,4,4);
  ellipse(-y,-x,4,4);
  }
  t += dt;
  }
}

public void X(int v) {
  background(0);
  kx = v;
  t = 0;
}

public void Y(int v) {
  background(0);
  ky = v;
  t = 0;
}

public void DT(float v) {
  dt = v;
}

public void RUN_STOP() {
  run = !run;
}

public void SIM() {
  background(0);
  color cl = color(150,200,200);
  controlP5.controller("SIM").setColorActive(cl);
  sim = !sim;
  t = 0;
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

