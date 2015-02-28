
// Created by Woon Hua Ye
// Arch 6509 Beyond Measurement: Generative Modeling in Architecture and Urbanism
// Department of Architecture, AAP, Cornell University


void setup () {
  noLoop();
  size (1000, 400); 
  background(255);
  strokeCap(PROJECT);
  strokeWeight(2);
  line (0, 200, 1000, 200);
}

void draw () {
  strokeWeight(2);
}

void mousePressed () {
  translate (mouseX, 200);
  road (mouseY-200, 2);
}

void road (float rLen, int rDep) {
  line (0, 0, rLen, 0);
  fill (random (0, 255), random(0, 255), random(0, 255));
  rect (rLen, 0, 5, 5);
  if (rDep>0) {
    rLen = rLen*random(0.2, 0.8);
    translate (rLen, 0);

    pushMatrix();
    scale(0.8*random(0.7, 1.2));
    translate (rLen*random(0, 0.4), 0);
    rotate (PI/2);
    road (rLen, rDep-1);
    popMatrix();

    pushMatrix();
    scale(0.8*random(0.7, 1.2));
    translate (rLen*random(-0.4, 0), 0);
    rotate (PI/2);
    road (rLen, rDep-1);
    popMatrix();

    pushMatrix();
    scale(0.8*random(0.7, 1.2));
    translate (rLen*random(-0.5, 0.5), 0);
    rotate (-PI/2);
    road (rLen, rDep-1);
    popMatrix();
  }
}

void mouseReleased() {
  redraw();
}



