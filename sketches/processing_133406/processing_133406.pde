
void setup() {
  noStroke();
  size(600, 600);
  background(0, 0, 100);
  for (int i = 0; i < 10; i++) {
    pushMatrix();
    translate(i*10, 0);
    figure();
    for (int j = 0; j < 10; j++) {
      pushMatrix();
      translate(0, j*10);
      figure();
      figure1();
      figure2();
    }
  }
}
 
void draw() {
  int trans1 = int(random(100));
  int trans2 = int(random(100));
  for (int i = 0; i < 50; i++) {
    pushMatrix();
    translate(i*10, 0);
    translate(i*trans1, 0);
    rotate((-radians(frameCount))%(PI/3));
    figure();
    translate(i*10, 0);
    translate(i*trans1, 0);
    rotate((radians(frameCount))%(PI/3));
    figure1();
    translate(i*10, 0);
    translate(i*trans1, 0);
    rotate((radians(frameCount))%(PI/3));
    figure2();
    for (int j = 0; j < 10; j++) {
      pushMatrix();
      translate(0, j*10);
      translate(0, j*trans2);
      figure();
      translate(0, j*10);
      translate(0, j*trans2);
      figure1();
      translate(0, j*10);
      translate(0, j*trans2);
      figure2();
      popMatrix();
    }
    popMatrix();
  }
}
 
 
void figure() {
  fill(0, 0, 255);
ellipse(-5,-5,4,4);
}

 
void figure1() {
  fill(0, 0, 175);
ellipse(-5,-5,8,8);
}

 
void figure2() {
  fill(0, 0, 100);
ellipse(-5,-5,12,12);
}



