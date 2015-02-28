
void setup() {
  size(500, 500);
  fill(0);
  smooth();
}

void draw() {
  background(240);
  translate(width/2, height/2); //alles ins Zentum verschieben
  fill(255);
  strokeWeight(20);
  ellipse(0, 0, 330, 330);
  fill(0); 

  strokeWeight(1);

  for (int i=0;i<360;i=i+6)
  {
    pushMatrix();
    rotate(radians(i));
    float radius = 150;
    int laenge = -5;
    if (i==0 | i==90 | i==180 | i ==270) {
      fill(#F5281E);
      rect(-2, radius, 4, -20);
      fill(0);
    }
    else {
      rect(-1, radius, 2, laenge);
    }
    popMatrix();
  }

  pushMatrix();
  float secondeWinkel  = map(second(), 0.0, 60.0, 0.0, 2*PI);
  rotate(secondeWinkel);
  rect(0, 30, 1, -155);

  popMatrix();

  pushMatrix();
  float minuteWinkel  = map(minute(), 0.0, 60.0, 0.0, 2*PI);
  rotate(minuteWinkel);
  rect(0, 0, 3, -115);

  popMatrix();

  pushMatrix();
  float hourWinkel  = map(hour(), 0.0, 12, 0.0, 2*PI);
  rotate(hourWinkel);
  rect(0, 0, 3, -85);

  popMatrix();

  ellipse(0, 0, 10, 10);
}

