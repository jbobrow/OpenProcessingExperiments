
//Le slider fait varier la vitesse de rotation des cercles
//Inspiré de Fun Programming http://studio.sketchpad.cc/sp/pad/view/ro.9jbYMmZSsnb-v/rev.91


import controlP5.*;

ControlP5 controlP5;

float rot = 0;
float vitesse = 0;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  ellipseMode(CORNER);
  controlP5 = new ControlP5(this);
  controlP5.addSlider("slider", 0, 3, 123, 10, 10, 50, 20);
}

void draw_rotating_circle(float x, float y, float cir_size, float r) {
  translate(x, y);
  rotate(r);
  fill(#989DCB);
  ellipse(0, 0, cir_size, cir_size);
  resetMatrix();
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) { 
    print("control event from : "+theEvent.controller().name());
    println(", value : "+theEvent.controller().value());

    if (theEvent.controller().name()=="slider") {
      float val = theEvent.controller().value();
      vitesse = val;
    }
  }
}

void draw() {
  background(#000964);
  float x = 0;
  while (x < 60) {
    float y = 0;
    while (y < 65) { 
      draw_rotating_circle(x*10, y*8, 2, (rot + x + y)/2);
      y = y + 1;
    }
    x = x + 1;
  }
  rot = rot + vitesse;
}


