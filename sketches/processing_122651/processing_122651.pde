
void setup ()
{
  size (550, 550);
}
void draw()
{
  background(#182776);
  translate(width/2, height/2);
  if (hour()>= 6 && hour() < 9)
  {
    fill(#F5B70C);
    background(#EBD807);
    ellipse(-45, 30, 20, 20);
  }
  if (hour()>= 9 && hour() < 12)
  {
    fill(#F5B70C);
    background(#EBD807);
    ellipse(-18, 5, 20, 20);
  }
  if (hour()>= 12 && hour() < 15)
  {
    fill(#F5B70C);
    background(#17B0E5);
    ellipse(24, 5, 20, 20);
  }
  if (hour()>=15 && hour() < 18)
  {
    fill(#F5B70C);
    background(#17B0E5);
    ellipse(51, 30, 20, 20);
  }
  if (hour()>= 18 && hour() < 6)
  {
    //fill(#868686);
    fill(#17B0E5);
    translate(0,0);
    background(#182776);
    ellipse(-18, 5, 20, 20);
    ellipse(-45, 30, 20, 20);
    ellipse(24, 5, 20, 20);
    ellipse(51, 30, 20, 20);
  }
    fill(#868686);
    ellipse(-18, 5, 20, 20);
    ellipse(-45, 30, 20, 20);
    ellipse(24, 5, 20, 20);
    ellipse(51, 30, 20, 20);

  //  Pfeile
  translate(0, 0);
  fill(#FFFFFF);
  textSize(24);

  //  Nordpfeil
  triangle(-10, 215, 0, 245, 10, 215);
  text("N", -10, 245, 80, 80);

  //  Ostpfeil
  triangle(-215, -10, -245, 0, -215, 10);
  text("O", -270, -14, 80, 80);

  //  Südpfeil
  triangle(-10, -215, 0, -245, 10, -215);
  text("S", -7, -273, 80, 80);

  //  Westpfeil
  triangle(215, -10, 245, 0, 215, 10);
  text("W", 250, -14, 80, 80);

  for (int i=0; i<360; i+=6) {
    pushMatrix();
    rotate(radians(i));
    translate(0, 200);
    stroke(#000000);
    noFill();
    ellipse(0, 0, 15, 15);
    popMatrix();
  }

  //Sekunden

  float sec = map(second(), 0, 60, 0, 360);

  pushMatrix();
  rotate(radians(sec));
  translate(0, -200);
  fill(#000000);
  ellipse(0, 0, 15, 15);
  noStroke();
  popMatrix();

  //Minuten

  float min = map(minute(), 0, 60, 0, 360);

  pushMatrix();
  rotate(radians(min));
  translate(0, -170);
  stroke(#000000);
  fill(#AFADAD);
  ellipse(0, 0, 30, 30);
  noStroke();
  popMatrix();

  //Stunden

  float std = map(hour(), 0, 12, 0, 360);

  pushMatrix();
  rotate(radians(std));
  translate(0, -130);
  stroke(#000000);
  fill(#585858);
  ellipse(0, 0, 45, 45);
  noStroke();
  popMatrix();
}
