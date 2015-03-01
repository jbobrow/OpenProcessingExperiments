
void setup() {
  size(500, 500);
  background(255);
}

void draw () {
  background (0);
  noFill();

  translate(width/2, height/2);


  float sekunde_1 = map(second(), 0, 60, 0, 2*PI);
  float minute_1 = map(minute(), 0, 60, 0, 2*PI);
  float stunde_1 = map(hour(), 0, 12, 0, 2*PI);

  pushMatrix();

  rotate(sekunde_1);
  rectMode(CENTER);

  stroke(255, 100, 0);
  line(0, -180, 0, 0);
  popMatrix();


  pushMatrix();
 
  rotate(minute_1);
  rectMode(CENTER);

  stroke(255);
  line(0, -170, 0, 0);
  popMatrix();

  
  pushMatrix();
  rotate(stunde_1);
  rectMode(CENTER);


  line(0, -110, 0, 0);
  popMatrix();


  pushMatrix();
  ellipse(0, 0, 400, 400);
  ellipse(0, 0, 380, 380);
  translate(120, 100);
  popMatrix();

  for (int i=0; i<360; i+=6) 
  {
    pushMatrix();
    ellipseMode(CENTER);
    rotate(radians(i+3));
    translate(128, 128);
    noStroke();
    fill(255);
    ellipse(0, 0, 3, 3);
    popMatrix();
  }
}

