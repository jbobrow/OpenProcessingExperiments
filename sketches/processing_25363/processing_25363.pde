
int circleSize = 10;
int shrinkOrGrow = 1;

void setup() {
  size(430, 430);
  background(255);
  smooth();
  noStroke();
  frameRate(20);

  PFont font1;
  
  //First Square
  fill(0, 0, 51);
  rect(10, 10, 200, 200);
  
  font1 = loadFont("Tahoma-80.vlw");
  textFont(font1);
  fill(255);
  text("A", 15, 55);
  text("M", 42, 60);
  text("K", 145, 200);
  text("R", 70, 133);
  text("X", 170, 160);
  text("J", 8, 203);
  fill(255, 204, 0);
  text("E", 160, 90);
  fill(0, 204, 204);
  text("K", 15, 130);
  fill(255, 0, 102);
  text("I", 125, 193);
  
  //Second Square
  fill(255, 204, 0);
  rect(220, 10, 200, 200);
  
  pushMatrix();
    fill(0, 0, 51);
    triangle (320 , 10,  270, 110,  370 , 110);  
    translate(0, 100);
    triangle (320 , 10,  270, 110,  370 , 110);  
  popMatrix();
  
  //Third Square
  fill(255, 0, 102);
  rect(10, 220, 200, 200);
  
  pushMatrix();
    translate(120, 290);
    for (int i=0; i<50; i++) { 
      rotate(PI/10);
      fill(255);
      scale(0.9);
      rect(30, 30, 10, 80);
    }
  popMatrix();
  
  //Fourth Square
  fill(0, 204, 204);
  rect(220, 220, 200, 200);
  
  fill(255);
  font1 = loadFont("Tahoma-80.vlw");
  textFont(font1);
  text("hell", 232, 340);
}

void draw() {
  
  translate(380, 317);
  stroke(255);
  strokeWeight(6);
 
  if (circleSize > 43) {
    shrinkOrGrow = 0;
  } else if (circleSize < 21) {
    shrinkOrGrow = 1;
  } if (shrinkOrGrow == 1) {
    circleSize += 1;
  } else if (shrinkOrGrow == 0) {
    circleSize -= 1;  
  }

  fill(0, 204, 204);
  ellipse(0, 0, circleSize, circleSize);

}

