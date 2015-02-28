
//Geoffrey Matheson
//MassArt

//Clock v1

int s;
int m;
int h;


void setup () {
  size (500,500);
  colorMode(HSB,100);
  background(0,0,100);
  smooth();
}


void draw() {
  s=second();
  m=minute();
  h=hour();

  if (h > 12) {
  h -=12;
  }
  
  translate(250,250);
  rotate(radians(90));
  noFill();
  
  //preload second hand
  for (int i = 0; i < s; i++) {
    strokeWeight(2);
    stroke(100, 70,70);
    pushMatrix();
    rotate(radians(6*i));
    line(-25,0, -50,0);
    popMatrix();
  }
  
  //preload minute hand
  for (int f = 0; f < m; f++) {
    strokeWeight(5);
    stroke(50, 70,70);
    pushMatrix();
    rotate(radians(6*f));
    line(-60,0, -90,0);
    popMatrix();
  }
  
  //preload hour hand
  for (int k = 0; k < h; k++) {
    strokeWeight(8);
    stroke(80, 70,70);
    pushMatrix();
    rotate(radians(30*k));
    line(-100,0, -150,0);
    popMatrix();
  }

  //hour hand
  if (h==0) {
    noStroke();
    fill(0,0,100);
    ellipse(0,0,230,230);
  } else {
    noFill();
    strokeWeight (8);
    stroke (80,70,70);
    pushMatrix();
    rotate(radians(30*h));
    line(-100,0,-150,0);
    popMatrix();

  }
  
  //minute hand
  
  if (m==0) {
    noStroke();
    fill(0,0,100);
    ellipse(0,0,190,190);
  } else {
    noFill();
    strokeWeight (5);
    stroke (50,70,70);
    pushMatrix();
    rotate(radians(6*m));
    line(-60,0,-90,0);
    popMatrix();
  }
  
  //second hand
  if (s==0) {
    noStroke();
    fill(0,0,100);
    ellipse(0,0,110,110);
  } else {
  strokeWeight(2);
  stroke(100, 70,70);
  pushMatrix();
  rotate(radians(6*s));
  line(-25,0, -50,0);
  popMatrix();
  }
}



