
void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);
  translate(width/2, height/2);
  fill(0);
  noStroke();

  pushMatrix();
  rectMode(CENTER);
  rect(0, -200, 10, 30);
  rotate(radians(-90));
  rect(0, 200, 10, 30);
  rotate(radians(90));
  rect(0, 200, 10, 30);
  rotate(radians(90));
  rect(0, 200, 10, 30);
  popMatrix();

  ellipse(0, 0, 20, 20);

  float sekunde = map(second(), 0, 59, 0, 2*PI);
  println(sekunde);

  pushMatrix();
  rotate(sekunde);
  stroke(255, 0, 0);
  line(0, 0, 0, -180);
  popMatrix();
  
    float minute1 = map(minute(), 0, 59, 0, 2*PI);
  println(minute1);

  pushMatrix();
  rotate(minute1);
  stroke(0);
line(0,0,0,-160);
  popMatrix();
  
      float stunde1 = map(hour(), 0, 24, 0, 4*PI);
  println(stunde1);

  pushMatrix();
  rotate(stunde1);
  stroke(0);
line(0,0,0,-120);
  popMatrix();
}

