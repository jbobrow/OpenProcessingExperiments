
/**
* just a small test, trying to distort a thoroid - to not much avail yet. Press some buttons. Most interesting is the y-axis-distortion ('2','w','s','x')
*
*/

import processing.opengl.*;
import peasy.*;

PeasyCam cam;

int uRes = 32, vRes = 32;
PVector[][] vertices = new PVector[uRes][vRes]; 
float r0 = 200f, r1 = 100f;
float[] lambdaMult, lambdaAdd, muMult, muAdd;

void setup() {
  size(800, 600, OPENGL);
  cam = new PeasyCam(this, 800);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);
  lambdaMult = new float[3];
  lambdaAdd = new float[3];
  muMult = new float[3];
  muAdd = new float[3];
  initVertices(r0, r1);
}

void draw() {
  background(0);
  //translate(width/2,height/2);
  noStroke();
  fill(127, 127);
  displayVertices();
}

void initVertices(float r0, float r1) {
  for (int i = 0; i < uRes; i++) {
    for (int j = 0; j < vRes; j++) {
      float lambda = i/float(uRes-1)*TWO_PI;
      float mu = j/float(vRes-1)*TWO_PI;
      float x = cos(lambda)*(r0 + cos(mu)*r1);
      float y = sin(mu)*r1;
      float z = sin(lambda)*(r0 + cos(mu)*r1);
      x*= cos(lambda*lambdaMult[0] + lambdaAdd[0])*cos(mu*muMult[0] + muAdd[0]);
      y*= cos(lambda*lambdaMult[1] + lambdaAdd[1])*cos(mu*muMult[1] + muAdd[1]);
      z*= cos(lambda*lambdaMult[2] + lambdaAdd[2])*cos(mu*muMult[2] + muAdd[2]);
      vertices[i][j] = new PVector(x, y, z);
    }
  }
}

void displayVertices() {
  for (int i = 0; i < uRes; i++) {
    for (int j = 0; j < vRes; j++) {
      int ii = (i)%uRes;
      int jj = (j)%vRes;
      int iii = (i+1)%uRes;
      int jjj = (j+1)%vRes;
      if (j%2 == i%2 ) {
        fill(127, 0, 192);
      } 
      else {
        fill(255);
      }
      beginShape(QUADS);
      vertex(vertices[ii][jj]);
      vertex(vertices[iii][jj]);
      vertex(vertices[iii][jjj]);
      vertex(vertices[ii][jjj]);
      endShape(CLOSE);
    }
  }
}

void vertex(PVector v) {
  vertex(v.x, v.y, v.z);
}

void keyPressed() {
  double inc = TWO_PI/6.0;
  switch(key) {
  case '1':
    lambdaMult[0] += inc;
    break;
  case 'q':
    lambdaMult[0] -= inc;
    break;
  case '2':
    lambdaMult[1] += inc;
    break;
  case 'w':
    lambdaMult[1] -= inc;
    break;
  case '3':
    lambdaMult[2] += inc;
    break;
  case 'e':
    lambdaMult[2] -= inc;
    break;
  case '4':
    lambdaAdd[0] += inc;
    break;
  case 'r':
    lambdaAdd[0] -= inc;
    break;
  case '5':
    lambdaAdd[1] += inc;
    break;
  case 't':
    lambdaAdd[1] -= inc;
    break;
  case '6':
    lambdaAdd[2] += inc;
    break;
  case 'z':
    lambdaAdd[2] -= inc;
    break;
  case 'a':
    muMult[0] += inc;
    break;
  case 'y':
    muMult[0] -= inc;
    break;
  case 's':
    muMult[1] += inc;
    break;
  case 'x':
    muMult[1] -= inc;
    break;
  case 'd':
    muMult[2] += inc;
    break;
  case 'c':
    muMult[2] -= inc;
    break;
  case 'f':
    muAdd[0] += inc;
    break;
  case 'v':
    muAdd[0] -= inc;
    break;
  case 'g':
    muAdd[1] += inc;
    break;
  case 'b':
    muAdd[1] -= inc;
    break;
  case 'h':
    muAdd[2] += inc;
    break;
  case 'n':
    muAdd[2] -= inc;
    break;
  case ' ':
    for (int i = 0; i < 3; i++) {
      lambdaAdd[i] = 0;
      lambdaMult[i] = 0;
      muAdd[i] = 0;
      muMult[i] = 0;
    }
    break;
  }
  initVertices(r0, r1);
}


