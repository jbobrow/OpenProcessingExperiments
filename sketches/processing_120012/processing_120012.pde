
void setup ()
{
  size (500, 500);
}
void draw()
{
  background(#954B4B);

  translate(width/2, height/2);
  for (int i=0; i<360; i+=10) {
    pushMatrix();
    rotate(radians(i));
    translate(0, 200);
    fill(#000000);
    ellipse(0, 0, 15, 15);
    popMatrix();
  }

  //Sekunden

  float sec = map(second(), 0, 60, 0, 360);
  println(sec);  

  pushMatrix();
  rotate(radians(sec));
  translate(0, -180);
  fill(#EAEAEA);
  ellipse(0, 0, 15, 15);
  noStroke();
  popMatrix();

  //Minuten

  float min = map(minute(), 0, 60, 0, 360);
  println(min);

  pushMatrix();
  rotate(radians(min));
  translate(0, -150); 
  fill(#AAAAAA);
  ellipse(0, 0, 30, 30);
  noStroke();
  popMatrix();

  //Stunden

  float std = map(hour(), 0, 12, 0, 360);
  println(std);

  pushMatrix();
  rotate(radians(std)); 
  translate(0, -130);
  fill(#717171);
  ellipse(0, 0, 45, 45);
  noStroke();
  popMatrix();
}

