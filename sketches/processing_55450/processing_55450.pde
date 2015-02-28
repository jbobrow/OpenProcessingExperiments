
/*
  Sketch by Sergei Sokolov
 www.sergeisokolov.com
 hello@sergeisokolov.com
 */

import processing.opengl.*;
float H;
color BG = color(197, 204, 199);
color FL = color(197, 204, 199, 34);
color ST = color(84, 83, 31);
color FL2 = color(150, 155, 143);
PVector inertia;
float inertiaK = 20; // the more the slower is response and post-effect

void setup() {
  size(800, 450);

  inertia = new PVector(width/2, height/2);
  println(mouseX+":"+mouseY);
  background(BG);
  smooth();
  //noLoop();
};

void draw() 
{
  fill(FL);
  noStroke();
  rect(0, 0, width, height);//fade background

  if(mouseX==0 && mouseY==0) {
    inertia.x += (width/2 - inertia.x) / inertiaK;
    inertia.y += (height/2 - inertia.y) / inertiaK;
  } else {
    inertia.x += (mouseX - inertia.x) / inertiaK;
    inertia.y += (mouseY - inertia.y) / inertiaK;  }


  stroke(ST);
  H = 380.*inertia.y/height;
  zabor(80, 430, 200, H, 600, H, 720, 430, 50);
}


void zabor(float Ax, float Ay, float ACx, float ACy, float BCx, float BCy, float Bx, float By, float steps) {
  float x, y;
  float xA, yA, xB, yB;
  float xC, yC, alphaC, rC = 70;
  float delta=1/(2*(steps+1));
  float noiseSmooth = 200, nois;
  fill(FL2);
  beginShape();
  vertex(Ax, Ay);
  bezierVertex(ACx, ACy, BCx, BCy, Bx, By);
  endShape();
  noFill();
  for (float i=0; i<=1; i+=1/(steps+1)) {
    x  = bezierPoint(Ax, ACx, BCx, Bx, i);
    y  = bezierPoint(Ay, ACy, BCy, By, i);
    xA = bezierPoint(Ax, ACx, BCx, Bx, i-delta);
    yA = bezierPoint(Ay, ACy, BCy, By, i-delta);
    xB = bezierPoint(Ax, ACx, BCx, Bx, i+delta);
    yB = bezierPoint(Ay, ACy, BCy, By, i+delta);

    alphaC = atan((xB-xA)/(yB-yA));
    if (yA<yB) alphaC+=PI;
    nois = noise(x/inertia.x, y/inertia.x);
    xC = x-nois*rC*cos(alphaC);
    yC = y-nois*rC*sin(-alphaC);
    line(x, y, xC, yC);
    volos(xC, yC, PI+alphaC, rC*nois);
  }
}

void volos(float x, float y, float angle, float R) {
  int iter = 7;
  float maxDev = PI/2;  // max angle deviation
  float devAngle;
  float kControl = 1- .618;
  float noiseSmooth = 500;
  float fade = 0.8;
  float newAngle, Ax, Ay, Cx, Cy, CAx, CAy;
  for (int i=0; i<iter; i++) {
    devAngle = (noise(x/inertia.x, y/inertia.x)-.5)*maxDev;
    newAngle = angle - devAngle;
    Ax = x + R*cos(newAngle);
    Ay = y - R*sin(newAngle);
    Cx = x + kControl*R*cos(angle);
    Cy = y - kControl*R*sin(angle);
    CAx = Ax - kControl*R*cos(devAngle-newAngle);
    CAy = Ay - kControl*R*sin(devAngle-newAngle);
    noFill();
    beginShape();
    vertex(x, y);
    bezierVertex(Cx, Cy, CAx, CAy, Ax, Ay);
    endShape();
    x = Ax;
    y = Ay;
    angle = newAngle - devAngle;
    R *= fade;
    maxDev *= 1.2;
  }
  fill(BG);
  ellipse(x, y, 5, 5);
}


