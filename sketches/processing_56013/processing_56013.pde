
float angle = 0.0;
float x = -50.0;
float y = 35;
float c = 10.0;

void setup () {
  size(350, 250);
  background (#163548);
  smooth();
  noStroke();
    fill(255);
}

void draw () {
  x = x + 0.3;
 if (x > - 10) {
    x = - 150;
 }
 y = y - 0.053;
if (y < 1) {
   y = 1;
}
  frameRate(30);
  fill(#163548,50);
  rect (0, 0, 350, 350);
  fill(255);
  angle = angle + 0.02;
  translate (175, 125);
  rotate (angle);
 
  ellipseMode (CENTER);
  ellipse(x+50, 40, y, y);
  ellipse(x+50, 80, y, y);
  ellipse(x+50, 120, y, y);
}

