
void setup()
{
  size(500, 500);
  background(255);
  smooth();
}
void draw()
{
  background(255);
  translate(width/2, height/2);
  fill(240);
  strokeWeight(15);
  stroke(0);
  ellipse (0, 0, 450, 450);

  //Punkte für Stunden, die nicht durch 3 teilbar sind
  for (int i=0; i<360; i+=30)
  {
    pushMatrix();
    rotate(radians(i));
    translate(0, 200);
    noStroke();
    fill(200);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
  //Punkte für Stunde 3, 6, 9, 12, ...
  for (int i=0; i<360; i+=90)
  {
    pushMatrix();
    rotate(radians(i));
    translate(0, 200);
    noStroke();
    fill(0);
    ellipse(0, 0, 15, 15);
    popMatrix();
  }
  for (int i=0; i<360; i+=6)
  {
    //Stundenzeiger
    pushMatrix();
    rotate(radians(30*hour()-90));
    strokeWeight(7);
    stroke(0);
    line(0, 0, 100, 0);
    line(0, 0, -30, 0);
    popMatrix();

    //Minutenzeiger
    pushMatrix();
    rotate(radians(6*minute()-90));
    strokeWeight(5);
    stroke(0);
    line(0, 0, 180, 0);
    line(0, 0, -30, 0);
    popMatrix();

    //Sekundenzeiger
    pushMatrix();
    rotate (radians (6*second()-90));
    stroke(255, 0, 0);
    strokeCap(SQUARE);
    strokeWeight(2);
    line(0, 0, 200, 0);
    line(0, 0, -50, 0);
    popMatrix();
  }
  noStroke();
  fill(255, 0, 0);
  ellipse (0, 0, 20, 20);
}

