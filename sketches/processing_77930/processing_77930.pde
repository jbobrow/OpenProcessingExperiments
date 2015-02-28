
PFont font; 


void setup() {
  size(666, 666, P3D);
  background(255);
  frameRate(24);
  font = loadFont("HelveticaNeue-UltraLight-48.vlw");
}
void draw() {

  textFont(font, 32);
  fill(0);
  text("archival c-print, 2012", 200, 575);

  if (mousePressed == true) {
    fill(0);
    noStroke();
  }
  else {
    fill(255);
    stroke(0);
  }
  rect(205, 115, 70, 300);
  rect(280, 150, 70, 300);
  rect(355, 120, 70, 300);
  rect(430, 155, 70, 300);

  if (mousePressed == true) {
    fill(255);
    stroke(0);
  }
  else {
    fill(0);
    noStroke();
  }
  rect(170, 150, 70, 300);
  rect(245, 185, 70, 300);
  rect(320, 155, 70, 300);
  rect(395, 180, 70, 300);
}




