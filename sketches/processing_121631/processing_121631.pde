
// draw a clock, version 2013-11-22, by Una

color[] beach = {
  #2EABDE, #A7FA69, #FA7A4F, #50FAD4, #E3F0F7, 
  #0C1B3A, #42647D, #D2E8E1, #104A66, #3F95A5
};

PFont font;
float hWeight = 90;
float mWeight = 135;
float sWeight = 190;
float percent, r;
int num;

void setup() {
  size(500, 500);
  smooth();
  r = width*.4; // radius of the clock
  font = loadFont("SourceCodePro-Bold-27.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  frameRate(5);
}

void draw() {
  background(245);
  translate(width/2, height/2);
  
  // draw the back circle
  noFill();
  stroke(beach[8]);    // turn on the stroke
  strokeWeight(4);
  ellipse(0, 0, r*2.01, r*2.01);
  
  // draw the numbers 
  fill(30);
  for (int i = -60; i <= 270; i += 30) {
    num = int(i/30) + 3;
    text(str(num), r*.82*cos(radians(i)), r*.82*sin(radians(i)));
  }
  
  // draw the division
  for (int i = 0; i < 360; i += 6) {
    if (i % 30 == 0) {
      strokeWeight(5);
      percent = .9;
    } 
    else {
      strokeWeight(3);
      percent = .95;
    }
    line(r*percent*cos(radians(i)), r*percent*sin(radians(i)), r*cos(radians(i)), r*sin(radians(i)));
  }
  
  rotate(-PI/2);
  float hAngle = map(hour() % 12, 0, 12, 0, 360);
  float mAngle = map(minute(), 0, 60, 0, 360);
  float sAngle = map(second(), 0, 60, 0, 360);

  // draw the hour, minute, second pointer
  drawPointer(hWeight, hAngle, beach[0]);
  drawPointer(mWeight, mAngle, beach[1]);
  drawPointer(sWeight, sAngle, beach[2]);

  fill(255);
  ellipse(0, 0, 10, 10);

//  manually draw the pointers
//  strokeWeight(hWeight);
//  line(0, 0, 90*cos(radians(hAngle)), 90*sin(radians(hAngle)));
//  strokeWeight(mWeight);
//  line(0, 0, 150*cos(radians(mAngle)), 150*sin(radians(mAngle)));
//  strokeWeight(sWeight);
//  line(0, 0, 210*cos(radians(sAngle)), 210*sin(radians(sAngle)));
}

// function to draw the thin trianle in a specified angle based on origin 
void drawPointer(float d, float angle, color fillColor) {
  noStroke();
  fill(fillColor);
  beginShape();
  vertex(d*cos(radians(angle)), d*sin(radians(angle)));
  vertex(5*cos(radians(angle)+PI*.5), 5*sin(radians(angle)+PI*.5));
  vertex(5*cos(radians(angle)+PI*1.5), 5*sin(radians(angle)+PI*1.5));
  endShape(CLOSE);
}



