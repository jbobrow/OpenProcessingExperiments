
void setup () {
  smooth();
  size (600, 600);
  

}

void draw () {

  background (0);

  //Hours ring
  stroke (200, 0, 0);
  strokeWeight (2);
  noFill();
  ellipse (width/2, height/2, width -100, height - 100);

  //Minutes ring
  stroke (0, 200, 0);
  strokeWeight (2);
  noFill();
  ellipse (width/2, height/2, width -200, height - 200);

  //Seconds ring
  stroke (0, 0, 200);
  strokeWeight (2);
  noFill();
  ellipse (width/2, height/2, width -300, height - 300);

  time();
}

void time () {
  float h = hour ();
  float m = minute ();
  float s = second ();

  float radiusHour = map(h, 0, 12, 0, 360);
  float radiusMinute = map (m, 0, 60, 0, 360);
  float radiusSecond = map (s, 0, 60, 0, 360);

  //Minutes
  pushMatrix();
  translate (width/2, height/2);
  rotate(radians(270 + radiusMinute));
  noStroke();
  fill (200,0,0);
  rect (250, 0, -250, -15);
  popMatrix();

  //hours
  pushMatrix();
  translate (width/2, height/2);
  rotate (radians (270+ radiusHour));
  noStroke();
  fill(0, 200, 0);
  rect (200, 0, -200, 15);
  popMatrix();

  //seconds
  pushMatrix();
  translate (width/2, height/2);
  rotate(radians(270 + radiusSecond));
  noStroke();
  fill (0, 0, 200);
  ellipse (150, 0, 30, 30);
  popMatrix();
}

