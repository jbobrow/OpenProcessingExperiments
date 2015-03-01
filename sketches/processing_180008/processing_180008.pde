
/*
    Andor Salga
    April 2014
    Torus
*/

float detail = 30;

float maxSize = 100;
float f = 0;

void setup(){
  size(400, 400, P3D);
  noFill();
  strokeWeight(1);
}

void draw(){
  background(0);
  stroke(255);
  
  translate(width/2, height/2);
  rotateX(PI/5.0f);
  rotateY(PI/5.0f);
  
  for (float i = f; i < TWO_PI+f; i+= TWO_PI / detail) {
    pushMatrix();
    translate(0, 0, cos(i) * 50.0f);
    stroke(max(20 + cos(i) * 150,0));
    ellipse(0, 0, maxSize*2.0f + sin(i) * maxSize, maxSize*2.0f + sin(i) * maxSize);
    popMatrix();
  }
  f+= 0.01f;
}

