
int numRect = 0;
float x = 100;
float y = 100;
float moved = 200.0;
float rot = PI/4;

float[] rectXps = new float[0];
float[] rectYps = new float[0];
float[] yOffset = new float[0];
float[] rotation = new float[0];

void setup() {
  size(700, 400);
  background(0);
  noStroke();
  fill(255, 50);
  smooth();
}

void draw() {

  int i = 0;
  background(0);
  while (i < numRect) {
    rectMode(CENTER);
    if (i<numRect-1) {
      pushMatrix();
      translate((rectXps[i]+((mouseX-width/2)+pmouseX/2)*(rectYps[i]/moved)), rectYps[i]+sin((frameCount+rectYps[i])/50.0)*100);
      rotate(rotation[i]);
      rect(0, 0, (rectYps[i]/2.0), (rectYps[i]/2.0));
      popMatrix();
    }
    else {
      pushMatrix();
      translate(rectXps[i], rectYps[i]+sin((frameCount+rectYps[i])/50.0)*100);
      rotate(rotation[i]);
      rect(0, 0, (rectYps[i]/2.0), (rectYps[i]/2.0));
      popMatrix();
    }
    //    rectXps[i] = rectXps[i];
    rotation[i] = rotation[i]+0.1;
    i=i+1;
  }
}

void mousePressed() {
  numRect = numRect + 1;

  rectXps = expand(rectXps, numRect);
  rectYps = expand(rectYps, numRect);
  yOffset = expand(yOffset, numRect);
  rotation = expand(rotation, numRect);

  rectXps[numRect-1] = mouseX;
  rectYps[numRect-1] = mouseY;
  yOffset[numRect-1] = random(100);
  rotation [numRect-1] = random(rot);
}

//void mouseMoved() {
//  int i = 0;
//  while (i < numRect) {
//
//    i=i+1;
//  }
//}

