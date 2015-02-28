
int dim = 800;
int step = 50;
int r = 50;
int a = 100;


import controlP5.*;
ControlP5 controlP5;  
Button b;


void setup() {

  controlP5 = new ControlP5(this);
  controlP5.begin(dim+30, 10);
  controlP5.addSlider("raggio", 0, 500).linebreak();
  controlP5.addSlider("stepF", 0, 300).linebreak();
  controlP5.addSlider("aperturaF", 0, 300).linebreak();
  controlP5.addButton("casuale", 0, dim+80, 80, 40, 20);


  controlP5.end();


  size(dim+300, dim);
  noFill();
  smooth();
}

void draw() {
  noFill();
  smooth();

  background(204, 204, 204);
  stroke(0, 0, 0);
  for (int i=1;i<step+1;i++) {

    ellipse(dim/2+cos(2*PI*i/step)*a, dim/2+sin(2*PI*i/step)*a, r, r);
  }

}

public void raggio(int v) { 
  r = v;
}
public void stepF(int v) { 
  step = v;
}

public void aperturaF(int v) { 

  a = v;
}

public void casuale(int theValue) {

  r = (int)random(500);
Slider s1 = (Slider)controlP5.controller("raggio");
s1.setValue(r);
 step = (int)random(300);
 Slider s2 = (Slider)controlP5.controller("stepF");
s2.setValue(step);

  a = (int)random(300);
   Slider s3 = (Slider)controlP5.controller("aperturaF");
s3.setValue(a);

}


