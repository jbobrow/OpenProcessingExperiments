
// Homework 9
// 51-757 Computing for the Arts with Processing
// October 6, 2011
// Copyright Molly Nix October 2011 Pittsburgh, PA 15232

// COLOR VARIABLES
color beige = color(249, 246, 236);
color darkbeige = color(228, 222, 212);
color lightpurple = color(134, 90, 131);
color darkpurple = color(80, 64, 103);
color lightpink = color(211, 152, 145);
color lightmuave = color (183, 136, 135);
color medmuave = color(163, 125, 119);
color darkmuave = color(130, 107, 103);

float cubeSize;

void setup() 
{
  size(400, 400, P3D);
  smooth();
  cubeSize = width/6;
}

void draw() 
{
  background(beige);
  lights();
  directionalLight(102, 102, 102, 0, 1, -1);
  lightSpecular(102, 102, 102);
  drawBackground();
  pushMatrix();
  drawSphereInCube(cubeSize, cubeSize, cubeSize, width/2, height/2, 0);
  fill(darkbeige);
  text("CUBE ONE", 0, 0);
  drawSphereInCube(cubeSize, cubeSize, cubeSize, cubeSize, 0, 0);
  fill(lightpink);
  text("CUBE TWO", 0, 0);
  drawSphereInCube(cubeSize, cubeSize, cubeSize, -cubeSize, 0, 0);
  fill(lightmuave);
  text("CUBE THREE", 0, 0);
  drawSphereInCube(cubeSize, cubeSize, cubeSize, 0, cubeSize, 0);
  fill(medmuave);
  text("CUBE FOUR", 0, 0);
  drawSphereInCube(cubeSize, cubeSize, cubeSize, 0, -cubeSize, 0);
  fill(darkmuave);
  text("CUBE FIVE", 0, 0);
  drawSphereInCube(cubeSize, cubeSize, cubeSize, 0, 0, cubeSize);
  fill(lightpurple);
  text("CUBE SIX", 0, 0);
  drawSphereInCube(cubeSize, cubeSize, cubeSize, 0, 0, -cubeSize);
  fill(darkpurple);
  text("CUBE SEVEN", 0, 0);
  popMatrix();
}


void drawSphereInCube(float cubeWidth, float cubeHeight, float cubeDepth, float translationX, float translationY, float translationZ) 
{
  noStroke();
  translate(translationX, translationY, translationZ);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  fill(134-((mouseX/4)*.01*54), 90-((mouseX/4)*.01*26), 131-((mouseX/4)*.01*28));
  sphereDetail(mouseX / 20);
  sphere((cubeWidth*.4*(mouseX/4)*.01)+5);
  fill(lightpink, 70);
  box(cubeWidth, cubeHeight, cubeDepth);
}

void drawBackground() {
  stroke(darkbeige);
  strokeWeight(.75);
  for (int i = 0; i < width*2; i = i+5) {
    line(0, i, i, 0);
  }
}


