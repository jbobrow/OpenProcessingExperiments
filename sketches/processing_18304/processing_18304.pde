


import controlP5.*;

ControlP5 controlP5;

color s = color(0,0,0);
color b = color(0,0,0);
color f = color(0,0,0,255);

int mode = RGB;

RadioButton r;

void setup() {
  size(400,188);
  frameRate(25);
  controlP5 = new ControlP5(this);
  
 
  //r.setItemsPerRow(5);
  //r.setSpacingColumn(50);
  
  
  
  Numberbox n = controlP5.addNumberbox("grey",0,20,60,40,14);
  n.setMax(255);
  n.setMin(0);

  n = controlP5.addNumberbox("back1",0,20,100,40,14);
  n.setMax(255);
  n.setMin(0);

  n =  controlP5.addNumberbox("back2",0,65,100,40,14);
  n.setMax(255);
  n.setMin(0);

  n = controlP5.addNumberbox("back3",0,110,100,40,14);
  n.setMax(255);
  n.setMin(0);

  n = controlP5.addNumberbox("fill1",0,20,140,40,14);
  n.setMax(255);
  n.setMin(0);

  n =  controlP5.addNumberbox("fill2",0,65,140,40,14);
  n.setMax(255);
  n.setMin(0);

  n = controlP5.addNumberbox("fill3",0,110,140,40,14);
  n.setMax(255);
  n.setMin(0);

  n = controlP5.addNumberbox("fill4",255,155,140,40,14);
  n.setMax(255);
  n.setMin(0);
  
   r = controlP5.addRadioButton("mode",20,20);
  r.setNoneSelectedAllowed(false);
  r.addItem("RGB",RGB);
  r.addItem("HSB",HSB);
  r.activate("RGB");
}

void draw() {
  background(b);
  stroke(s);
  fill(f);
  rect(215,20,width-235,148);
}



void controlEvent(ControlEvent theEvent) {
  if ( theEvent.isGroup() && theEvent.group() == r) {
   mode = (int)theEvent.group().value();
   colorMode(mode);
   
  }
  s = color(controlP5.controller("grey").value());
  
  f = color(controlP5.controller("fill1").value(), 
   controlP5.controller("fill2").value(),
   controlP5.controller("fill3").value(),
   controlP5.controller("fill4").value());
   
   b = color(controlP5.controller("back1").value(), 
   controlP5.controller("back2").value(),
   controlP5.controller("back3").value());
  
}

// A bunch of empty functions so that 
// the controllers work with ints instead
// of floats

public void grey(int value) {
}

public void back1(int value) {

}

public void back2(int value) {
 
}

public void back3(int value) {
 
}

public void fill1(int value) {
  
}

public void fill2(int value) {
 
}

public void fill3(int value) {
  
}

public void fill4(int value) {
  
}


