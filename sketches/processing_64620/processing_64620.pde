
/*
ACCD Summer 2012
ID02
Midterm Progress2
Charlene Chen
06/15/2012
*/


PImage img;
PImage H3;
int num = 500;
float[] x = new float[num];
float[] y = new float[num];

float pointWeight;

float leafX;
float leafY;
float leafSize;
int dir;


void setup() {
 size(500, 500);
 smooth();
 
 img = loadImage("june.png");
 H3 = loadImage("H3.png");
 
 for (int i = 0; i < num; i++) {
  x[i] = random(width);
  y[i] = random(height); 
 }
 
 //stroke(random(255));
 
}

void draw() {
 background(255);
 
 pointWeight = map(mouseX, 0, width, 1, 30);
 
 //strokeWeight(pointWeight);
 
 for (int i =0; i < num; i++) {
  color c = H3.get(int(x[i]), int(y[i]));
  
  int ix = int(random(img.width));
  int iy = int(random(img.height));
  color c2 = img.get(ix, iy);
  stroke(c2);
  
  float b = brightness(c) / 255.0;
  float speed = pow(b, 2) + 0.05;
  
  x[i] += speed;
  if (x[i] > width) {
    x[i] = 0;
    y[i] = random(height);
  }
  
  line(x[i], y[i], x[i]+pointWeight, y[i]-pointWeight);

 } 
}

void leaf(int leafX, int leafY, int leafSize, int dir) {
  pushMatrix();
  translate(leafX, leafY);
  scale(leafSize);
  beginShape();
  vertex(1.0*dir, -0.7);
  bezierVertex(1.0*dir, -0.7, 0.4*dir, -1.0, 0.0, 0.0);
  bezierVertex(0.0, 0.0, 1.0*dir, 0.4, 1.0*dir, -0.7);
  endShape();
  popMatrix();
}

