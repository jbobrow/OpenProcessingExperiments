
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

import processing.opengl.*;

PeasyCam cam;

float n1 = 0.1;
float n2 = 0.1;

void setup() {
  size(800,800, OPENGL); 
  cam = new PeasyCam(this, 300);
}

void keyPressed() {
  if(key=='a') n1+=0.1;
  if(key=='A') n1-=0.1;

  if(key=='s') n2+=0.1;
  if(key=='S') n2-=0.1;
}

void draw() {
  background(0);

  lights();
  fill(200);
  stroke(0,0,200, 10);

  drawSuperAwesomeEllipsoid();
}

void drawSuperAwesomeEllipsoid() {
  PVector p;
  beginShape(QUAD_STRIP);
  for(float u=-HALF_PI; u<HALF_PI; u+=0.08) {
    for(float v=-PI; v<PI; v+=0.08) {

      p = evaluate(u, v);
      vertex(p.x,p.y,p.z);

      p = evaluate(u, v+0.1);
      vertex(p.x,p.y,p.z);

      p = evaluate(u+0.1, v);
      vertex(p.x,p.y,p.z);

      p = evaluate(u+0.1, v+0.1);
      vertex(p.x,p.y,p.z);
    }
  }
  endShape();
}

int sign(float x) {
  return x>0 ? 1 : -1;
}

PVector evaluate(float u, float v) {
  float cosU = cos(u);
  float sinU = sin(u);
  float cosV = cos(v);
  float sinV = sin(v);  

  float t = sign(cosU) * (float) Math.pow(abs(cosU), n1);


  // here is black magick from http://local.wasp.uwa.edu.au/~pbourke/geometry/superellipse/
  float x = 50 * t * sign(cosV) * (float) Math.pow(abs(cosV), n2);
  float y = 50 * sign(sinU) * (float) Math.pow(abs(sinU), n1);
  float z = 50 * t * sign(sinV) * (float) Math.pow(abs(sinV), n2);

  return new PVector(x,y,z);
}




