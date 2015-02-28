
// Oliver Haimson
// Embedded iteration
// Copyright 2012

//import processing.pdf.*;

void setup() {
  size(700, 700);
  smooth();
  //beginRecord(PDF, "Assignment 05B.pdf");
}

void draw() {
  background(30);
  strokeJoin(ROUND);
  for (int i=0; i<width; i+=20) {
    for (int j=0; j<height; j+=20) {
      float rd = map(i, 1, width, 255, 0);
      float bl = map(j, 1, height, 255, 0);
      float gr = random(80, 100);
      fill(rd, gr, bl);
      stroke(rd, gr, bl);
      if (i%40==0) {
        // set stroke weight to draw star borders
        strokeWeight(2);
      }
      if (i%40!=0) {
        // turn off border for stars, draw triangles behind stars
        noStroke();
        triangle(i+5, j+3, i+19, j, i+18, j+14);
      }
      if (j%40==0) {
        // draw circle behind stars
        ellipse(i+10, j+10, 18, 18);
      }
      fill(30);
      beginShape();
      vertex(i+10, j+2);
      vertex(i+13, j+7);
      vertex(i+22, j+6);
      vertex(i+14, j+12);
      vertex(i+15, j+17);
      vertex(i+10, j+15);
      vertex(i+5, j+25);
      vertex(i+6, j+11);
      vertex(i+3, j+7);
      vertex(i+7, j+7);
      vertex(i+10, j+2);
      endShape();
    }
  }
  noLoop();
  //endRecord();
}


