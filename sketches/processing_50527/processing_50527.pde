


void setup() {
  size(800, 640);
  background(220, 12, 229);
  for (int i = 0; i < 41; i++) {
    pushMatrix();
    translate(i*20, 0);
    figure();
    figure1();
    figure2();
    for (int j = 0; j < 41; j++) {
      pushMatrix();
      translate(0, j*16);
      figure();
      figure1();
      figure2();
      popMatrix();
    }
    popMatrix();
  }
}

void draw() {
  int trans1 = int(random(21));
  int trans2 = int(random(17));
  for (int i = 0; i < 81; i++) {
    pushMatrix();
    //translate(i*20, 0);
    translate(i*trans1, 0); //to randomize, make it more glitchy
    rotate((-radians(frameCount))%(PI/3));
    figure();
    //translate(i*20, 0);
    translate(i*trans1, 0); //to randomize, make it more glitchy
    rotate((radians(frameCount))%(PI/3));
    figure1();
    //translate(i*20, 0);
    translate(i*trans1, 0); //to randomize, make it more glitchy
    rotate((radians(frameCount))%(PI/3));
    figure2();
    for (int j = 0; j < 81; j++) {
      pushMatrix();
      //translate(0, j*16);
      translate(0, j*trans2); //to randomize, make it even MORE glitchy
      figure();
      //translate(0, j*16);
      translate(0, j*trans2); //to randomize, make it even MORE glitchy
      figure1();
      //translate(0, j*16);
      translate(0, j*trans2); //to randomize, make it even MORE glitchy
      figure2();
      popMatrix();
    }
    popMatrix();
  }
}

void figure() {
  stroke(0);
  fill(11, 185, 227);
  beginShape();
  vertex(8, 0);
  vertex(14, 4);
  vertex(10, 4);
  vertex(14, 10);
  vertex(6, 6);
  vertex(0, 8);
  endShape(CLOSE);
}

void figure1() {
  stroke(0);
  fill(234, 17, 35);
  beginShape();
  vertex(14, 0);
  vertex(18, 4);
  vertex(16, 8);
  vertex(14, 6);
  vertex(14, 2);
  endShape(CLOSE);
}

void figure2() {
  stroke(0);
  fill(0, 245, 32);
  beginShape();
  vertex(6, 8);
  vertex(12, 12);
  vertex(18, 10);
  vertex(18, 12);
  vertex(8, 14);
  endShape(CLOSE);
}

