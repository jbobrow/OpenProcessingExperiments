
//color w = color(255, 255, 255);
//color c = color(252, 244, 71);
//
//
//void setup() {
//  size(100, 100);
//  background(255);
//  smooth();
//  noLoop();
//}
//
//void draw() {
//  fill(w);
//  float wSpace = width/7.0;
//  float hSpace = height/12.0;
//  print(hSpace);
//  for (int x = 0; x < 7; x++) {
//    float xpos = x*wSpace;
//    for (int y = 0; y < 12; y++ ) {
//      float ypos = y*hSpace;
//      pushMatrix();
//      translate(xpos, ypos);
//      noStroke();
//      fill(c, abs((ypos-50)*15));
//      rect(0, 0, wSpace+2, hSpace+2);
//      popMatrix();
//    }
//  }
//}
color w = color(255, 255, 255);
color c = color(252, 244, 71);
Box[][] boxes = new Box[7][12];


void setup() {
  size(500, 500);
  background(255);
//  smooth();
//  noLoop();  
  fill(c);
  stroke(0);
  float wSpace = width/7.0;
  float hSpace = height/12.0;
  print(hSpace);
  for (int x = 0; x < 7; x++) {
    float xpos = x*wSpace;
    for (int y = 0; y < 12; y++ ) {
      float ypos = y*hSpace;
      color cc = color(c, y*12);
      boxes[x][y] = new Box(xpos, ypos, wSpace, hSpace, cc);
    }
  }
}

void draw() {
  float wSpace = width/7.0;
  float hSpace = height/12.0;
  if (mousePressed == true) {
    int xi = int(mouseX/wSpace);
    int yi = int(mouseY/hSpace);
    println(xi);
    boxes[xi][yi].changeColor();
  }
}

//color w = color(255, 255, 255);
//color c = color(252, 244, 71);
//
//
//void setup() {
//  size(500, 500);
//  background(255);
//  smooth();
////  noLoop();  fill(w);
//  float wSpace = width/7.0;
//  float hSpace = height/12.0;
//  print(hSpace);
//  for (int x = 0; x < 7; x++) {
//    float xpos = x*wSpace;
//    for (int y = 0; y < 12; y++ ) {
//      float ypos = y*hSpace;
//      pushMatrix();
//      translate(xpos, ypos);
////      stroke(128);
//      noStroke();
//      fill(c, 0);
//      rect(0, 0, wSpace, hSpace);
//      popMatrix();
//    }
//  }
//}
//
//void draw() {
//  float wSpace = width/7.0;
//  float hSpace = height/12.0;
//  if (mousePressed == true) {
//  fill(c, 32);
//  float xpos = int(mouseX/wSpace)*wSpace;
//  float ypos = int(mouseY/hSpace)*hSpace;
//  rect(xpos, ypos, wSpace, hSpace);
//  println(xpos);
//  }
//}

class Box {
  float x, y;
  float w, h;
  color c;  //color
  
  // Constructor
  Box( float xpos, float ypos, float wide, float high, color col) {
    x = xpos;
    y = ypos;
    w = wide;
    h = high;
    c = col;
    fill(c);
    rect(x, y, w, h);
//    pushMatrix();
//    translate(xpos, ypos);
//    stroke(128);
//    noStroke();
//    fill(c, 0);
//    rect(0, 0, w, hSpace);
//    popMatrix();
  }
  
  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }
  
  void changeColor() {
    c = color(red(c), green(c), blue(c), alpha(c)+20);
//    noStroke();
    fill(255);
    rect(x, y, w, h);
    fill(c);
    rect(x, y, w, h);
  }
}


