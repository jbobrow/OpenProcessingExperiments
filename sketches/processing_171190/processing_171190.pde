
void setup()
{
  size(500, 500);
  //stroke(46, 204, 113);
  //background (211, 84, 0);
}

void draw()
{
  background (211, 84, 0);


  //StundenblÃ�Â¤tter

  pushMatrix();
  translate(width/2, height/2);
  ellipseMode(CENTER);
  fill(44, 62, 80);
  ellipse(170, 0, 10, 10);
  ellipse(-170, 0, 10, 10);
  ellipse(0, 170, 10, 10);
  ellipse(0, -170, 10, 10);
  popMatrix();



  //Sekunde
  float sekunde = map(second(), 0, 59, 0, 2*PI);
  pushMatrix();
  translate(width/2, height/2);
  rotate(sekunde);
  noStroke();
  ellipseMode(CENTER);
  fill(241, 196, 15);
  ellipse(0, -150, 70, 70);
  popMatrix();

  //MILLIS

  float Milf = map(millis(), 0, 60, 0, 2*PI);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(Milf));
  noStroke();
  ellipseMode(CENTER);
  fill(155, 89, 182);
  ellipse(0, -220, 50, 50);
  popMatrix();

  //STUNDE 
  float stunde = map(hour(), 0, 23, 0, 2*PI);
  pushMatrix();
  fill(52, 152, 219);
  translate(width/2, height/2);
  rotate(stunde);
  rectMode(CENTER);
  rect(0, 0, 150, 150);
  rectMode(CORNER);
  fill(41, 128, 185);
  rect(-5, -75, 10, 40);
  popMatrix();  

  //MINUTE
  float mimi = map(minute(), 0, 59, 0, 160);
  pushMatrix();
  fill(231, 76, 60);
  translate(width/2, height/2);
  ellipseMode(CENTER);
  ellipse(0, 0, mimi, mimi);
  popMatrix();
}

