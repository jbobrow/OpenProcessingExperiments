
void setup() {
  size(400, 400);
  frameRate(10);
}

/////////////////////////////////////////
void draw() {
  background(0, 220, 220);
  translate(200, 200);

  flake();

  translate(100, 100);
  scale(.5, .5);
}
/////////////////////////////

void flake() {
  //rotate(PI/6);
  int sections=11;
  stroke(0);

  for (int i=0;i<sections;i++) {
    strokeWeight(3);
    stroke(46, 57, 229);
    line(0, 0, 180, 0);
    ellipse(70, 10, 10, 10);
    ellipse(70, -10, 10, 10);
    rotate(2*PI/sections);
    stroke(15, 320, 345);
    ellipse(175, 50, 20, 20);
    stroke(17, 41, 240);
    line(45, 100, 65, 0);
    line(45,-100,65,0);
    line(65,120,85,0);
    line(65,-120,85,0);
  }
}

