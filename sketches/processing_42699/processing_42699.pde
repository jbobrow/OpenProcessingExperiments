
float x, y;





void setup() {
  background(255);
  size(600, 600);
  smooth();
}


void draw() {
  fill(255, 0, 0, 20);
  float mil = millis();
  noStroke();
  fill(mil % 400);
  rect(0, 0, 600, 600);
  



  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23

  strokeWeight( 8);
  noFill();
  stroke(0, 174, 239);
  arc(s+x, 125, 200, 200, PI+HALF_PI, TWO_PI+HALF_PI );
  stroke(236, 0, 140);
  arc(m+x+50, 275, 200, 200, HALF_PI, PI+HALF_PI);
  stroke(255, 242, 0);
  arc(h+x+50, 450, 200, 200, PI+HALF_PI, TWO_PI+HALF_PI );
}


