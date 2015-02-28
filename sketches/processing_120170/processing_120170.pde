
//Kairavi Chahal | kchahal
//Homework 9 | November 5, 2013
 
//Copyright Kairavi Chahal | 2013 | Carnegie Mellon University
//All rights reserved.

final int N = 250;

int[] x, y, z, dy; //position arrays
float[] drx, dry, drz, rx, ry, rz; //rotation arrays
color[] col;
color bg = #FFFFFF;

int side = 20; //tetrahedron size
//vertices of tetrahedron
float[] v1 = new float[3]; 
float[] v2 = new float[3];
float[] v3 = new float[3];
float[] v4 = new float[3];

int w = 720; int h = 450;

void setup() {
  size(w, h, P3D);
  background(bg);
  
  x = initArray(-w/2, w/2);
  y = initArray(-h/2, h/2);
  z = initArray(0, w/3);

  dy = initArray(-2, -1);

  rx = initFlArray(0, 0);
  ry = initFlArray(0, 0);
  rz = initFlArray(0, 0);

  drx = initFlArray(-1, 1);
  dry = initFlArray(-1, 1);
  drz = initFlArray(-1, 1);
  
  col = initColArray();
  
  v1[0] = 0.5*side; v1[1] = 0; v1[2] = -side/(2*sqrt(2));
  v2[0] = -0.5*side; v2[1] = 0; v2[2] = -side/(2*sqrt(2));;
  v3[0] = 0; v3[1] = 0.5*side; v3[2] = side/(2*sqrt(2));;
  v4[0] = 0; v4[1] = -0.5*side; v4[2] = side/(2*sqrt(2));;
}

void draw() {
  background(bg);
  //directionalLight(150, 150, 150, 0, 1, -1);
  //directionalLight(255, 255, 255, 0, 0, -1);
  for (int i=0; i<N; i++) {
    moveFig(x, y, z, dy, i);
    rotateFig(rx, ry, rz, drx, dry, drz, i);
    drawFig(x[i], y[i], z[i], rx[i], ry[i], rz[i], col[i]);
  }
}

void moveFig(int[] x, int[] y, int[] z, int[] dy, int i) { 
  if (screenY(x[i], y[i], z[i]) < screenY(x[i], -h/2, z[i])) {
    y[i] = int(screenY(x[i], h/2, z[i]) + random(h/2));
  }
  y[i] += dy[i];
}

void rotateFig(float[] rx, float[] ry, float[] rz, float[] drx, float[] dry, float[] drz, int i) {
  rx[i] += drx[i];
  ry[i] += dry[i];
  rz[i] += drz[i];
}

void drawFig(int xpos, int ypos, int zpos, float rotx, float roty, float rotz, color col) {
  pushMatrix();
    translate(w/2, h/2, 0);
    translate(xpos, ypos, zpos);
    rotateX(radians(rotx));
    rotateY(radians(roty));
    rotateZ(radians(rotz));
    fill(col/*or(mouseX, mouseX-mouseY, mouseY)*/);
    tetrahedron();
  popMatrix();
}

void tetrahedron() {
  beginShape(TRIANGLES);
    vertex(v1[0], v1[1], v1[2]);
    vertex(v2[0], v2[1], v2[2]);
    vertex(v3[0], v3[1], v3[2]);
  endShape();
  beginShape(TRIANGLES);
    vertex(v1[0], v1[1], v1[2]);
    vertex(v2[0], v2[1], v2[2]);
    vertex(v4[0], v4[1], v4[2]);
  endShape();
  beginShape(TRIANGLES);
    vertex(v1[0], v1[1], v1[2]);
    vertex(v3[0], v3[1], v3[2]);
    vertex(v4[0], v4[1], v4[2]);    
  endShape();
  beginShape(TRIANGLES);
    vertex(v2[0], v2[1], v2[2]);
    vertex(v3[0], v3[1], v3[2]);
    vertex(v4[0], v4[1], v4[2]);    
  endShape();
}

int[] initArray(int a, int b) {
  int[] arr = new int[N];
  for (int i=0; i<arr.length; i++) {
    arr[i] = int(random(a, b));
  }
  return arr;
}

float[] initFlArray(float a, float b) {
  float[] arr = new float[N];
  for (int i=0; i<arr.length; i++) {
    arr[i] = random(a, b);
  }
  return arr;
}

color[] initColArray() {
  color[] arr = new color[N];
  for (int i=0; i<arr.length; i++) {
    arr[i] = color(int(random(255)), int(random(255)), int(random(255))/*, int(random(60, 80))*/);
  }
  return arr;
}


