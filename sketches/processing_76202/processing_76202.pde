
// Oliver Haimson 
// Assignment 08B
// Copyright 2012

float myArray[] = {
  random(255), random(255), random(255), random(255), random(255)
};

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  background(0);
}

void draw() {
  background(0);
  fill(myArray[0]);
  ellipse(20, 20, 20, 20);
  fill(myArray[1]);
  ellipse(40, 40, 40, 40);
  fill(myArray[2]);
  ellipse(80, 80, 80, 80);
  fill(myArray[3]);
  ellipse(160, 160, 160, 160);
  fill(myArray[4]);
  ellipse(320, 320, 320, 320);
  for (int i=0; i<myArray.length; i++) {
    if (myArray[i] < 255) {
      myArray[i]++;
    }
    else {
      myArray[i]=0;
    }
  }
}
