
int grid = 45;
float H=0;
int S =80;
int B =80;

void setup() {
  size(600, 600);
  colorMode(HSB, 360,100,100,1.0);
  rectMode(CENTER);
  smooth();
}

void draw() {
  H= map(mouseY, 0, height, 0, 360);
  background(0);
  for (int x=grid; x<=width-grid; x+=grid) {
    for (int y=grid; y<=height-grid-10; y+=grid-10) {
      for (int i=10; i>0; i--) {
        noStroke();
        fill(H+i*15, S, B);
        rect(x, y, 27, 30, 2);
      }
    }
  }

  //  for (int x2=grid; x2<=width-grid-60; x2+=grid) {
  //    for (int y2=grid-30; y2<=height-grid; y2+=grid-30) {
  //      noStroke();
  //      fill(237, 214, 120);
  //      rect(x2+40, y2+5, 31, 29, 3);
  //    }
  //  }
}

void mousePressed() {//when mouse is pressed the sketch redraws
  if (mousePressed == true) {//when mouse is pressed count is reset to draw over sketch
    setup();
  }
}



