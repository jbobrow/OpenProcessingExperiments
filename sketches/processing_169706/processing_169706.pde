

float xSec, xMin, xHour;
float ySec, yMin, yHour;
color col = #5c4b51;

void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  background(#5c4b51);
  noStroke();
  int second = second();
  int minute = minute();
  int hour = hour()-12;
  fill(#f2625d);
  ellipse (width/2, height/2, 600, 600);
  fill(#8bbeb2);
  arc(width/2, height/2, 300, 300, PI+PI/2, PI+PI/2 + radians(hour)/12*360);

  translate(width/2, height/2);

  // Seconds count
  for (int i = 0; i<60; i++) {
    strokeWeight(20);
    if (i == second) {
      stroke(col);
    } else {
      stroke(#f2625d);
    }
    xSec = sin(PI+i*(-TWO_PI/60))*300;
    ySec = cos(PI+i*(-TWO_PI/60))*300;
    point(xSec, ySec);
  }


  // Minutes count
  for (int i = 0; i<60; i++) {
    strokeWeight(20);
    if (i == minute) {
      stroke(col);
    } else {
      stroke(#f4b658);
    }
    xMin = sin(PI+i*(-TWO_PI/60))*220;
    yMin = cos(PI+i*(-TWO_PI/60))*220;
    point(xMin, yMin);
  }
}



