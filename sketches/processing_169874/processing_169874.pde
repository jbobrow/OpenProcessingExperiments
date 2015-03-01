
void setup ()
{
  size(500, 500);
  background(0);
  noFill();
  stroke(255);
  smooth();
}

void draw()
{
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  rect(0, 0, 390, 390);
  rect(0, 0, 400, 400);
  fill(255);
  popMatrix();

  pushMatrix();
  float sec = map(second(), 0, 60, 0, 360);
  translate(width/2, height/2);
  rotate(radians(sec));
  rectMode(CENTER);
  line(0, 0, 120, -120);
  println(sec);
  popMatrix();

  pushMatrix();
  float min = map(minute(), 0, 60, 0, 360);
  println(min);
  translate(width/2, height/2);
  rotate(radians(min));
  rectMode(CENTER);
  line(0, 0, 100, -100);
  popMatrix();

  pushMatrix();
  float h = map (hour(), 0, 12, 0, 360);
  println(h);
  translate(width/2, height/2);
  rotate(radians(h));
  rectMode(CENTER);
  line(0, 0, 50, -50);
  popMatrix();

  pushMatrix();
  rect(250, 100, 10, 10);
  rect(250, 400, 10, 10);
  rect(100, 250, 10, 10);
  rect(400, 250, 10, 10);
  fill(0);
  popMatrix();
}

