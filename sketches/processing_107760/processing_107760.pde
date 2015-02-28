
/* Animated & interactive MODVJ logo
 by Alex Roff
 - - - - - - -  - - - - - - - - - - -
 http://modvj.com
 */

void setup() {
  size(1280, 800);
  background(0, 0);
  colorMode(HSB);
  frameRate(15);
  smooth();
}

void mouseMoved() {
  logotype();
}

void logotype() {
  pushMatrix();
  translate(mouseX, mouseY);
  
  int n;
  
  if (mousePressed==true) {
    scale(1.5);
  }
  else {
    n=0;
  }

  line(105, -46, 78, -46);
  line(78, -46, 65, -23);

  line(40, 21, 52, 42);
  line(52, 42, 78, 42);

  line(-40, 72, -26, 95);
  line(-26, 95, 26, 95);
  line(26, 95, 52, 138);
  line(52, 138, 52, 138);
  line(52, 138, 52, 138);
  line(52, 138, 52, 138);
  line(52, 138, 78, 138);
  line(78, 138, 78, 138);

  line(107, 50, 78, 50);
  line(78, 50, 65, 72);

  line(25, 50, 52, -2);
  line(52, -2, 78, 42);
  line(78, 42, 91, 19);
  line(91, 19, 105, -2);
  line(105, -2, 157, 95);
  line(157, 95, 171, 72);
  line(171, 72, 105, -46);
  line(105, -46, 78, 0);
  line(78, 0, 52, -46);

  line(91, 20, 118, 72);
  line(118, 72, 91, 72);
  line(91, 72, 78, 94);
  line(78, 94, 52, 50);
  line(52, 50, 0, 50);
  line(0, 50, 52, -46);
  line(52, -46, 26, -46);
  line(26, -46, -40, 72);
  line(-40, 72, 39, 72);
  line(39, 72, 78, 138);
  line(78, 138, 104, 95);
  line(104, 95, 157, 95);
  popMatrix();
}

void draw() {
  fill(0, 10);
  noStroke();
  rect(0, 0, 1280, 800);
  strokeWeight(1);
  stroke(random(255), 255, 255);
  logotype();
}



