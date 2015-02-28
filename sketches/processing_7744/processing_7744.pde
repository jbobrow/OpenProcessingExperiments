
import picking.*;

Picker picker;
float a = 0.0;

void setup() {
  size(200, 150, P3D);
  smooth();
  picker = new Picker(this);
}

void draw() {
  
  background(255);
  a += 0.01;
  
  lights();
  stroke(0);
  
  picker.start(0);
  pushMatrix();
    translate(80, 75);
    rotateX(a); rotateY(a);
    fill(#ff8800);
    box(50);
  popMatrix();
  
  picker.start(1);
  pushMatrix();
    translate(140, 75);
    rotateX(a); rotateY(a);
    fill(#eeee00);
    box(20);
  popMatrix();
  
  picker.stop();
  
  int id = picker.get(mouseX, mouseY);
  switch (id) {
    case -1: // no object
      fill(0); break;
    case 0:
      fill(#ff8800); break;
    case 1:
      fill(#eeee00); break;
    default:
      noFill(); break;
  }
  noStroke();
  rect(0,   0, width, 10);
  rect(0, 140, width, 10);
  rect(0,   0, 10, height);
  rect(190, 0, 10, height);
  
}


