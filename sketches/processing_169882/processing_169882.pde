
void setup()
{
  size(500, 500);
  background(255,236,139);
  //background(176,226,255);
}

void draw()
{
  pushMatrix();
  translate(width/2, height/2);
  noStroke();
  fill(238,220,130);
  rectMode(CENTER);
  rect(0, 0, 400, 400);
  popMatrix();


  pushMatrix();
  fill(255);
  stroke(0);
  rect(245, 50, 10, 50);
  popMatrix();

  pushMatrix();
  fill(255);
  rect(50, 245, 50, 10);
  popMatrix();
 

  pushMatrix();
  fill(255);
  rect(450, 245, 50, 10);
  popMatrix();

  pushMatrix();
  fill(255);
  rect(245, 450, 10, 50);
  popMatrix();


  float sekunde_jetzt = map(second(), 0, 59, 0, 2*PI);

  pushMatrix();
  translate(width/2, height/2);
  //fill(0);
  stroke(0);
  rotate(sekunde_jetzt);
  line(0, 0, 0, -170);
  popMatrix();

  float minute_jetzt = map(minute(), 0, 59, 0, 2*PI);

  pushMatrix();
  translate(width/2, height/2);
  stroke(0);
  rotate(minute_jetzt);
  line(0, 0, 0, -150);
  popMatrix();

  float stunde_jetzt = map(hour(), 0, 12, 0, 2*PI);

  pushMatrix();
  translate(width/2, height/2);
  stroke(0);
  rotate(stunde_jetzt);
  line(0, 0, 0, -90);
  popMatrix();
}

