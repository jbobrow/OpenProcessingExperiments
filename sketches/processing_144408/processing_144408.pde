
/*
Konkuk University
SOS iDesign

Name: Kim Hyun Gi
ID: hyungi216

*/

void setup() {
  size(600, 600);
  background(120);
  smooth();
}

void draw() {
  background(0);

  for (int i = 0; i-20 < width-1; i = i + 30) {
    for (int j = 0; j-20 < height-1; j = j + 30) {
      stroke(255);
      strokeWeight(20);
      ellipse(i, j, 20, 20);
    }
  }


  noFill();
  strokeWeight(10);
  stroke(#43C3E5);

  arc(width/2, height/2, 50, 50, -HALF_PI, radians(30*hour())-HALF_PI);
  stroke(#F8FF48);
  arc(width/2, height/2, 130, 130, -HALF_PI, radians(6*minute())-HALF_PI);
  stroke(#FF5858);
  arc(width/2, height/2, 400, 400, -HALF_PI, radians(6*second())-HALF_PI);

  time(300, 435);
}

void time(float x, float y)
{


  fill(255-(hour()*10.625));
  textAlign(CENTER);
  textSize(40);
  fill(0);
  text(second(), x+60, y);
  fill(0);
  text(minute(), x, y);
  fill(0);
  text(hour(), x-60, y);
}



