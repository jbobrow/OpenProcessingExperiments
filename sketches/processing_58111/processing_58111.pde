
// Created by Mi Jin Cho
// Arch 6509 Beyond Measurement: Generative Modeling in Architecture and Urbanism
// Department of Architecture, AAP, Cornell University

float T;   

void setup() {
  size(700, 700);
  smooth();
}

void draw() {
  background(0);
  frameRate(60);
  float a = (mouseX / (float) width) * 180;
  T = radians(a);

  translate(3*width/8, height);

  stroke(255);
  line(0, -320, 0, -400);
  translate(0, -400);
  rotate(PI/4); 
  branch(18);

  stroke(250, 250, 50);
  line(0, 0, 0, -80);
  translate(0, -80);
  rotate(PI/4);
  branch(18);

  stroke(0, 50, 200);
  line(0, 0, 0, -80);
  translate(0, -80);
  rotate(PI/4);
  branch(18);

  stroke(200, 50, 200);
  line(0, 0, 0, -80);
  translate(0, -80);
  rotate(PI/4);
  branch(18);

  stroke(200, 100, 0);
  line(0, 0, 0, -80);
  translate(0, -80);
  rotate(PI/4);
  branch(18);

  stroke(50, 100, 0);
  line(0, 0, 0, -80);
  translate(0, -80);
  rotate(PI/4);
  branch(18);

  stroke(0, 100, 100);
  line(0, 0, 0, -80);
  translate(0, -80);
  rotate(PI/4);
  branch(18);

  stroke(250, 0, 100);
  line(0, 0, 0, -80);
  translate(0, -80);
  rotate(PI/4);
  branch(18);
}

void branch(float h) {

  h *= .6;

  if (h >.2) {
    pushMatrix(); 
    rotate(T); 
    line(0, 0, 0, 13*h);  
    translate(0, 13*h); 
    branch(h);       
    popMatrix();     

    pushMatrix();
    rotate(-T);
    line(0, 0, 0, -16*h/2);
    translate(0, -16*h/2);
    branch(h); 
    popMatrix();
  }
}



