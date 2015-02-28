
void setup()
{
  size(500, 500);
}

void draw()
{


  translate(width/2, height/2);


  float sec = map(second(), 0, 60, 0, 360);
  float min = map(minute(), 0, 60, 0, 360);
  float std = map(hour(), 0, 12, 0, 360);

  background(255);


  pushMatrix();
  fill(215, 250, 247);
  noStroke();
  ellipse(0, 0, 420, 420);
  popMatrix();

  pushMatrix();
  rotate(radians(sec)); //Um i rotieren
  fill(142, 149, 149);
  translate(0, -210);
  rect(0, 0, 20, 20);
  popMatrix();

  pushMatrix();
  rotate(radians(min));
  translate(0, -200);
  ellipse(0, 0, 10, 10);
  popMatrix();

  pushMatrix();
  rotate(radians(std));
  translate(0, -210);
  stroke(142, 149, 149);
  strokeWeight(3);
  line(0, 0, 0, 20);
  popMatrix();



  for (int i=0; i<360; i+=90)
  {
    pushMatrix();
    rotate(radians(i));
    translate(0, 230);
    fill(0);
    stroke(0);
    ellipse(0, 0, 30, 30);
    popMatrix();
  }
}

