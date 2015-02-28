
import controlP5.*;

//1 DECLARE
ControlP5 jControl;



int aColor =175;
int bColor =175;
int cColor =175;

void setup(){
 size (500,350); 
  
  //2 INITIALIZE
  jControl = new ControlP5(this);
  
  Slider s = jControl.addSlider("aColor",0,255,100,10,10,200,30);
  Slider d = jControl.addSlider("bColor",0,255,100,10,60,200,30);
  Slider f = jControl.addSlider("cColor",0,255,100,10,100,200,30);
}

void draw(){
  background (aColor,bColor,cColor);
  noStroke();
  // Bright red
fill(255,3,3);
ellipse(100,250,150,150);

// Dark red
fill(0,232,13);
ellipse(250,250,150,150);

// Pink (pale red)
fill(0,21,232);
ellipse(400,250,150,150);
}

