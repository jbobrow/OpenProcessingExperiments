
// Created by Emily Chang
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP
// Eames House by Charles and Ray Eames

void setup() {
  size(600, 600); 
  noCursor();
}

void draw() {
  if (mouseX<150 && mouseY<150) {
    test(0, 0, 50, 50, 150, 150);
  }
  if (mouseX>150&& mouseX<300 && mouseY<150) {
    test(150, 0, 50, 50, 150, 150);
  }
  if (mouseX>300&& mouseX<450 && mouseY<150) {
    test(300, 0, 50, 50, 150, 150);
  }
  if (mouseX>450&& mouseX<600 && mouseY<150) {
    test(450, 0, 50, 50, 150, 150);
  }
  if (mouseX<150 && mouseY>150&&mouseY<300) {
    test(0, 150, 50, 50, 150, 150);
  }
  if (mouseX>150&& mouseX<300 && mouseY>150&&mouseY<300) {
    test(150, 150, 50, 50, 150, 150);
  }
  if (mouseX>300&& mouseX<450 && mouseY>150 && mouseY<300) {
    test (300, 150, 50, 50, 150, 150);
  }
  if (mouseX>450&& mouseX<600 && mouseY>150 && mouseY<300) {
    test (450, 150, 50, 50, 150, 150);
  }
  if (mouseX<150 && mouseY>300&&mouseY<450) {
    test(0, 300, 50, 50, 150, 150);
  }
  if (mouseX>150&& mouseX<300 && mouseY>300&&mouseY<450) {
    test(150, 300, 50, 50, 150, 150);
  }
  if (mouseX>300&& mouseX<450 && mouseY>300 && mouseY<450) {
    test (300, 300, 50, 50, 150, 150);
  }
  if (mouseX>450&& mouseX<600 && mouseY>300 && mouseY<450) {
    test (450, 300, 50, 50, 150, 150);
  }
  if (mouseX<150 && mouseY>450&&mouseY<600) {
    test(0, 450, 50, 50, 150, 150);
  }
  if (mouseX>150&& mouseX<300 && mouseY>450&&mouseY<600) {
    test(150, 450, 50, 50, 150, 150);
  }
  if (mouseX>300&& mouseX<450 && mouseY>450 && mouseY<600) {
    test (300, 450, 50, 50, 150, 150);
  }
  if (mouseX>450&& mouseX<600 && mouseY>450 && mouseY<600) {
    test (450, 450, 50, 50, 150, 150);
  }
}

void test (int xOrigin, int yOrigin, int xLoc, int yLoc, int mWid, int mHei) {

  fill(xOrigin/3, yOrigin/5, 255-mouseY/3); //blue
  noStroke();
  rect(xOrigin, yOrigin, xLoc, mHei/2); 
  fill(255-xOrigin/2, 255-yOrigin/3, yOrigin/4); //yellow

  rect(xOrigin, yOrigin+mWid/2, mHei, mHei/12);

  fill(255-mouseX/10); //lightgray

  rect(xOrigin+xLoc, yOrigin, yLoc, xLoc);
  rect(xOrigin+xLoc, yOrigin+mWid/12, yLoc, mHei/12);
  rect(xOrigin+xLoc, yOrigin+2*mWid/12, yLoc, mHei/12);
  rect(xOrigin+xLoc, yOrigin+4*mWid/12, yLoc, mHei/12);
  rect(xOrigin+xLoc, yOrigin+5*mWid/12, yLoc, mHei/12);
  rect(xOrigin+xLoc, yOrigin+6*mWid/12, yLoc, mHei/12);
  rect(xOrigin+xLoc, yOrigin+7*mWid/12, yLoc, mHei/12);
  rect(xOrigin+xLoc, yOrigin+8*mWid/12, yLoc, mHei/12);
  rect(xOrigin+xLoc, yOrigin+9*mWid/12, yLoc, mHei/12);
  rect(xOrigin+xLoc, yOrigin+10*mWid/12, yLoc, mHei/12);
  rect(xOrigin+xLoc, yOrigin+11*mWid/12, yLoc, mHei/12);
  rect(xOrigin, yOrigin+7*mWid/12, yLoc, mHei/12);
  rect(xOrigin, yOrigin+8*mWid/12, yLoc, mHei/12);
  rect(xOrigin, yOrigin+9*mWid/12, yLoc, mHei/12);
  rect(xOrigin, yOrigin+10*mWid/12, yLoc, mHei/12);
  rect(xOrigin, yOrigin+11*mWid/12, yLoc, mHei/12);

  fill(mouseX, xOrigin/2, yOrigin/3);//red
  rect(xOrigin+xLoc, yOrigin+3*mWid/12, yLoc, mHei/12);
  rect(xOrigin+xLoc, yOrigin+10*mWid/12, yLoc, mHei/12);
  fill(255); //white
  rect(xOrigin+xLoc, yOrigin+11*mWid/12, yLoc, mHei/12);
  fill(yOrigin+mouseY/5); //black
  rect(xOrigin+xLoc+yLoc, yOrigin, yLoc, mHei/2);
  fill((mouseY+yOrigin)/2.5);
  rect(xOrigin+xLoc+yLoc, yOrigin+7*mWid/12, yLoc, 5*mHei/12);

  stroke(255);
  strokeWeight(1);
  noFill();
  rect(xOrigin, yOrigin, mWid, mHei);
  strokeWeight(1);
  line(xOrigin+xLoc, yOrigin, xOrigin+xLoc, yOrigin+mHei);
  line(xOrigin+xLoc+yLoc, yOrigin, xOrigin+xLoc+yLoc, yOrigin+mHei);
  line(xOrigin, yOrigin+6*mWid/12, xOrigin+mHei, yOrigin+6*mHei/12);
  line(xOrigin, yOrigin+7*mWid/12, xOrigin+mHei, yOrigin+7*mHei/12);
  strokeWeight(1);
  line(xOrigin+xLoc, yOrigin+mWid/12, xOrigin+xLoc+yLoc, yOrigin+mHei/12);
  line(xOrigin+xLoc, yOrigin+2*mWid/12, xOrigin+xLoc+yLoc, yOrigin+2*mHei/12);
  line(xOrigin+xLoc, yOrigin+3*mWid/12, xOrigin+xLoc+yLoc, yOrigin+3*mHei/12);
  line(xOrigin+xLoc, yOrigin+4*mWid/12, xOrigin+xLoc+yLoc, yOrigin+4*mHei/12);
  line(xOrigin+xLoc, yOrigin+5*mWid/12, xOrigin+xLoc+yLoc, yOrigin+5*mHei/12);
  line(xOrigin+xLoc, yOrigin+8*mWid/12, xOrigin+xLoc+yLoc, yOrigin+8*mHei/12);
  line(xOrigin+xLoc, yOrigin+9*mWid/12, xOrigin+xLoc+yLoc, yOrigin+9*mHei/12);
  line(xOrigin+xLoc, yOrigin+10*mWid/12, xOrigin+xLoc+yLoc, yOrigin+10*mHei/12);
  line(xOrigin+xLoc, yOrigin+11*mWid/12, xOrigin+xLoc+yLoc, yOrigin+11*mHei/12);
  line(xOrigin, yOrigin+8*mWid/12, xOrigin+yLoc, yOrigin+8*mHei/12);
  line(xOrigin, yOrigin+9*mWid/12, xOrigin+yLoc, yOrigin+9*mHei/12);
  line(xOrigin, yOrigin+10*mWid/12, xOrigin+yLoc, yOrigin+10*mHei/12);
  line(xOrigin, yOrigin+11*mWid/12, xOrigin+yLoc, yOrigin+11*mHei/12);
}


