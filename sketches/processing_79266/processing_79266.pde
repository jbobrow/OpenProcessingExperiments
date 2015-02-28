
Circle[] c = new Circle[200];
String[] lines;
int index = 1;

void setup() {
  size(800, 600);
  frameRate(12);
  lines = loadStrings("test.txt");
  // construct the circles
  for (int i=0;i<200;i++) {
    c[i] = new Circle();
  }
  int index = 1;
  //for (int index=1; index<lines.length; index++) {
  String[] pieces = split(lines[index], ',');
  for (int i=0;i<pieces.length-1;i++) {
    c[i].r = float(pieces[i]);
  }
}

void draw() {
  background(120);
  // we did a grid to represent the data
  // the data is 179 records, we will make a grid (squares>lines)
  // of 16x12 boxes and draw a circle in each box
  stroke(200);
  fill(100);
  for (int i=0; i<16; i++) {
    for (int j=0; j<12; j++) {
      float w = width/16;
      float x = i*w;
      float y = j*w;
      rect(x, y, w, w);
    }
  }
  fill(50);
  for (int i=0; i<16; i++) {
    for (int j=0; j<12; j++) {
      float w = width/16;
      float x = i*w;
      float y = j*w;
      c[i*12+j].x=x;
      c[i*12+j].y=y;
      c[i*12+j].display();
    }
  }
}

class Circle {
  float x=0;
  float y=0;
  float r=10;

  //constructor
  Circle() {

  }

  void display() {
    ellipse(x, y, 2*r, 2*r);
  }
}
