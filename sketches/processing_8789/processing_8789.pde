
//import processing.opengl.*;

import damkjer.ocd.*;

int MIN_RADIUS   = 5;
int MAX_RADIUS   = 30;
int MAX_LINES    = 3000;
int ALPHA1      = 50;
int ALPHA2      = 150;

int depth = 500;
float lastX, lastY, lastZ;

boolean firstTime = true;
boolean bClearBackground = false;

float xOff = 0.0;
float yOff = 0.0;
float zOff = 0.0;
float rot = 0.0;
float rotDelta = 0.01;
int currLine = 0;
int cAlpha = 50;

ArrayList lines, points;


void setup(){
  size(640, 480, P3D);
  smooth();
  background(0);
  
  lines = new ArrayList();
  points = new ArrayList();  
  cAlpha = ALPHA1;
}


void draw() {
  if(bClearBackground){
    background(0);
  }
  
  translate(width/2, height/2, 0);
  rotateX(rot);
  rotateY(rot*1.25);
  rot += rotDelta;
  
  xOff += .01;
  yOff += .02;
  zOff += .03;
  float x = noise(xOff) * width;
  float y = noise(yOff) * height;
  float z = noise(zOff) * depth;
  float x_ = map(x, 0, width, -width/2, width/2);
  float y_ = map(y, 0, height, -height/2, height/2);
  float z_ = map(z, 0, depth, -depth/2, depth/2);
  if(!firstTime){
    if(lines.size() >= MAX_LINES){
      if(currLine >= MAX_LINES)
        currLine = 0;
      Line3D aLine = (Line3D) lines.get(currLine);
      aLine.x1 = lastX;
      aLine.y1 = lastY;
      aLine.z1 = lastZ;
      aLine.x2 = x_;
      aLine.y2 = y_;
      aLine.z2 = z_;
      currLine++;
    }
    else lines.add(new Line3D(lastX, lastY, lastZ, x_, y_, z_));
    if(frameCount % 30 == 0){
      points.add(new PVector(x_, y_, z_));
      println("Points: " + points.size());
      println("Lines: " + lines.size());
    }
  }
  else firstTime = false;
  lastX = x_;
  lastY = y_;
  lastZ = z_;
  
  
  if(bClearBackground) cAlpha = ALPHA2;
  else cAlpha = ALPHA1;
  int cRed, cGreen, cBlue = 0;
  for(int i=0; i<lines.size(); i++){
    cRed = (int) map(i, 0, lines.size(), 255, 0); 
    cGreen = (int) map(i, 0, lines.size(), 0, 255); 
    stroke(cRed, cGreen, cBlue, cAlpha);
    Line3D aLine = (Line3D) lines.get(i);
    aLine.display();
  }

  println("frameRate: " + frameRate);
  println("lines.size(): " + lines.size());
}

void keyPressed(){
  if(key == ' '){
    clear();
  }
  else if(key == 'c' || key == 'C'){
    bClearBackground = !bClearBackground;
  }
}

void clear(){
  lines.clear();
  background(0);
  println("Cleared!");
}

class Line3D{
  float x1, y1, z1, x2, y2, z2;
  
  Line3D(float x1, float y1, float z1, float x2, float y2, float z2){
    this.x1 = x1;
    this.y1 = y1;
    this.z1 = z1;
    this.x2 = x2;
    this.y2 = y2;
    this.z2 = z2;
  }
  
  void display(){
    line(x1, y1, z1, x2, y2, z2);
  }
}

