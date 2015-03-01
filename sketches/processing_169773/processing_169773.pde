
void setup()
{
  size (400, 400);
  //background (255);
}
void draw()
{
  //ellipse (50, 300, 400, 400);
  background(255);
  float sekunde=map (second(), 0, 59, 0, 2*PI);
  pushMatrix();
  translate (width/2, height/2);
  rotate (sekunde);
  rectMode (CENTER);
  fill (191, 62, 255, 150);
  smooth ();
 ellipse (100, 100, 40, 40);
 //noFill();
 noStroke();
  //fill (191, 62, 255);
  //noFill();
  popMatrix();
  
  float minute1=map(minute(), 0, 59, 0, 2*PI);
  pushMatrix();
  translate (width/2, height/2);
  rotate (minute1);
  rectMode (CENTER);
  fill (255, 0, 255, 130 );
  smooth();
  ellipse (100, 100, 60, 60);
  noStroke ();
  popMatrix();
  
  float hour1=map(hour(), 0, 24, 0, 2*PI);
  pushMatrix();
  translate(width/2, height/2);
  rotate(hour1);
  rectMode (CENTER);
  fill (124, 252, 0, 150);
  smooth();
  ellipse(100, 100, 80, 80);
  noStroke();
  popMatrix();
}
