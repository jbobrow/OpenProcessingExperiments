
// Created by Woon Hyun Bae
// Arch 6509 Beyond Measurement: Generative Modeling in Architecture and Urbanism
// Department of Architecture, AAP, Cornell University


void setup() {
  size (500, 500);
  smooth();
  background(255);
}


void draw () {
  // base grid, black represents square blocks ready to be cut
  noStroke();
  for (int x=0;  x < width; x=x+40) {
    for (int y=0; y < height; y=y+40) {
      fill(0);
      rect (x, y, 34, 34);
      rectMode(CENTER);

      // adding offset squares in white in the center of black, representing voids within barcelona blocks
      if (mousePressed) {
        noStroke();
        fill(255);
        rect(x, y, 18, 18);
      }
    }
  }

  // diamonds in white cutting away at black squares, transforms squares to octagons to diamonds
  float d;
  fill(255);
  noStroke();
  // cutting diamonds respond to cursor - further away from cursor, the smaller it becomes
  for (int x=20; x<=width; x+=40) {
    for (int y=20; y<=height; y+=40) {
      d=36-(dist(x, y, mouseX, mouseY)*.075);
      if (d<=0) {
        d=0;
      }
      pushMatrix();

      translate(x, y);
      rotate(PI*.25);
      rect(0, 0, d, d);

      popMatrix();
    }
  }
}


