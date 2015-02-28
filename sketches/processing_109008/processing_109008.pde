

color BG=color(255, 255, 255);
PImage DIAL;

void setup() {
  size(400, 400);
  colorMode(RGB, 255, 255, 255, 100);
  background(BG);
  frameRate(1);
  DIAL=loadImage("aaa.jpg");
}


void draw() {
  background(BG);

  int h = hour();
  int m = minute();
  int s = second();
  stroke(0);
  image(DIAL, 0, 0);


  strokeWeight(5);
  stroke(#CB657D);
  pushMatrix();
  translate(width/2, height/2);
  rotate((h%12+m/60.0)*TWO_PI/12);
  line(0, 0, 0, -60);
  popMatrix();
  strokeWeight(3);
  pushMatrix();
  translate(width/2, height/2);
  rotate((m+s/60.0)*TWO_PI/60);
  line(0, 0, 120, -80);
  popMatrix();

  strokeWeight(2);
  stroke(#CB657D);
  pushMatrix();
  translate(width/2, height/2);
  rotate(s*TWO_PI/60);
  line(0, 0, 100, -90);
  popMatrix();
}



