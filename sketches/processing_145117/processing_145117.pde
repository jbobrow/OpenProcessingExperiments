
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI Seung-hwan
// ID: 201420112

float tx = 200;
float ty = 100;
float xs = 3;
float ys = 2;

float angle;

void setup() {
  smooth();
  size(600, 600);
}

void draw() {

  background(255);
  angle+=0.045;

  // figure #1

  ty=ty+ys;

  noStroke();

  fill(#4253A7, 135);
  triangle(0, 0, 0, 400, width*0.3, ty);

  fill(#637638, 135);
  triangle(0, 0, 400, 0, width*0.3, ty);

  fill(#896A3B, 135);
  quad(0, 400, 0, height, 100, height, width*0.3, ty);

  fill(#3B6189, 135);
  quad(100, height, width, height, width, 200, width*0.3, ty);

  fill(#554523, 135);
  quad(400, 0, width, 0, width, 200, width*0.3, ty);

  if ((ty<0) || (ty>height)) {
    ys = ys * -1;
  }

  // figure #2

  tx=tx+xs;

  fill(200, 135);
  quad(400, 0, width, 0, width, 200, tx, height*3/4);

  fill(200, 135);
  triangle(width, 200, width, 550, tx, height*3/4);

  fill(#467886, 135);
  quad(width, 550, width, height, 100, height, tx, height*3/4);

  fill(#9B8151, 135);
  quad(100, height, 0, height, 0, 400, tx, height*3/4);

  fill(#51949B, 135);
  quad(0, 0, 0, 400, tx, height*3/4, 400, 0);

  if ((tx<0) || (tx>width)) {
    xs = xs * -1;
  }

  // figure #3

  fill(#467886, 135);
  quad(200, 0, width, 0, width, 150, tx, ty);

  fill(#51949B, 135);
  quad(0, 150, 0, 0, 200, 0, tx, ty);

  fill(#9B8151, 135);
  triangle(0, 500, 0, 150, tx, ty);

  fill(#51949B, 135);
  quad(0, 500, 0, height, 400, height, tx, ty);

  fill(#637638, 135);
  quad(400, height, width, height, width, 150, tx, ty);

  // elllipse

  strokeWeight(5);
  stroke(210);
  noFill();

  pushMatrix();
  translate(width*2/3, height*2/3);
  rotate(angle);
  ellipse(150, 150, 350, 350);
  popMatrix();

  pushMatrix();
  translate(width*3/4, height*2/3);
  rotate(-angle*1.5);
  ellipse(50, -50, 200, 200);
  popMatrix();

  pushMatrix();
  translate(width*0.3, height*0.133);
  rotate(-angle);
  ellipse(30, 30, 250, 250);
  ellipse(120, 120, 120, 120);
  popMatrix();

  pushMatrix();
  translate(width*0.3, height*0.133);
  rotate(angle*2);
  ellipse(40, 40, 150, 150);
  popMatrix();

  pushMatrix();
  translate(width*2/3, height/3);
  rotate(angle);
  ellipse(50, 50, 200, 200);
  popMatrix();

  pushMatrix();
  translate(width/3, height*2/3);
  rotate(-angle/1.5);
  ellipse(150, 150, 200, 200);
  popMatrix();
}

