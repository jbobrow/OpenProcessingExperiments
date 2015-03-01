
int grid = 50;
float H=0;
int S =80;
int B =80;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 1.0);
  rectMode(CENTER);
  smooth();
}

void draw() {
  H= map(mouseY, 0, height, 0, 360);
  background(0);
  for (int x=grid; x<=width-grid; x+=grid) {
    for (int y=grid-15; y<=height-grid-10; y+=grid-10) {
      for (int i=10; i>0; i--) {
        noStroke();
        fill(H+i*15, S, B);
        rect(x, y, 23, 26, 3);
      }
    }
  }
  S= map(mouseY, 0, height, 0, 100);
  for (int x2=grid-15; x2<=width-grid-30; x2+=grid) {
    for (int y2=grid-10; y2<=height-grid; y2+=grid-20) {
      for (int i=10; i>0; i--) {
        noStroke();
        fill(H, S+i*10, B);
        rect(x2+40, y2+5, 16, 19, 3);
      }
    }
  }
}

  void mousePressed() {//when mouse is pressed the sketch redraws
    if (mousePressed == true) {//when mouse is pressed count is reset to draw over sketch
      setup();
    }
  }



