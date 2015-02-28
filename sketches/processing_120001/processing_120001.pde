
void setup()
{
  size(500, 500);
}
void draw()
{
  background(#F5F5F5);

  translate(width/2, height/2);
  float sec = map(second(), 0, 60, 0, 360);
  float min = map(minute(), 0, 60, 0, 360);
  float std = map(hour(), 0, 12, 0, 360);
  println(sec);

  //Sekunden

  pushMatrix();
  rotate(radians(sec));
  translate(0, -180);
  fill(#FFFFFF);
  noStroke();
  rect(0, 0, 2, 180);
  popMatrix();

  //Minuten

  pushMatrix();
  rotate(radians(min));
  translate(0, -180);
  fill(#959595);
  noStroke();
  rect(0, 0, 3, 180);
  popMatrix();

  //Stunde

  pushMatrix();
  rotate(radians(std));
  translate(0, -110);
  fill(#959595);
  noStroke();
  rect(0, 0, 3, 110);
  popMatrix();


  //Nicht Bewegte kleine Rechtecke

  for (int i=0; i<360; i+=5)
  {
    pushMatrix();
    rotate(radians(i));
    translate(0, 215);
    fill(#000000);
    stroke(0);
    line(0, 0, 0, 5);
    popMatrix();
  }

  //Nicht Bewegte Große Rechtecke

  for (int i=0; i<360; i+=30)
  {
    pushMatrix();
    rotate(radians(i));
    translate(0, 200);
    fill(#000000);
    stroke(#000000);
    strokeWeight(0.5);
    rect(0, 0, 20, 30);
    popMatrix();
  }

  //Punkt Mitte
  rect(-3, -1, 7, 7);
}

