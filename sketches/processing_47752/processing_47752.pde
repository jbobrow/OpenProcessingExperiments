
import wblut.processing.*;
import wblut.hemesh.creators.*;
import wblut.hemesh.core.*;
import processing.opengl.*;

HE_Mesh mesh;
WB_Render render;

float lfoX;
float lfoY;
int rotation = 1;
int pointR = 100;
int pointG = 100;
int pointB = 100;

void setup() {
  size(800, 600, OPENGL);
  //size(screen.width, screen.height, OPENGL);
  smooth();
  
  float[][] values=new float[12][12];
  for (int j = 0; j < 12; j++) {
    for (int i = 0; i < 12; i++) {
      values[i][j]=200*noise(0.35*i, 0.35*j);
    }
  }
  
  HEC_Grid creator=new HEC_Grid();
  creator.setU(11);
  creator.setV(10);
  creator.setUSize(400);
  creator.setVSize(400);
  creator.setWValues(values);  //DISPLACEMENT OF GRID POINTS (W VALUE)
  mesh=new HE_Mesh(creator);
  render=new WB_Render(this);
}

void draw() {
  //PRESS R,G,B KEYS TO CHANGE POINT LIGHT COLOR
  if(keyPressed) {
    if (key == 'r' || key == 'R') {
      pointR = 255;
    }
  } else {
    pointR = 100;
  }
  if(keyPressed) {
    if (key == 'g' || key == 'G') {
      pointG = 255;
    }
  } else {
    pointG = 100;
  }
  if(keyPressed) {
    if (key == 'b' || key == 'B') {
      pointB = 255;
    }
  } else {
    pointB = 100;
  }
  background(255);
  pointLight(pointR, pointG, pointB, 35, 40, 36);
  directionalLight(126, 126, 126, 0, 0, -1);
  ambientLight(102, 102, 102);
  
  lfoY = lfoY + rotation;
  lfoX = lfoX + 0.1;
  translate(width/2, height/2, 0);
  rotateY(lfoY/width*TWO_PI);
  rotateX(lfoX/height*TWO_PI);
  noStroke();
  render.drawFaces(mesh);
  stroke(0);
  //render.drawEdges(mesh);
}

//CLICK TO CHANGE DIRECTION OF ROTATION
void mouseClicked() {  //COULD THIS BE SPACEBAR INSTEAD?
  if(rotation == 1) {
    rotation = -1;
  } else {
    rotation = 1;
  }
}

