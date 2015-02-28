
//***************************//
//*****//Adam Lastowka//*****//
//***************************//

import processing.opengl.*;

APoint[] points = new APoint[100000];

float theta;
float phi;
float r;

float globalX;
float globalY;
float globalZ;

float xPlus;
float yPlus;
float zPlus;

float zoom = 0.3;
float rotX;
float rotY;
float rotXV;
float rotYV;
float t;

boolean prevMousePressed;
float baseMX;
float baseMY;

float amplitude = 600;
float frequency = 400;

void setup() {
  size(600, 500, P3D);
  refresh();
  colorMode(HSB);
}

void draw() {
  background(255);
  scale(zoom);
  translate(width/2/zoom, height/2/zoom);
  rotateY(map(rotY,0,width,-PI,PI));
  rotateX(map(rotX,0,height,-PI,PI));
  for(int i = 0; i < points.length; i++) {
    point(points[i].x, points[i].y, points[i].z);
  }
  rotXV += noise(t)-0.5;
  rotYV += noise(-t)-0.5;
  rotX += rotXV;
  rotY += rotYV;
  rotXV /= 1.1;
  rotYV /= 1.1;
  t+=0.05;
}

void keyPressed() {
  refresh();
}

void refresh() {
  xPlus = random(243845);
  yPlus = random(243845);
  zPlus = random(243845);
  amplitude = random(0, 2000);
  frequency = random(4);
  for(int i = 0; i < points.length; i++) {
    theta = random(TWO_PI);
    phi = random(TWO_PI);
    r = 500;
    globalX = r*(sin(theta)*cos(phi));
    globalY = r*(sin(theta)*sin(phi));
    globalZ = r*cos(theta);
    r += amplitude*(noise(globalX*frequency/500+xPlus, globalY*frequency/500+yPlus, globalZ*frequency/500+zPlus)-0.5)/2;
    globalX = r*(sin(theta)*cos(phi));
    globalY = r*(sin(theta)*sin(phi));
    globalZ = r*cos(theta);
    points[i] = new APoint(globalX, globalY, globalZ);
  }
}

class APoint {
  float x;
  float y;
  float z;
  public APoint(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}

